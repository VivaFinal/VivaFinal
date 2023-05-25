package web.dao.face;

import java.util.List;

import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceImgInfo;

public interface FileUploadDao {

	/**
	 * Source 테이블 전체 조회 
	 * @return
	 */
	public List<Source> selectAllSourceList();

	/**
	 * Source 테이블 정보 삽입 
	 *  source(source_name,BPM,Key,tag_no,pack_no,user_no) insert
	 * @param source
	 */
	public void SourceInsertSource(Source source);

	/**
	 * SourceImgInfo 테이블 정보 삽입 
	 * sourceImgInfo (소스 이미지파일 insert)
	 * @param sourceImgInfo ( 소스 이미지 파일 imgorigin,imgstored)
	 */
	public void SourceInsertImg(SourceImgInfo sourceImgInfo);
	
	/**
	 * SourceFileInfo 테이블 정보 삽입 
	 * sourceFileInfo (소스 음원파일 insert)
	 * @param sourceFileInfo ( 소스 음원 파일 origin,stored)
	 */
	public void SourceInsertFile(SourceFileInfo sourceFileInfo);



	

}
