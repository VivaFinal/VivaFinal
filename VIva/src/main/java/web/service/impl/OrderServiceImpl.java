package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.OrderDao;
import web.dto.Users;
import web.service.face.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired OrderDao orderDao;
	
	@Override
	public boolean chkCreditAcc(Users userNo, int sourceNo) {
		
		logger.info("chkCreditAcc()");
		
		//회원 크레딧 잔액 구하기
		int res = orderDao.selectCreditAcc(userNo);
		logger.info("credit rest : {}", res);
		
		//비교대상 : 구매할 음원의 총계 select 하기 (현재는 한개만 구해놨음..)
		
		
		//크레딧잔액 ><= 비교대상 크고 작기에 대한 결과 구하기
		
		
		return false;
	}
	@Override
	public boolean orderCartItem(int sourceNo) {
		
		
		return false;
	}
}
