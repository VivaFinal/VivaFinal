package web.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import web.dto.Cart;
import web.dto.Users;
import web.service.face.CartService;

@Service
public class CartServiceImpl implements CartService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<Cart> getList(Users userno) {
		
		return null;
	}
}
