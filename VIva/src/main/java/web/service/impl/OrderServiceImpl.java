package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import web.dao.face.OrderDao;
import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceDown;
import web.dto.SourceFileInfo;
import web.dto.Tag;
import web.dto.Users;
import web.service.face.OrderService;

@Service
public class OrderServiceImpl implements OrderService { 
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired OrderDao orderDao;

	//채원의 코드
	@Override
	public SourceFileInfo getFile(int sourceNo) {
		return orderDao.selectSourceFileBysourceNo(sourceNo);
	}
	
	@Override
	public boolean checkSource(MySource source, Users user) {
		
		logger.info("sourceNo : {}", source);
		source.setUserNo(user.getUserNo());
		
		int chk = orderDao.selectSourceChkByUsernoSourceNo(source);
		
		logger.info("chk 숫자 확인 : {}", chk);
		
		if (chk > 0) {return true;} 
		
		return false;
	
  }

	
}
	
	//======================================================================================================

	//지선의 코드
	
	//음원 소스의 총계를 전역변수로 지정해서 다른 메소드에서도 쓸수 있게 선언했다.
	int price = 0;
//	private Credit credit;
	
	@Override
	public boolean chkCreditAcc(Users userNo, Source sourceNo) {
		
		logger.info("chkCreditAcc()");
		
		//회원 크레딧 잔액 구하기 (null 일 경우 0 으로 반환)
		int res = orderDao.selectCreditAcc(userNo);
		logger.info("credit rest : {}", res);
		
		//비교대상 : 구매할 음원의 총계 select 하기 (현재는 한개항목에 대한 경우만 구해놨음..)
		//(null 일 경우(source가 삭제되거나 유효하지 못한 경우가 됐을때) 0 으로 반환)
		price = orderDao.selectSourceAmount(sourceNo);
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
	
  @Override
	public boolean checkCredit(Users userNo) {
		
		logger.info("userNo 확인 {}",userNo);
		
		int credit = orderDao.selectCreditAcc(userNo);
		
		logger.info("credit : {}", credit);

		if( credit > 30 ) {
			return true;
		}
		return false;
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
  
		orderDao.expenditureCredit(credit);
		logger.info("크레딧 삭감");

		//2. 장바구니에서 해당 항목 삭제하기 (현재는 한개씩 지정했을때 경우만 구현해놨음..ㅠㅠ)
		orderDao.deletePurchasedCartItem(cartNo);
		logger.info("Cart 구매항목 삭제 : {}", cartNo);
		
		
		//3. 음원 다운로드 정보 생성하기
		SourceDown downSource = new SourceDown();
		downSource.setUserNo(userNo.getUserNo());
		downSource.setSourceNo(sourceNo.getSourceNo());
		logger.info("회원번호 : {}", downSource.getUserNo());
		logger.info("다운로드 소스번호 : {}", downSource.getSourceNo());
		
		orderDao.addSourceToDownList(downSource);
		logger.info("음원 다운로드 정보 추가 {}", downSource);
		
		
		//4. 나의 음원 구매내역에 추가하기
		//4-1. 우선 음원번호로 음원 정보 부르기 (채원님 코드 활용)
		Source buySource = orderDao.selectSourceBySourceNo(sourceNo.getSourceNo());
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
		orderDao.insertMySource(mySourceList);
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
		
		orderDao.uploaderIncomeCredit(uploaderInc);
		
		//트랜잭션 완료 했음.... 근데 어떻게 알지?
		logger.info("트랜잭션 5단계 거쳤는데.. 과연 결과는?");
		
		return true;
  }
  
  
  
  
  

	@Override
	public void intoMySource(MySource source) {
		
		//음원소스번호, 회원번호를 이용한다
		Source buySource = orderDao.selectSourceBySourceNo(source.getSourceNo());
		
		try {
			source.setBpm(buySource.getBpm());
			source.setKey(buySource.getKey());
			source.setPackNo(buySource.getPackNo());
			source.setSourceName(buySource.getSourceName());
			source.setTagNo(buySource.getTagNo());
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
		logger.info("사려는 음원 {}", source);
		
		orderDao.insertMySource(source);
		
	}

	@Override
	public void intoSourceDown(MySource source) {
		
		SourceDown down = new SourceDown();
		down.setSourceNo(source.getSourceNo());
		down.setUserNo(source.getUserNo());
		
		logger.info("다운로드 정보 : {}", down);
	
		orderDao.insertSourceDown(down);
		
	}

	@Override
	public void intoCredit(MySource source) {
		
		// 지출 크레딧 삽입
		Credit pay = new Credit();
		pay.setUserNo(source.getUserNo());
		pay.setAmount(30);
		pay.setDealCategory(2);
		
		orderDao.insertCreditPay(pay);
		logger.info("pay : {}", pay);
		
		// 수입 크레딧 삽입
		Credit income = new Credit();
		
		// 수입 업로더 정보 조회
		Source insource = orderDao.selectSourceBySourceNo(source.getSourceNo());
		
		income.setAmount(27);
		income.setDealCategory(3);
		
		// 업로드한 회원 입력
		income.setUserNo(insource.getUserNo());
		
		orderDao.insertCreditIncome(income);
		logger.info("income : {}", income);
	}

	@Override
	public Tag getGenre(int source) {
		
		Source get = orderDao.selectSource(source);
		
		Tag tag = orderDao.selectTagBySourceNo(get.getTagNo());
		
		return tag;
	}
}
