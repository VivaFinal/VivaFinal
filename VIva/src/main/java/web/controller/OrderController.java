package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import web.dto.MySource;
import web.dto.SourceFileInfo;
import web.service.face.OrderService;

@Controller
public class OrderController {
	
	@Autowired OrderService orderService;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/source/download")
	public String buy(MySource source, Model model, HttpSession session) {
		logger.info("download링크 클릭 확인 {}");
		logger.info("source : {}",source);
		session.setAttribute("userno", 1);
		
		int userNo = (int) session.getAttribute("userno");
		source.setUserNo(userNo);
		logger.info("userNo 확인 : {}", userNo);
		
		// 구매 크레딧 이상 가지고 있는지 확인
		boolean chkCredit = orderService.checkCredit(userNo);
		
		
		
		// 기존에 가지고 있는 음원소스인지 확인
		boolean chkSource = orderService.checkSource(source);
		logger.info("chkSource {}", chkSource);
		
		// 추가 시작
		
		
		
		
		
		
		SourceFileInfo down = orderService.getFile(source.getSourceNo());
		
		model.addAttribute("down", down);
		
		return "down";
	}
	
}
