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
	

}
