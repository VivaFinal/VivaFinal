package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Tag;

public interface SourceService {

	/**
	 * 같은 장르에 포함된 Instrument Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return
	 */
	public List<Tag> getTag(String genre);

	/**
	 * 
	 * 같은 장르에 포함된 Scape Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagScape(String genre);

	/**
	 * 같은 장르에 포함된 Detail Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagDetail(String genre);

	/**
	 * 같은 장르에 포함된 Fx Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagFx(String genre);

	/**
	 * 클라이언트가 선택한 장르의 음원소스 정보를 모두 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 장르별 음원소스의 집합
	 */
	public List<Map<String, Object>> getSourceByGenre(String genre);
	


}
