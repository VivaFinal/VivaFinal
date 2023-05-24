package web.service.impl;

import java.util.List;

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
	public List<Source> getSourceList() {
		return fileUploadDao.selectAllSourceList();
	}
	
	@Override
	public void SourceUploadSource(Source source) {
		fileUploadDao.SourceInsertSource(source);
		
	}

	@Override
	public void SourceUploadFile(SourceFileInfo sourceFileInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void SourceUploadImg(SourceImgInfo sourceImgInfo) {
		// TODO Auto-generated method stub
		
	}
	
	

}
