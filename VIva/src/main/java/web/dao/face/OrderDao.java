package web.dao.face;

import web.dto.MySource;
import web.dto.SourceFileInfo;

public interface OrderDao {

	/**
	 * 음원소스 번호를 가지고 요청된 파일 정보를 반환
	 * 
	 * @param source - 요청된 음원소스 번호
	 * @return - 요청된 파일 정보
	 */
	public SourceFileInfo selectSourceFileBysourceNo(int source);

	/**
	 * 사용자 번호, 음원소스 번호를 이용해 
	 * 현재 사용자가 음원소스를 가지고 있는 지 확인한다
	 * 
	 * @param userNo
	 * @param sourceNo
	 * @return
	 */
	public int selectSourceChkByUsernoSourceNo(MySource source);

	/**
	 * 사용자의 모든 크레딧 카테고리별 합계를 가져온다
	 * 
	 * @param userNo - 크레딧 조회 대상 사용자
	 * @return - 충전, 지출, 수입, 환전의 크레딧 정보 배열
	 */
	public int[] selectCreditByUserNo(int userNo);

}
