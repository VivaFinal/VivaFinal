package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.FileUploadDao;
import web.dto.Pack;
import web.dto.PackImgInfo;
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
		
		//소스 이미지 imgfile 업로드 부분 
		SourceImgInfo sourceImgInfo = new SourceImgInfo();
		sourceImgInfo.setSourceNo(source.getSourceNo());
		sourceImgInfo.setSourceImgOriginname(imgoriginName);
		sourceImgInfo.setSourceImgStoredname(imgstoredName);
		
		fileUploadDao.SourceInsertImg(sourceImgInfo);
		
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
		
		//소스 음원 file 업로드 부분
		SourceFileInfo sourceFileInfo = new SourceFileInfo();
		sourceFileInfo.setSourceNo(source.getSourceNo());
		sourceFileInfo.setFileOriginname(originName);
		sourceFileInfo.setFileStoredname(storedName);
		sourceFileInfo.setFileSize((int)file.getSize());
		fileUploadDao.SourceInsertFile(sourceFileInfo);
		
	}

	
	@Override
	public void uploadPack(
			//pack에 들어가는 음원소스파일여러개
			List<MultipartFile> packFileList,
			//pack에 들어가는 음원소스파일여러개의 파일들의 정보
//			List<SourceFileInfo> sourceInfoList, 
			MultipartFile packImg,
			Pack pack,
			Tag tag) {
		
		//Tag(instrument,genre,scape,detail,fx)
		//함수재사용 ( 위에서 sourceupload에서 사용한 함수 ) 
		fileUploadDao.TagInsert(tag);
		
		pack.setTagNo(tag.getTag_no());
		
		//pack 테이블(no,name,content,date,tagno) insert부분 
//		fileUploadDao.packInsert(pack);
		
		//packFileList, sourceInfoList 2개를 for문으로 돌린다 
		for (int i = 0; i < packFileList.size(); i++) {
			
		
				//빈 파일일 경우
				if( packFileList.get(i).getSize() <= 0) {
					return;
				}
				
				//파일이 저장될 경로
				String storedPath = context.getRealPath("upload");
				File storedFolder = new File(storedPath);
				if( !storedFolder.exists() ) {
					storedFolder.mkdir();
				}
				
				//-----------------------------------------------------------------------
				//이부분은 packFileList(sourcefile이 여러개 인것)에 관한 코드입니다 
				//파일이 저장될 이름 - packFileList
				String packoriginName = packFileList.get(i).getOriginalFilename();
				String packstoredName = packoriginName + UUID.randomUUID().toString().split("-")[4];
				
				
				//저장될 파일 정보 객체
				File packdest = new File(storedFolder, packstoredName);

				try {
					packFileList.get(i).transferTo(packdest);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				//---------------------------------------------------------------------------
				
				//소스 음원 file 업로드 부분
//				SourceFileInfo sourceFileInfo = new SourceFileInfo();
//				sourceFileInfo.setSourceNo(source.getSourceNo());
//				sourceFileInfo.setFileOriginname(originName);
//				sourceFileInfo.setFileStoredname(storedName);
//				sourceFileInfo.setFileSize((int)file.getSize());
//				fileUploadDao.SourceInsertFile(sourceFileInfo);
				
		}//for문 끝 
		
		
		//---------------------------------------------------------------------------------------
		//팩이미지파일 업로드시작 
		//packImg
		//빈 파일일 경우
		if( packImg.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//-----------------------------------------------------------------------
		//이부분은 packImg에 관한 코드입니다 
		
		//파일이 저장될 이름 - packImg
		String packimgoriginName = packImg.getOriginalFilename();
		String packimgstoredName = packimgoriginName + UUID.randomUUID().toString().split("-")[4];
		
		
		//저장될 파일 정보 객체
		File packimgdest = new File(storedFolder, packimgstoredName);

		try {
			packImg.transferTo(packimgdest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//소스 이미지 imgfile 업로드 부분 
		PackImgInfo packImgInfo = new PackImgInfo();
		packImgInfo.setPackNo(pack.getPackNo());
		packImgInfo.setPackImgOriginname(packimgoriginName);
		packImgInfo.setPackImgStoredname(packimgstoredName);
		
//		fileUploadDao.PackImgInsert(packImgInfo);
		
	}

	

}
