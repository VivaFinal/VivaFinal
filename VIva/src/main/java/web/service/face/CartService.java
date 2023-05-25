package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Cart;

public interface CartService {

	/**
	 * userno 으로 cart 내역 조회하기
	 * 
	 * @param userno
	 * @return 장바구니 전체 내역 
	 */
	public List<Map<String, Object>> getCartList(Cart userNo);

	

}
