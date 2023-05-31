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
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Cart;
import web.service.face.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private CartService cartService;

	
	//----------------------------------------------------------------------------------------
	//로그인 기능 구현 전, userNo 알아내기 위해 임시로 만든 페이지
	@GetMapping("/test")
	public String list1() {
		logger.info("cart/list - test()");
		
		return "/cart/test";
		
	}
	
	//----------------------------------------------------------------------------------------
	//userNo 알아낸 뒤, cart 목록 부르는 페이지
	@PostMapping("/list")
	public void list(Cart userNo, Model model) {
		logger.info("cart/list - list()");
		logger.info("userno: {} ", userNo);
		  
		List<Map<String,Object>> cartList = cartService.getCartList(userNo);
		model.addAttribute("list", cartList);
		
	}
	
	//----------------------------------------------------------------------------------------
	//항목 삭제 요청 받은 이후 페이지
	@GetMapping("/delete")
	public void delete(@RequestParam("cartNo") int cartNo, Writer out) {
	    logger.info("/cart/delete - delete()");
	    logger.info("{}", cartNo);
	    
	    // cartNo를 기반으로 장바구니 항목 삭제 로직 수행
	    boolean success = cartService.deleteCartItem(cartNo);
	    
	    logger.info("{}", success);
	    
	    // 삭제 성공 여부에 따라 응답 데이터 설정
	    try {
	        out.write("{\"result\": " + success + "}");
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	
	//----------------------------------------------------------------------------------------
	//항목 구매는 OrderController 페이지에서 처리하기
	
	//----------------------------------------------------------------------------------------
	//음원 페이지에서 장바구니 담으면 오는 메소드
	//여기서 중복 확인해서 장바구니 중복 리턴해줘야함
	@GetMapping("/add")
	public void add(Cart add, Writer out) {
		logger.info("cart/add - add()");
		logger.info("장바구니 담을 대상: {} ", add);
		
		//장바구니 담기(중복검사는 서비스에서 해주려고함)
		boolean success = cartService.addCartItem(add);
		 
		logger.info("장바구니 담기 어쨌든 성공 : {}",success );
		
	    //장바구니 아이콘 누르면 어쨌든 담길거임. 
		//다만, 중복 여부에 따라 true false로 반환되지만, 
		//jsp에는 true 값일 경우에만 값을 보내게 해주려고 함.
		if(success) {
			try {
				out.write("{\"result\": " + success + "}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			logger.info("jsp로 true 값일 때만 전송 완료!");
		}
		
	}
	
}
