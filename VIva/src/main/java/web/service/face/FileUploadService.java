package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Source;
import web.dto.Tag;


public interface FileUploadService {
	
	/**
	 * source테이블 전체 출력하기 
	 * @return
	 */
	public List<Source> getSourceList();
	
	/**
	 * Source 업로드 부분
	 * @param tag - Tag(instrument,genre,scape,detail,fx) 
	 * @param source-source(source_name,BPM,Key,tag_no,pack_no,user_no) insert
	 * @param imgfile - 소스 이미지 파일 부분 (sourceImgInfo 테이블)
	 * @param file - 소스 음원 파일 부분 (sourceFileInfo 테이블)
	 */
	public void SourceUpload(Tag tag,Source source,MultipartFile imgfile,MultipartFile file);



}
