package web.service.face;

import web.dto.Users;

public interface OrderService {
	
	/**
	 * userNo을 통해 크레딧 TB 의 총 계 확인하여 구매 가능여부 확인하기
	 * 
	 * @param userNo, sourceNo
	 * @return 구매 가능 여부
	 */
	public boolean chkCreditAcc(Users userNo, int sourceNo);
	
	/**
	 * sourceNo 을 통해 음원 구매에 따른 로직짜기
	 * 
	 * @param sourceNo 
	 * @return 수행 완료 시 true, false 
	 */
	public boolean orderCartItem(int sourceNo);



}
