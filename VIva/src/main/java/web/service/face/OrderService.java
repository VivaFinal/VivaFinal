package web.service.face;

import web.dto.Cart;
import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.Tag;
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
	 * @param user 
	 * 
	 * @param userno - 사용자 정보
	 * @param sourceNo - 사용자가 다운로드할 음원소스번호
	 * @return - true : 가지고 있음, false : 가지고 있지 않음
	 * 작성자 : 채원
	 */
	public boolean checkSource(MySource source, Users user);

	/**
	 * 음원소스를 구매할 크레딧이 있는지 검사
	 * 
	 * @param user - 구매 요청이 온 회원
	 * @return - true: 구매가능, false: 구매불가
	 * 작성자 : 채원
	 */
	public boolean checkCredit(Users user);


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

	

	/**
	 * 구매(다운로드) 음원에 대해 나의 음원 소스 테이블에 정보를 추가한다
	 * 
	 * @param source - 음원소스번호, 사용자번호가 담긴 객체
	 */
	public void intoMySource(MySource source);

	/**
	 * 구매(다운로드) 음원에 대해 음원소스 다운로드 정보 TB에 이력을 추가한다
	 * @param source - 구매(다운로드)된 음원
	 */
	public void intoSourceDown(MySource source);

	/**
	 * 구매(다운로드)로 인한 크레딧 지출, 수입의 기록을
	 * 구매한 음원소스파일 정보를 이용해 등록한다
	 * 
	 * @param source - 구매한 음원소스파일 정보
	 */
	public void intoCredit(MySource source);

	/**
	 * 구매 실패 시 같은 장르의 음원소스페이지로 리다이렉트를 위한
	 * 장르를 조회한다
	 * @param i - 음원구매 실패한 정보
	 * @return - 실패한 음원소스의 장르
	 */
	public Tag getGenre(int i);




}
