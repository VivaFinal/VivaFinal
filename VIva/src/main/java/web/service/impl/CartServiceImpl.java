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
		// TODO Auto-generated method stub
		return false;
	}
}
