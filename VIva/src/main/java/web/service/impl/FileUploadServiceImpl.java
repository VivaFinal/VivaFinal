package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.FileUploadDao;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceImgInfo;
import web.service.face.FileUploadService;


@Service
public class FileUploadServiceImpl implements FileUploadService{
	
	@Autowired FileUploadDao fileUploadDao;

	@Override
	public void SourceUploadSource(Source source) {
		fileUploadDao.SourceInsertSource(source);
		
	}

	@Override
	public void SourceUploadFile(SourceFileInfo sourceFileInfo) {
		
	}

	@Override
	public void SourceUploadImg(SourceImgInfo sourceImgInfo) {
		
	}

	
}
