package web.controller;

import java.util.List;

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
	
	@GetMapping("/list")
	public String list1() {
		logger.info("cart/list - list-1()");
		
		return "/cart/main";
		
	}
	
	@PostMapping("/list")
	public void list(Cart userNo, Model model) {
		logger.info("cart/list - list()");
		logger.info("userno: {} ", userNo);
		
		List<Cart> cartList = cartService.getCartList(userNo);
		
		model.addAttribute("list", cartList);
	}
	
	@GetMapping("/del")
	public void delete() {
		logger.info("/cart/list - delete()");
		
		
	}
	@GetMapping("/buy")
	public void buy() {
		logger.info("cart/list - buy()");
		
	}
}
