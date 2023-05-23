package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import web.dto.Tag;
import web.service.face.SourceService;

@Controller
public class SourceController {

private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SourceService sourceService;

	@GetMapping("/test")
	public void test(Model model) {
		logger.info("/test 클라우드 테스트");
		
		Tag tag = sourceService.getTag();
		
		model.addAttribute("tag", tag);
		
	}
}
