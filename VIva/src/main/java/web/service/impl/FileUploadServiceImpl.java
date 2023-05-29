package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.FileUploadDao;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceImgInfo;
import web.dto.Tag;
import web.service.face.FileUploadService;


@Service
public class FileUploadServiceImpl implements FileUploadService{
	
	@Autowired FileUploadDao fileUploadDao;
	
	//파일업로드에 필요한 context
	@Autowired ServletContext context;

	@Override
	public List<Source> getSourceList() {
		return fileUploadDao.selectAllSourceList();
	}
	
	@Override
	public void SourceUpload(Tag tag,Source source,MultipartFile imgfile,MultipartFile file) {
		
		//Tag(instrument,genre,scape,detail,fx)
		fileUploadDao.TagInsert(tag);
		
		source.setTagNo(tag.getTag_no());
		
		//Source (name,BPM,Key,Tag) 정보 insert 
		fileUploadDao.SourceInsertSource(source);
		
		
		//---------------------------------------------------------------------------------------
		//파일 업로드시작 
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//-----------------------------------------------------------------------
		//이부분은 imgfile에 관한 코드입니다 
		//파일이 저장될 이름 - imgfile
		String imgoriginName = imgfile.getOriginalFilename();
		String imgstoredName = imgoriginName + UUID.randomUUID().toString().split("-")[4];
		
		
		//저장될 파일 정보 객체
		File imgdest = new File(storedFolder, imgstoredName);

		try {
			imgfile.transferTo(imgdest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//-----------------------------------------------------------------------
		//이부분은 음원file에 관한 코드입니다 
		//파일이 저장될 이름 - file
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, storedName);

		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------------------------------
		
		//소스 이미지 imgfile 업로드 부분 
		SourceImgInfo sourceImgInfo = new SourceImgInfo();
		sourceImgInfo.setSourceNo(source.getSourceNo());
		sourceImgInfo.setSourceImgOriginname(imgoriginName);
		sourceImgInfo.setSourceImgStoredname(imgstoredName);
		
		fileUploadDao.SourceInsertImg(sourceImgInfo);
		
		//---------------------------------------------------------------------------
		
		//소스 음원 file 업로드 부분
		SourceFileInfo sourceFileInfo = new SourceFileInfo();
		sourceFileInfo.setSourceNo(source.getSourceNo());
		sourceFileInfo.setFileOriginname(originName);
		sourceFileInfo.setFileStoredname(storedName);
		sourceFileInfo.setFileSize((int)file.getSize());
		fileUploadDao.SourceInsertFile(sourceFileInfo);
		
	}


	

}
