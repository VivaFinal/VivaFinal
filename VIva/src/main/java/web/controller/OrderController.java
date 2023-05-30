package web.controller;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Cart;
import web.dto.MySource;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.Users;
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
	
}
