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
public class SourceController {


private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SourceService sourceService;
	
	@GetMapping("/source/sound")
	public void sound(Model model) {
		logger.info("Sound 화면 확인");
		
		// 최신 업로드 List 조회
		List<Map<String, Object>> list = sourceService.getPack();
		
		// 최다 좋아요별 List 조회
		List<Map<String, Object>> likelist = sourceService.getLikePack();
		
		logger.info("++ likelist 확인 : {}", likelist);
		
		model.addAttribute("list", list);
		model.addAttribute("likelist", likelist);
	}
	
	
	@GetMapping("/source/genre")
	public void genre(Tag genre, Model model, String msg) {
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
		
		// 구매이력이 있는 경우 메시지 반환
		if( msg != null && msg.equals("already")) {
			msg = msg.replace("already", "해당 음원을 구매하셨거나, 크레딧이 부족합니다! 확인해주세요!");
			logger.info(msg);
			model.addAttribute("msg", msg);
		}
		
//		logger.info("장르별 음원소스 조회 : {}", list);
		model.addAttribute("list", list);
	}
	
	@GetMapping("/source/genre/like")
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
	
	@GetMapping("/source/genre/buy")
	public String buy(SourceFileInfo down, Model model) {
		logger.info("/genre/buy 접속 테스트");
		logger.info("down 요청 : {}", down);
		
		SourceFileInfo downFile = sourceService.getFile(down);
		
		logger.info("다운로드 요청 파일 정보 : {}",downFile);
		
		model.addAttribute("down", downFile);
		
		return "down";
	}
	
	
	
	
	
	@GetMapping("/source/inst")
	public void inst(Tag instrument, Model model, String msg) {
//		logger.info("instrument Source 접근 [GET]");
		logger.info("카테고리 {}",instrument);
		
		// 세부 카테고리를 선택한 경우 악기 값이 자동으로 들어가게 해야한다
		// 세부 카테고리의 경우 inst는 찾아내 등록, 나머지는 검색
		// 음원소스조회 역시 따로 진행한다
		
		if(instrument.getInstrument() == null) {
			
			Tag res = sourceService.getInst(instrument);
			logger.info("res : {}",res);
			model.addAttribute("det", res.getDetail());
			model.addAttribute("dinst", res.getInstrument());
			
			List<Tag> genre = sourceService.getTagGenre(instrument);
			List<Tag> scape = sourceService.getTagScapeforInst(instrument);
			List<Tag> fx = sourceService.getTagFxforInst(instrument);
			
			model.addAttribute("genre", genre);
			model.addAttribute("scape", scape);
			model.addAttribute("fx", fx);
			
			// 음원소스 조회 [ inst, detail ] 포함
			List<Map<String, Object>> list = sourceService.getSourceByInstDetail(instrument);
			
			model.addAttribute("list", list);
		}
		
		model.addAttribute("inst", instrument.getInstrument());
		
		logger.info("inst의 악기 포함 {}",instrument.getInstrument());
		
		if(instrument.getInstrument() != null && instrument.getDetail() == null) {
			
			// 태그 조회
			List<Tag> genre = sourceService.getTagGenre(instrument);
			List<Tag> scape = sourceService.getTagScapeforInst(instrument);
			List<Tag> fx = sourceService.getTagFxforInst(instrument);
			List<Tag> detail = sourceService.getTagDetailforInst(instrument);
			
			model.addAttribute("genre", genre);
			model.addAttribute("scape", scape);
			model.addAttribute("fx", fx);
			model.addAttribute("detail", detail);
			
			// 음원소스 조회 [ inst ]만 포함
			List<Map<String, Object>> list = sourceService.getSourceByInstDetail(instrument);
			
			model.addAttribute("list", list);
		}
		
		// 구매이력이 있는 경우 메시지 반환
		if( msg != null && msg.equals("already")) {
			msg = msg.replace("already", "해당 음원을 구매하셨거나, 크레딧이 부족합니다! 마이페이지에서 확인해주세요!");
			logger.info(msg);
			model.addAttribute("msg", msg);
		}
		
		
	}
	
	
	
}
