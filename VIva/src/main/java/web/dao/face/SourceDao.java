package web.dao.face;

import java.util.List;
import java.util.Map;

import web.dto.Tag;

public interface SourceDao {

	/**
	 * 해당 장르가 가지고 있는 Instrument 태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenre(String genre);

	/**
	 * 해당 장르가 가지고 있는 Scape태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforScape(String genre);

	/**
	 * 해당 장르가 가지고 있는  Detail태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforDetail(String genre);

	/**
	 * 해당 장르가 가지고 있는 Fx태그를 전체 조회한다
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> selectTagByGenreforFx(String genre);

	/**
	 * 클라이언트가 선택한 장르를 토대로 음원소스 정보를 조회한다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 선택한 장르의 음원소스 집합
	 */
	public List<Map<String, Object>> selectSourceByGenre(String genre);


}
