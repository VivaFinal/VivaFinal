package web.service.face;

import web.dto.MySource;
import web.dto.SourceFileInfo;
import web.dto.Users;

public interface OrderService {

	/**
	 * sourceNo에 따른 음원소스 파일 정보를 가져온다
	 * 
	 * 
	 * @param sourceNo - 요청 음원소스번호
	 * @return - 요청된 음원소스 파일 정보
	 */
	public SourceFileInfo getFile(int sourceNo);

	/**
	 * 사용자가 다운로드한 이력이 있는지 확인한다
	 * 
	 * @param userno - 사용자 정보
	 * @param sourceNo - 사용자가 다운로드할 음원소스번호
	 * @return - true : 가지고 있음, false : 가지고 있지 않음
	 */
	public boolean checkSource(MySource source);

	/**
	 * 음원소스를 구매할 크레딧이 있는지 검사
	 * 
	 * @param userNo - 구매 요청이 온 회원
	 * @return - true: 구매가능, false: 구매불가
	 */
	public boolean checkCredit(int userNo);

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
