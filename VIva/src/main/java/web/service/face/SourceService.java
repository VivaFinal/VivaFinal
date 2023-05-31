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



	


}
