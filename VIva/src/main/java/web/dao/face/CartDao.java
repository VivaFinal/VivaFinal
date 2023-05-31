package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Cart;

public interface CartDao {

	/**
	 * userno 을 이용하여 cart 전체 조회하기
	 * 
	 * @param userno
	 * @return cart 항목 전체 
	 */
	public List<Map<String, Object>> selectCartByUserno(Cart userNo);

	/**
	 * cartNo을 이용하여 cart 항목 삭제하기
	 * 
	 * @param cartNo
	 * @return 성공하면 true, 아니면 false
	 */
	public boolean deleteCartByCartNo(int cartNo);

	/**
	 * cart의 중복여부 확인하기. 
	 * 
	 * @param add - userNo, sourceNo
	 * @return 중복이면 1, 아니면 0
	 */
	public int selectDuplicatedCartByUserNo(Cart add);

	/**
	 * 중복 결과 후, 중복이 아닐때는 장바구니 담기 진행하기
	 * 
	 * @param add - userNo, sourceNo
	 */
	public void insertCartItem(Cart add);
	

}
