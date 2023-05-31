package web.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Cart;

@Controller
@RequestMapping("/credit")
public class CreditController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//로그인 기능 구현 전, userNo 알아내기 위해 임시로 만든 페이지
	@RequestMapping("/test")
	public String test() {
		logger.info("credit/list - test()");
		
		return "/credit/test";
	}

	//----------------------------------------------------------------------------------------
	//userNo 알아낸 뒤, 크레딧 목록 부르는 페이지
	@PostMapping("/list")
	public void list(Cart userNo, Model model) {
		logger.info("credit/list - list()");
		logger.info("userno: {} ", userNo);
		
		
	}
}
