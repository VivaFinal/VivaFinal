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
import web.dto.SourceFileInfo;
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
	public boolean checkSource(MySource source) {
		
		logger.info("sourceNo : {}", source);
		
		int chk = orderDao.selectSourceChkByUsernoSourceNo(source);
		
		logger.info("chk 숫자 확인 : {}", chk);
		//채원님 작성한 메소드가 자꾸 에러가 나서 return 타입 적어놨음.
		return false;
    
  }
	
	@Override
	public boolean checkCredit(int userNo) {
		
		logger.info("userNo 확인 {}",userNo);
		
		int[] credit = orderDao.selectCreditByUserNo(userNo);
		
		logger.info("credit : {}", credit);
		
		return false;
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
	@Transactional
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
		
		
		return false;
	}
	
	
	

}
