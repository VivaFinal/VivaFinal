package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.dao.face.CartDao;
import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceDown;
import web.dto.Users;
import web.service.face.CartService;

@Service
public class CartServiceImpl implements CartService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CartDao cartDao;
	
//======================================================================================================
	@Override
	public List<Map<String,Object>> getCartList(Cart userNo) {
		logger.info("getList()");
		  
		  
		return cartDao.selectCartByUserno(userNo);
	}
	
//======================================================================================================
	@Override
	public boolean deleteCartItem(Cart cartNo) {
		logger.info("deleteCartItem()");
		
		
		return cartDao.deleteCartByCartNo(cartNo);
	}
	
//======================================================================================================
	@Override
	public boolean addCartItem(Cart add) {
		logger.info("addCartItem()");
		
		//장바구니 항목 중복 검사하기
		int res = 0;
		res = cartDao.selectDuplicatedCartByUserNo(add);
		logger.info("중복여부 : {}", res);
		
		if(res==0) {
			logger.info("중복아님 :{}", res);
			cartDao.insertCartItem(add);
			logger.info("장바구니 담았숩니당");
			return true;
		}
		//중복일 경우... false 만이 존재한다.
		logger.info("중복이다 : {}", res);
		return false;
	}
	
//======================================================================================================
	
	//음원 소스의 총계를 전역변수로 지정해서 다른 메소드에서도 쓸수 있게 선언했다.
	int price = 0;
//	private Credit credit;
	
	@Override
	public boolean chkCreditAcc(Users userNo, Source sourceNo) {
		
		logger.info("chkCreditAcc()");
		
		//회원 크레딧 잔액 구하기 (null 일 경우 0 으로 반환)
		int res = 0; 
		res = cartDao.selectCreditAcc(userNo);
		logger.info("credit rest : {}", res);
		
		//비교대상 : 구매할 음원의 총계 select 하기 (현재는 한개항목에 대한 경우만 구해놨음..)
		//(null 일 경우(source가 삭제되거나 유효하지 못한 경우가 됐을때) 0 으로 반환)
		price = cartDao.selectSourceAmount(sourceNo);
		logger.info("total price : {}", price);
		
		//sourceNo 이 없는 경우 null 은 0 이 뜨므로 아래 코드가 검증이 안되는 경우가 생김.
		//sourceNo 여러개가 넘어왔을때, 각 sourceNo의 유효성을 검증하는 코드를 하나 써놔야함.
		//근데 아직 배열로 숫자가 넘어오는 방법을 안썼기에 일단은 보류.
		
		//크레딧잔액 ><= 비교대상 크고 작기에 대한 결과 구하기
		if(res>0 && res>price) {
			logger.info("1. 금액 비교 가능&구매항목보다 잔고가 있을때");
			return true;
			
		} else if (res>0 && res==price) {
			logger.info("2. 금액 비교 가능&구매항목에 딱 맞게 잔고가 있을때");
			return true;

		} else {
			logger.info("3. 크레딧 잔고 부족 or 소스 구매 불가");
			return false;
		}
	}
	
  @Transactional
  @Override
	public boolean purchaseCartItem(Users userNo, Source sourceNo, Cart cartNo) {
		logger.info("purchaseCartItem()");
    
		//1. 구매자 크레딧 지출하기
		//크레딧DTO 초기화
		Credit credit = new Credit();
		//지출내역 만들 회원, 금액 설정
		credit.setUserNo(userNo.getUserNo());
		credit.setAmount(price);
		logger.info("지출대상 회원 : {}", credit.getUserNo());
		logger.info("지출할 금액 : {}", credit.getAmount());
  
		cartDao.expenditureCredit(credit);
		logger.info("크레딧 삭감");

		//2. 장바구니에서 해당 항목 삭제하기 (현재는 한개씩 지정했을때 경우만 구현해놨음..ㅠㅠ)
		cartDao.deletePurchasedCartItem(cartNo);
		logger.info("Cart 구매항목 삭제 : {}", cartNo);
		
		
		//3. 음원 다운로드 정보 생성하기
		SourceDown downSource = new SourceDown();
		downSource.setUserNo(userNo.getUserNo());
		downSource.setSourceNo(sourceNo.getSourceNo());
		logger.info("회원번호 : {}", downSource.getUserNo());
		logger.info("다운로드 소스번호 : {}", downSource.getSourceNo());
		
		cartDao.addSourceToDownList(downSource);
		logger.info("음원 다운로드 정보 추가 {}", downSource);
		
		
		//4. 나의 음원 구매내역에 추가하기
		//4-1. 우선 음원번호로 음원 정보 부르기 (채원님 코드 활용)
		Source buySource = cartDao.selectSourceBySourceNo(sourceNo.getSourceNo());
		//4-2. 나의 음원 구매내역에 select 된 음원 정보 집어넣기
		MySource mySourceList = new MySource();


		mySourceList.setUserNo(userNo.getUserNo());
		mySourceList.setSourceNo(sourceNo.getSourceNo());
		try {
			mySourceList.setBpm(buySource.getBpm());
			mySourceList.setKey(buySource.getKey());  
			mySourceList.setPackNo(buySource.getPackNo());
			mySourceList.setSourceName(buySource.getSourceName());
			mySourceList.setTagNo(buySource.getTagNo());
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		logger.info("내 목록에 추가될 음원 {}", mySourceList);
		
		//채원 코드 활용
		cartDao.insertMySource(mySourceList);
		logger.info("내 음원 목록에 추가 완료");
		
		
		//5. 사운드 디자이너에게 수익금 분배
		//구매할 음원 총계 - 10% = 업로더 수입 크레딧 내역
		int revenue = (int) (price * 0.9);
		logger.info("업로더에게 전달될 수입 : {}", revenue);
		
		Credit uploaderInc = new Credit();
		//업로더의 회원번호 : 구매할 sourceNo의 Source Tb에 있는 user_no 으로 검색
		uploaderInc.setUserNo(buySource.getUserNo());
		uploaderInc.setDealCategory(3);
		uploaderInc.setAmount(revenue);
		
		cartDao.uploaderIncomeCredit(uploaderInc);
		
		//트랜잭션 완료 했음.... 근데 어떻게 알지?
		logger.info("트랜잭션 5단계 거쳤는데.. 과연 결과는?");
		
		return true;
  }

}