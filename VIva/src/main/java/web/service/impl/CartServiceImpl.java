package web.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.CartDao;
import web.dto.Cart;
import web.service.face.CartService;

@Service
public class CartServiceImpl implements CartService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CartDao cartDao;
	
	@Override
	public List<Map<String,Object>> getCartList(Cart userNo) {
		logger.info("getList()");
		  
		  
		return cartDao.selectCartByUserno(userNo);
	}
	
	@Override
	public boolean deleteCartItem(int cartNo) {
		logger.info("deleteCartItem()");
		
		
		return cartDao.deleteCartByCartNo(cartNo);
	}
	
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
}
