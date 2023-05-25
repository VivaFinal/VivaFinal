package web.controller;

import java.util.List;
import java.util.Map;

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
		
		// 태그 조회
		List<Tag> instrument = sourceService.getTag(genre.getGenre());
		List<Tag> scape = sourceService.getTagScape(genre.getGenre());
		List<Tag> detail = sourceService.getTagDetail(genre.getGenre());
		List<Tag> fx = sourceService.getTagFx(genre.getGenre());
		
		model.addAttribute("inst", instrument);
		model.addAttribute("scape", scape);
		model.addAttribute("detail", detail);
		model.addAttribute("fx", fx);
		
		List<Map<String, Object>> list = sourceService.getSourceByGenre(genre.getGenre());
		
		logger.info("장르별 음원소스 조회 : {}", list);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/inst")
	public void inst(Tag instrument, Model model) {
//		logger.info("instrument Source 접근 [GET]");
		logger.info("악기별 카테고리 {}",instrument.getInstrument());
		
		model.addAttribute("inst", instrument.getInstrument());
	}
	
	
	
}
