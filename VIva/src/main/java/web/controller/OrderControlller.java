package web.controller;

import java.io.Writer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Users;
import web.service.face.OrderService;

@Controller
public class OrderControlller {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired OrderService orderService;
	
	@RequestMapping("/source/genre/download")
	public void sourceBuy() {
		logger.info("source buy()");
		
	}

	//--------------------------------------------------------------------
	//장바구니에서 항목 구매시 처리할 메소드
//	@ResponseBody
	@RequestMapping("/cart/buy")
	public void cartBuy(Users userNo, int sourceNo, int cartNo, Writer out) {
		logger.info("cart buy()");
		
		logger.info("sourceNo : {}", sourceNo);
		logger.info("cartNo : {}", cartNo);
		
		//회원번호 임시로 지정(44번)
		//(세션 기능 완료되면 주석처리하기!!)
		userNo.setUserNo(44);
		logger.info("userNo : {}", userNo.getUserNo());
		
		//회원의 구매가능 잔고 확인 
		boolean purchase = orderService.chkCreditAcc(userNo, sourceNo);
		
		//구매할 소스의 총계 구하기
		
		
		//sourceNo를 기반으로 장바구니 항목 구매 로직 수행
		boolean success = orderService.orderCartItem(sourceNo);
	}
	
//	@GetMapping("/delete")
//	public void delete(@RequestParam("cartNo") int cartNo, Writer out) {
//	    logger.info("/cart/delete - delete()");
//	    logger.info("{}", cartNo);
//	    
//	    // cartNo를 기반으로 장바구니 항목 삭제 로직 수행
//	    boolean success = cartService.deleteCartItem(cartNo);
//	    
//	    logger.info("{}", success);
//	    
//	    // 삭제 성공 여부에 따라 응답 데이터 설정
//	    try {
//	        out.write("{\"result\": " + success + "}");
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	    }
//	}
	
}
