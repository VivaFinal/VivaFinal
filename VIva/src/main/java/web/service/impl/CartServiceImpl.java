package web.service.impl;

import java.util.List;

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
	public List<Cart> getCartList(Cart userNo) {
		logger.info("getList()");
		
		
		return cartDao.selectCartByUserno(userNo);
	}
}
