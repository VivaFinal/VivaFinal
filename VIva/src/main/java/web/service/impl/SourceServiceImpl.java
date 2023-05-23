package web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.SourceDao;
import web.dto.Tag;
import web.service.face.SourceService;

@Service
public class SourceServiceImpl implements SourceService{

	@Autowired SourceDao sourceDao;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	
	
	
}
