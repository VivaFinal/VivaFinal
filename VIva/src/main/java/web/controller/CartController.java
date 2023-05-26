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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Cart;
import web.service.face.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private CartService cartService;
	
	@GetMapping("/test")
	public String list1() {
		logger.info("cart/list - test()");
		
		return "/cart/test";
		
	}
	
	@PostMapping("/list")
	public void list(Cart userNo, Model model) {
		logger.info("cart/list - list()");
		logger.info("userno: {} ", userNo);
		
		List<Map<String, Object>> cartList = cartService.getCartList(userNo);
		
		model.addAttribute("list", cartList);
	}
	
//	@PostMapping("/listTest")
//	public void list(Cart userNo, Model model) {
//		logger.info("cart/list - list()");
//		logger.info("userno: {} ", userNo);
//		
//		List<Map<String, Object>> cartList = cartService.getCartList(userNo);
//		
//		model.addAttribute("list", cartList);
//	}
	
	@GetMapping("/delete")
	public void delete(Writer out) {
		logger.info("/cart/list - delete()");
		
		//JSON을 이용해서 응답을 할때는 object에 넣어서 Key:value쌍으로 보내야함(단 한개더라도)
		try {
			//.write는 try-catch를 해줘야함...
			out.write("{\"result\":true}");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
//	@GetMapping("/buy")
//	public void buy() {
//		logger.info("cart/list - buy()");
//		
//	}
}
