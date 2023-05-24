package web.dao.face;

import java.util.List;

import web.dto.Source;

public interface FileUploadDao {

	/**
	 * Source 테이블 전체 조회 
	 * @return
	 */
	public List<Source> selectAllSourceList();

	/**
	 * Source 테이블 정보 삽입 
	 * @param source
	 */
	public void SourceInsertSource(Source source);


	

}
