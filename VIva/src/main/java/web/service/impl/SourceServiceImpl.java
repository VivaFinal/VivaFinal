package web.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

	@Override
	public List<Tag> getTag(String genre) {
		logger.info("getTag() Service 확인용");
		
		List<Tag> tag = sourceDao.selectTagByGenre(genre);
		
		return tag;
	}

	
	
	
}
