package web.controller;

import java.io.IOException;
import java.io.Writer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Cart;
import web.dto.Source;
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
	public void cartBuy(Users userNo, Source sourceNo, Cart cartNo, Writer out) {
		logger.info("cart buy()");
		
		logger.info("sourceNo : {}", sourceNo);
		logger.info("cartNo : {}", cartNo);
		
		//회원번호 임시로 지정(30번)
		//(세션 기능 완료되면 주석처리하기!!)
		userNo.setUserNo(30);
		logger.info("userNo : {}", userNo.getUserNo());
		
		//회원의 구매가능 잔고 확인 
		//구매할 소스의 총계 구하기
		//비교해서 구매가능한지(true, false 로 반환)
		boolean purchase = orderService.chkCreditAcc(userNo, sourceNo);
		logger.info("{}", purchase);
		
		if(purchase) {
			logger.info("선택사항 구매가능!");
		    
			//try~catch 구문을 써주긴 해야할지 모르겠다...
			try {
		        out.write("{\"result\": " + purchase + "}");
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
			
			//내가 다운로드 받은 소스인지 검증하기
			//근데 문제는 소스 선택 한번에 했을 때 부분 검증이 가능할지가... 걱정이다.
			//=> 그냥 장바구니 담을 때부터 이미 다운받은 소스는 담기 불가능하게 해놓았다.
//			orderDao.checkSource(sourceNo);
		
			
			//본격적인 구매 진행
			//service 에서 트랜잭션 진행할 생각!
			boolean success = orderService.purchaseCartItem(userNo, sourceNo, cartNo);
			
			
			
			
			
		} else {
			logger.info("선택사항 구매 불가능!");
			//크레딧이 부족해서 그런건지
			//source가 이미 구매해서 그런건지
			//source가 더이상 구매 불가능해서 그런건지 등등 
			//그에 따른 반환값을 정해줘야할 듯 함... 
			//아직은 모르겠음 ㅠ
			
			
		}
		
		
		
		//sourceNo를 기반으로 장바구니 항목 구매 로직 수행
//		boolean success = orderService.orderCartItem(sourceNo);
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
