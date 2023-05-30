package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Pack;
import web.dto.Source;
import web.dto.SourceFileInfo;
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

	
	/**
	 * Pack 업로드부분 
	 * @param packFileList -팩(음원소스여러개) 업로드 부분 (sourceFileInfo 테이블)
	 * @param sourceInfoList - ?
	 * @param packImg - 팩 이미지 파일 부분 (packimginfo 테이블)
	 * @param pack - pack(pack_no, pack_name, pack_content, pack_date, tag_no)
	 * @param tag - Tag(instrument,genre,scape,detail,fx) 
	 */
	public void uploadPack(
			List<MultipartFile> packFileList, 
//			List<SourceFileInfo> sourceInfoList, 
			MultipartFile packImg,
			Pack pack,
			Tag tag);



}
