package web.service.impl;

import java.util.List;
import java.util.Map;

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
		
		return sourceDao.selectTagByGenre(genre);
	}

	@Override
	public List<Tag> getTagScape(String genre) {
		return sourceDao.selectTagByGenreforScape(genre);
	}

	@Override
	public List<Tag> getTagDetail(String genre) {
		return sourceDao.selectTagByGenreforDetail(genre);
	}

	@Override
	public List<Tag> getTagFx(String genre) {
		return sourceDao.selectTagByGenreforFx(genre);
	}

	@Override
	public List<Map<String, Object>> getSourceByGenre(String genre) {
		return sourceDao.selectSourceByGenre(genre);
	}

	
	
	
	
}
