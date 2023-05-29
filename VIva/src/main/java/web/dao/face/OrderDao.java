package web.dao.face;

import web.dto.Users;

public interface OrderDao {

	/**
	 * userNo 을 통해 credit TB 조회 하여 총액 구하기
	 * 
	 * @param userNo
	 * @return 크레딧 총계 구하기
	 */
	public int selectCreditAcc(Users userNo);



}
