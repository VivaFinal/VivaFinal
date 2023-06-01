package web.service.face;

import java.util.List;
import java.util.Map;

import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceLike;
import web.dto.Tag;

public interface SourceService {

	/**
	 * 같은 장르에 포함된 Instrument Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return
	 */
	public List<Tag> getTag(Tag genre);

	/**
	 * 
	 * 같은 장르에 포함된 Scape Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagScape(Tag genre);

	/**
	 * 같은 장르에 포함된 Detail Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagDetail(Tag genre);

	/**
	 * 같은 장르에 포함된 Fx Tag를 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 태그 조회 결과
	 */
	public List<Tag> getTagFx(Tag genre);

	/**
	 * 클라이언트가 선택한 장르의 음원소스 정보를 모두 가져온다
	 * 
	 * @param genre - 클라이언트가 선택한 장르
	 * @return - 장르별 음원소스의 집합
	 */
	public List<Map<String, Object>> getSourceByGenre(Tag genre);

	/**
	 * Like를 추가, 클라이언트가 좋아요를 눌렀을 때
	 * @param userNo - userno 사용자 정보
	 * @param sourceNo - sourceno 음원소스 정보
	 */
	public void sourceLike(SourceLike like);

	/**
	 * 좋아요를 누른 이력이 있는지 확인한다
	 * @param like - 좋아요를 누른 객체 정보
	 * @return - 이력이 있으면 true, 없으면 false
	 */
	public boolean chkLike(SourceLike like);

	/**
	 * 좋아요를 삭제한다
	 * 
	 * @param like - 좋아요를 누른 객체 정보
	 */
	public void sourceDestLike(SourceLike like);

	/**
	 * 다운로드를 하기 위한 파일의 정보를 조회한다
	 * @param down - 다운로드 요청 파일의 sourceNo가 담긴 객체
	 * @return - 해당 sourceNo를 가진 음원소스 정보
	 */
	public SourceFileInfo getFile(SourceFileInfo down);

	/**
	 * inst페이지에서 필요한 태그(Genre)를 조회한다
	 * instrument나 detail을 가진 태그를 추출한다
	 * @param instrument - 같은 악기, 디테일에 포함된 태그를 불러온다
	 * @return
	 */
	public List<Tag> getTagGenre(Tag instrument);

	/**
	 * Instrument의 detail을 선택한 경우 detail에 해당하는 악기를 지정해 반환
	 * @param instrument - detail만 들어있는 객체
	 * @return - 조회된 instrument의 detail이 포함된 객체
	 */
	public Tag getInst(Tag instrument);

	/**
	 * 같은 Instrument를 가진 scape태그를 조회한다
	 * @param instrument - 지정된 악기가 있는 태그 객체
	 * @return - 지정된 악기가 있는 scape 태그 조회결과
	 */
	public List<Tag> getTagScapeforInst(Tag instrument);

	/**
	 * 같은 Instrument를 가진 Fx태그를 조회한다
	 * @param instrument - 지정된 악기가 있는 태그 객체
	 * @return - 지정된 악기가 있는 Fx 태그 조회 결과
	 */
	public List<Tag> getTagFxforInst(Tag instrument);

	/**
	 * instrument만 선택했을 경우 Detail 태그를 조회한다
	 * @param instrument - inst만 들어있는 태그 객체
	 * @return - detail 태그 조회 결과
	 */
	public List<Tag> getTagDetailforInst(Tag instrument);

	/**
	 * 클라이언트가 선택한 Instrument, Detail에 맞는 
	 * 음원소스 리스트를 불러온다
	 * 
	 * @param instrument - inst 또는 inst,Detail 만 담겨있는 객체
	 * @return - 조건에 맞는 음원소스 조회 결과
	 */
	public List<Map<String, Object>> getSourceByInstDetail(Tag instrument);



	


}
