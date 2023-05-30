package web.service.face;

import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.Users;

public interface OrderService {

	//음원페이지에서 진행하는 메소드
	/**
	 * sourceNo에 따른 음원소스 파일 정보를 가져온다
	 * 
	 * 
	 * @param sourceNo - 요청 음원소스번호
	 * @return - 요청된 음원소스 파일 정보
	 * 작성자 : 채원
	 */
	public SourceFileInfo getFile(int sourceNo);

	/**
	 * 사용자가 다운로드한 이력이 있는지 확인한다
	 * 
	 * @param userno - 사용자 정보
	 * @param sourceNo - 사용자가 다운로드할 음원소스번호
	 * @return - true : 가지고 있음, false : 가지고 있지 않음
	 * 작성자 : 채원
	 */
	public boolean checkSource(MySource source);

	/**
	 * 음원소스를 구매할 크레딧이 있는지 검사
	 * 
	 * @param userNo - 구매 요청이 온 회원
	 * @return - true: 구매가능, false: 구매불가
	 * 작성자 : 채원
	 */
	public boolean checkCredit(int userNo);


//=========================================================================================================
	//장바구니에서 진행하는 메소드
	
	/**
	 * userNo을 통해 크레딧 TB 의 총 계 확인하여 구매 가능여부 확인하기
	 * 
	 * @param userNo, sourceNo
	 * @return 구매 가능 여부
	 * 작성자 : 지선
	 */
	public boolean chkCreditAcc(Users userNo, Source sourceNo);
	
	/**
	 * 크레딧 지출, 장바구니항목 삭제, 다운로드 정보 생성, 내 음원내역 추가, 업로더의 크레딧 수입 생성
	 * 
	 * @param userNo - 본인 회원번호
	 * @param sourceNo - 선택한 음원 항목
	 * @param cartNo - 해당 장바구니 항목
	 * @return 구매 완료 여부
	 * 작성자 : 지선
	 */
	public boolean purchaseCartItem(Users userNo, Source sourceNo, Cart cartNo);

	



}
