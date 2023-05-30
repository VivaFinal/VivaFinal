package web.dao.face;

import web.dto.Credit;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.Users;

public interface OrderDao {

	/**
	 * 음원소스 번호를 가지고 요청된 파일 정보를 반환
	 * 
	 * @param source - 요청된 음원소스 번호
	 * @return - 요청된 파일 정보
	 * 작성자 : 채원
	 */
	public SourceFileInfo selectSourceFileBysourceNo(int source);

	/**
	 * 사용자 번호, 음원소스 번호를 이용해 
	 * 현재 사용자가 음원소스를 가지고 있는 지 확인한다
	 * 
	 * @param userNo
	 * @param sourceNo
	 * @return
	 * 작성자 : 채원
	 */
	public int selectSourceChkByUsernoSourceNo(MySource source);

	/**
	 * 사용자의 모든 크레딧 카테고리별 합계를 가져온다
	 * 
	 * @param userNo - 크레딧 조회 대상 사용자
	 * @return - 충전, 지출, 수입, 환전의 크레딧 정보 배열
	 * 작성자 : 채원
	 */
	public int[] selectCreditByUserNo(int userNo);
  
	
//============================================================================================
//지선의 코드
	
  /**
	 * userNo 을 통해 credit TB 조회 하여 총액 구하기
	 * 
	 * @param userNo
	 * @return 크레딧 총계 구하기
	 * 작성자 : 지선
	 */
	public int selectCreditAcc(Users userNo);


	/**
	 * 선택한 sourceNo 을 통해 sourcePrice 합계 알아내기
	 * 
	 * @param sourceNo
	 * @return 구매원하는 source 총계 
	 * 작성자 : 지선
	 */
	public int selectSourceAmount(Source sourceNo);

	/**
	 * 해당 회원의 크레딧에서 음원소스 금액 만큼 지출하기
	 * 
	 * @param userNo - credit TB 접근
	 * @param price - credit TB에서 지출할 액수
	 */
	public void expenditureCredit(Users userNo, int price);

	/**
	 * credit TB에 삽입할 정보(회원번호, 금액)를 이용하여 내역 insert 하기
	 * 
	 * @param credit - userNo, amount
	 */
	public void expenditureCredit(Credit credit);



}
