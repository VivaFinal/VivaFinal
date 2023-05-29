package web.service.face;

import web.dto.MySource;
import web.dto.SourceFileInfo;

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

}
