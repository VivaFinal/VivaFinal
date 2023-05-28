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

	/**
	 * cartNo를 통해 CART TB에서 해당 항목 삭제하기
	 * 
	 * @param cartNo
	 * @return 성공 여부에 따라 true/false
	 */
	public boolean deleteCartItem(int cartNo);

	

}
