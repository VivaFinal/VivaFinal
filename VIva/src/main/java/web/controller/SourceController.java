package web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceLike;
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
		
		logger.info("Tag 정보 ++++++ : {}",genre);
		
		// 태그 조회
		List<Tag> instrument = sourceService.getTag(genre);
		List<Tag> scape = sourceService.getTagScape(genre);
		List<Tag> detail = sourceService.getTagDetail(genre);
		List<Tag> fx = sourceService.getTagFx(genre);
		
		model.addAttribute("inst", instrument);
		model.addAttribute("scape", scape);
		model.addAttribute("detail", detail);
		model.addAttribute("fx", fx);
		
		logger.info("Tag : {}" , genre);
		
		// 음원소스 조회
		List<Map<String, Object>> list = sourceService.getSourceByGenre(genre);
		
//		logger.info("장르별 음원소스 조회 : {}", list);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/genre/like")
	public void genreLike(SourceLike like, Writer out) {
		logger.info("AJAX 좋아요 테스트 중");
		logger.info("좋아요 정보 : {}",like);
		
		boolean chk = sourceService.chkLike(like);
		
		logger.info("chk 확인 : {}",chk);
		
		if (chk == false) {
			sourceService.sourceLike(like);
			try {
				out.write("{\"result\":true}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else if (chk == true) {
			sourceService.sourceDestLike(like); 
			try {
				out.write("{\"result\":false}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	@GetMapping("/genre/buy")
	public String buy(SourceFileInfo down, Model model) {
		logger.info("/genre/buy 접속 테스트");
		logger.info("down 요청 : {}", down);
		
		SourceFileInfo downFile = sourceService.getFile(down);
		
		logger.info("다운로드 요청 파일 정보 : {}",downFile);
		
		model.addAttribute("down", downFile);
		
		return "down";
	}
	
	
	
	
	
	@GetMapping("/inst")
	public void inst(Tag instrument, Model model) {
//		logger.info("instrument Source 접근 [GET]");
		logger.info("악기별 카테고리 {}",instrument.getInstrument());
		
		model.addAttribute("inst", instrument.getInstrument());
	}
	
	
	
}
