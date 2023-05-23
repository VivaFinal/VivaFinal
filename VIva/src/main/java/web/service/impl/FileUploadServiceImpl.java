package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.FileUploadDao;
import web.service.face.FileUploadService;


@Service
public class FileUploadServiceImpl implements FileUploadService{
	
	@Autowired FileUploadDao fileUploadDao;

}
