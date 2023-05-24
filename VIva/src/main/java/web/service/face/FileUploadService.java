package web.service.face;

import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceImgInfo;

public interface FileUploadService {

	/**
	 * 음원소스(Source)테이블 
	 * @param source-source_no,source_name, bpm ,key 입력
	 */
	public void SourceUploadSource(Source source);

	/**
	 * 음원소스 업로드 파일정보 (SourceFileInfo) 테이블
	 * @param sourceFileInfo - 음원 origin,stored,source_date 입력
	 */
	public void SourceUploadFile(SourceFileInfo sourceFileInfo);

	/**
	 * 음원소스 이미지 파일정보 ( SourceImgInfo ) 테이블
	 * @param sourceImgInfo - 이미지 origin,stored
	 */
	public void SourceUploadImg(SourceImgInfo sourceImgInfo);

}
