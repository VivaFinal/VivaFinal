package web.service.face;

import java.util.List;

import web.dto.Cart;
import web.dto.Users;

public interface CartService {

	/**
	 * userno 으로 cart 내역 조회하기
	 * 
	 * @param userno
	 * @return 장바구니 전체 내역 
	 */
	public List<Cart> getList(Users userno);

}
