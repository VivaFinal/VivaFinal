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
		} else if(genre.getGenre() != null) {
			
				for(int i=0; i<tag.size(); i++) {
				
				String remove = genre.getGenre();
				
				try {
					if ( tag.get(i).getGenre() != null && tag.get(i).getGenre().equals(remove) ) {
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

	@Override
	public List<Tag> getTagGenre(Tag instrument) {
		
		List<Tag> tag = sourceDao.selectTagByInstDetail(instrument);
		
		return tag;
	}

	@Override
	public Tag getInst(Tag instrument) {
		
		if(instrument.getInstrument() != null && "".equals(instrument.getInstrument())) {
			return instrument;
		}
		
		String[] Drum = {"Kick","Snare","808","Hihat","Clap","Tom","Cymbal","Fills","Percussion","Rimshot"};
		String[] Vocal = {"Female","Male","Phrase","Whispers","Screams","Dialogue"};
		String[] Synth = {"Bass","Lead","Pad","Arp","Pluck","Chord"};
		String[] Brass = {"Saxophone","Trumpet","Trombone","Ensemble"};
		String[] Wood = {"Flute","Harmonica","Clarinet"};
		String[] Guitar = {"Acoustic","Clean","Dist","Rhythm","Solo","Riff"};
		String[] Bass = {"Synth","Analog","Electric"};
		String[] String = {"Violin","Cello","Viola","Contrabass","Orchestral","StringPad","Staccato","Pizzicato"};
		
		
		Tag res = new Tag();
		
		for(int i=0; i<Drum.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Drum[i])) {
				res.setInstrument("Drum");
				res.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res);
				return res;
			}
		}
		
		Tag res1 = new Tag();
		
		for(int i=0; i<Vocal.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Vocal[i])) {
				res1.setInstrument("Vocal");
				res1.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res1);
				return res1;
			}
		}
		
		Tag res2 = new Tag();
		
		for(int i=0; i<Synth.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Synth[i])) {
				res2.setInstrument("Drum");
				res2.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res2);
				return res2;
			}
		}
		
		Tag res3 = new Tag();
		
		for(int i=0; i<Brass.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Brass[i])) {
				res3.setInstrument("Drum");
				res3.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res3);
				return res3;
			}
		}
		
		Tag res4 = new Tag();
		
		for(int i=0; i<Wood.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Wood[i])) {
				res4.setInstrument("WoodWinds");
				res4.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res4);
				return res4;
			}
		}
		
		Tag res5 = new Tag();
		
		for(int i=0; i<Guitar.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Guitar[i])) {
				res5.setInstrument("Drum");
				res5.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res5);
				return res5;
			}
		}
		
		Tag res6 = new Tag();
		
		for(int i=0; i<Bass.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(Bass[i])) {
				res6.setInstrument("Drum");
				res6.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res6);
				return res6;
			}
		}
		
		Tag res7 = new Tag();
		
		for(int i=0; i<String.length; i++) {
			if(instrument.getDetail() != null && instrument.getDetail().equals(String[i])) {
				res7.setInstrument("String");
				res7.setDetail(instrument.getDetail());
				logger.info("악기 확인 : {}",res7);
				return res7;
			}
		}
		
		return null;
	}

	@Override
	public List<Tag> getTagScapeforInst(Tag instrument) {
		return sourceDao.selectScapeByInstDetail(instrument);
	}

	@Override
	public List<Tag> getTagFxforInst(Tag instrument) {
		return sourceDao.selectFxByInstDetail(instrument);
	}

	@Override
	public List<Tag> getTagDetailforInst(Tag instrument) {
		return sourceDao.selectDetailByInst(instrument);
	}

	@Override
	public List<Map<String, Object>> getSourceByInstDetail(Tag instrument) {
		return sourceDao.selectSourceByInstDetail(instrument);
	}

	
	
	
	
}
