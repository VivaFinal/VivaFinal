package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.SourceFileInfo;
import web.dto.SourceLike;
import web.dto.Tag;

public interface SourceDao {

	/**
	 * 해당 장르가 가지고 있는 Instrument 태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenre(Tag genre);

	/**
	 * 해당 장르가 가지고 있는 Scape태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforScape(Tag genre);

	/**
	 * 해당 장르가 가지고 있는  Detail태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforDetail(Tag genre);

	/**
	 * 해당 장르가 가지고 있는 Fx태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforFx(Tag genre);

	/**
	 * 클라이언트가 선택한 장르를 토대로 음원소스 정보를 조회한다
	 * 
	 * @param genre - 클라이언트가 선택한 태그(장르 + @ )
	 * @return - 선택한 장르의 음원소스 집합
	 */
	public List<Map<String, Object>> selectSourceByGenre(Tag genre);

	/**
	 * DB에 Like를 삽입한다
	 * 
	 * @param userNo - 좋아요 누른 회원
	 * @param sourceNo - 좋아요 눌린 음원소스
	 */
	public void insertSourceLike(SourceLike like);

	/**
	 * 누른 음원소스에 대한 좋아요 이력을 확인한다
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 * @return - 조회된 행 수
	 */
	public int selectByLike(SourceLike like);

	/**
	 * 눌렀던 음원 소스에 대한 좋아요 이력을 삭제한다
	 * @param like - 삭제할 좋아요 정보
	 */
	public void deleteByLike(SourceLike like);

	/**
	 * 클라이언트가 요청한 다운로드 파일의 정보를 조회한다
	 * @param down - 다운로드를 요청한 sourceNo를 가진 객체
	 * @return - 요청한 다운로드 파일 정보
	 */
	public SourceFileInfo selectBySourceNoforFile(SourceFileInfo down);




}
