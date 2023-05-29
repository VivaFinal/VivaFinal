package web.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.SourceDao;
import web.dto.SourceFileInfo;
import web.dto.SourceLike;
import web.dto.Tag;
import web.service.face.SourceService;

@Service
public class SourceServiceImpl implements SourceService{

	@Autowired SourceDao sourceDao;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public List<Tag> getTag(Tag genre) {
		
		List<Tag> tag = sourceDao.selectTagByGenre(genre);
		
		if( genre.getInstrument() != null ) {
			for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getInstrument();
				
				try {
					if ( tag.get(i).getInstrument() != null && tag.get(i).getInstrument().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
		}
		
		return tag;
	}

	@Override
	public List<Tag> getTagScape(Tag genre) {
		
		List<Tag> tag = sourceDao.selectTagByGenreforScape(genre);
		
		if( genre.getScape() != null ) {
			for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getScape();
				
				try {
					if ( tag.get(i).getScape() != null && tag.get(i).getScape().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
		}
		
		return tag;
	}

	@Override
	public List<Tag> getTagDetail(Tag genre) {
		
		List<Tag> tag = sourceDao.selectTagByGenreforDetail(genre);
		
		if( genre.getDetail() != null ) {
			for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getDetail();
				
				try {
					if ( tag.get(i).getDetail() != null && tag.get(i).getDetail().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
		}
		return tag;
	}

	@Override
	public List<Tag> getTagFx(Tag genre) {
		
		List<Tag> tag = sourceDao.selectTagByGenreforFx(genre);
		
		if( genre.getFx() != null ) {
			for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getFx();
				
				try {
					if ( tag.get(i).getFx() != null && tag.get(i).getFx().equals(remove) ) {
						tag.remove(i);
					}
				} catch (NullPointerException e) {
					e.printStackTrace();
				}
			}
		}
		
		return tag;
	}

	@Override
	public List<Map<String, Object>> getSourceByGenre(Tag genre) {
		return sourceDao.selectSourceByGenre(genre);
	}

	@Override
	public void sourceLike(SourceLike like) {
		
		sourceDao.insertSourceLike(like);
		
	}

	@Override
	public boolean chkLike(SourceLike like) {
		
		int chk = sourceDao.selectByLike(like);
		
		if( chk > 0 ) {
			return true;
		}
		return false;
	}

	@Override
	public void sourceDestLike(SourceLike like) {
		sourceDao.deleteByLike(like);
	}

	@Override
	public SourceFileInfo getFile(SourceFileInfo down) {
		
		return sourceDao.selectBySourceNoforFile(down);
	}

	
	
	
	
}
