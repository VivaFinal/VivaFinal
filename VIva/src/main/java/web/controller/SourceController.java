package web.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Tag;
import web.service.face.SourceService;

@Controller
@RequestMapping("/source")
public class SourceController {


private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SourceService sourceService;
	
	@GetMapping("/genre")
	public void genre(Tag genre, Model model) {
		logger.info("Genre별 Source 접근 [GET]");
		logger.info("장르별 카테고리 {}",genre.getGenre());
		
		model.addAttribute("genre", genre.getGenre());
		
		// 같은 장르를 가진 태그를 모두 불러온다
		List<Tag> tag = sourceService.getTag(genre.getGenre());
		
		logger.info("태그 확인 : {}",tag);
		model.addAttribute("tag", tag);
		
	}
	
	@GetMapping("/inst")
	public void inst(Tag instrument, Model model) {
//		logger.info("instrument Source 접근 [GET]");
		logger.info("악기별 카테고리 {}",instrument.getInstrument());
		
		model.addAttribute("inst", instrument.getInstrument());
	}
	
	
	
}
