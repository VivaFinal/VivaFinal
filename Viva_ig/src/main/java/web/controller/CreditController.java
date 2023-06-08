package web.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Credit;
import web.dto.TossApi;
import web.dto.Users;
import web.service.face.CreditService;

@Controller
@RequestMapping("/credit")
public class CreditController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CreditService creditService;
	
	//로그인 기능 구현 전, userNo 알아내기 위해 임시로 만든 페이지
	@RequestMapping("/test")
	public String test() {
		logger.info("credit/list - test()");
		
		return "/credit/test";
	}

	//----------------------------------------------------------------------------------------
	//userNo 알아낸 뒤, 크레딧 목록 부르는 페이지
	@RequestMapping("/list")
	public void list(Credit userNo, Model model) {
		logger.info("credit/list - list()");
		
		//추후, 세션값으로 회원 정보 가져올때 코드 작성해야함
		
		//회원번호 임시로 지정(44)
		userNo.setUserNo(44);
		logger.info("userno: {} ", userNo);
		
		
		//1. 크레딧 전체 내역(default) 조회하기
		List<Credit> creditList = new ArrayList<>(); 
		creditList = creditService.getCreditList(userNo);
		logger.info("조회내역:{}", creditList);
		model.addAttribute("list", creditList);
		
		//2.크레딧 총계 보내주기
		//회원 크레딧 잔액 구하기 (DB 조회 결과 null 일 경우 0 으로 반환)
		int res = 0; 
		res = creditService.selectCreditAcc(userNo);
		logger.info("크레딧잔액:{}", res);
		
		model.addAttribute("creditAcc", res);
		
		//3. 회원등급 보내주기
		//회원등급 확인하기 (0:일반회원, 1 : 업로더)
		Users user = new Users();
		user.setUserNo(userNo.getUserNo());
		String grade = "";
		grade = creditService.chkUserGrade(user);
		logger.info("회원등급 : {}", grade);
		
		model.addAttribute("grade", grade);
		logger.info("전송할 회원등급:{}", model.getAttribute("grade"));
		//문제는 이런 방식으로는 (String은 view로 전달 안되는가? Object 타입만 전달이 가능한가?) null 이 들어가 있어서 해결이 안된다,,,ㅠ
		//=> model.getAttribute()괄호 안에 따옴표까지 포함해서 써야 출력이 되는거다!!!!
	}

//----------------------------------------------------------------------------------------------------------------------
	//토스페이먼츠 결제 페이지 이동 시 
	@RequestMapping("/charge")
	public void charge(Credit userNo, Model model) {
		logger.info("credit/charge - 결제 페이지 이동");
		logger.info("userno: {} ", userNo);
		
		//orderID 로 랜덤 uuid 난수 생성하기
//		UUID uid = UUID.randomUUID();
//		logger.info("uid : {} ", uid);
//		//출력 : uid : 625a3eac-368f-4a18-b04e-1de60849a894 (매번 바뀜)
		
		//생성 시 UUID 형태이므로 String 형태로 바꿔줘야함
		String id = UUID.randomUUID().toString();
//		logger.info("id : {} ", id);
		
		//근데 너무 기니까, split 해서 전체 UUID 중 뒤에 16자리만 추출하려고 한다.
		logger.info("id: {}", "VIVA" + id.split("-")[2] + id.split("-")[3] + id.split("-")[4]);
		//출력 : ad7c7f904298e57a 잘되고 있다. 

		//orderID로 jsp에게 전달해주기
		String orderId= "VIVA" + id.split("-")[2] + id.split("-")[3] + id.split("-")[4];
		model.addAttribute("id", orderId);
		
		
		
	}
	
//----------------------------------------------------------------------------------------------------------------------
	//토스페이먼츠 결제 요청 시 
	@RequestMapping("/charging")
	public String charging(HttpServletRequest request, ModelAndView mav) {
		logger.info("credit/charging - 결제 요청후 결제 진행 중");

		//url에 담겨서 전달되는 4가지 요소 -> 결제 승인을 위해 사용해야함.
		String orderId = request.getParameter("orderId");
		String paymentKey = request.getParameter("paymentKey");
		String amount = request.getParameter("amount");
		String secretKey = "test_sk_P24xLea5zVAqyEqG6P6VQAMYNwW6:";

		logger.info(orderId);
		logger.info(paymentKey);
		logger.info(amount);
		logger.info(secretKey);

		//secretKey 뒤에 :를 붙이고 Base64로 인코딩을 해줘야함. (그 다음에 앞에 Basic 을 붙여줘야하는거임)
		Encoder encoder = Base64.getEncoder(); 
		//Base64 인코딩을 거치면 바이트 형태로 나올것이기에, byte형태의 배열 선언해둠.
		byte[] encodedBytes;
		//결제승인 url 을 위해 선언과 동시에 초기화
		HttpURLConnection connection = null;
		//결제 승인 페이지에서 200(성공) 및 400~ 500~ 에러 코드를 받아내기 위해서 int 변수 미리 만들어두기.
		int code = 0;
		
		//결제승인을 거친 정보를 JSONObject에 담을 것이기에, 선언과 동시에 초기화 
		JSONObject jsonObject = null;
		
		//null 값도 나올 수 있기에 try~catch 로 감싸준다.
		try {
			//secretKey의 UTF-8 바이트를 인코딩한 값을 배열에 담아준다.
			encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
			//String 변수에 담아준다..(이해안됨..ㅠ)
			String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);
			
			paymentKey = URLEncoder.encode(paymentKey, StandardCharsets.UTF_8);

			//결제 승인 페이지 . 여기를 거쳐야만 결제 요청이 완전히 승인됨!
			URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
			
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestProperty("Authorization", authorizations);
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestMethod("POST");
			connection.setDoOutput(true);

			//JsonObject를 다시 초기화해준다.
			JSONObject obj = new JSONObject();
			obj.put("paymentKey", paymentKey);
			obj.put("orderId", orderId);
			obj.put("amount", amount);

			OutputStream outputStream = connection.getOutputStream();
			outputStream.write(obj.toString().getBytes("UTF-8"));

			//결제 승인에 대한 응답을 받는다. 잘됐는지 아닌지. 200 뜬건지 400이나 500 떴는지 등..
			code = connection.getResponseCode();
			//응답코드가 200일때 true 아니면 false 로 불린값 변수를 만든다.
			boolean isSuccess = code == 200 ? true : false;

			//위에서 boolean 값이 200이어서 true 일때는 getInputStream 을 InputStream 값에 대입한다.
			InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();

			//이해안되는 코드임. reader 하나보구나...
			Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
			
			//inputStream에서 받아온 정보를 JSON에 담기위해 파싱 과정을 거쳐야한다.
			JSONParser parser = new JSONParser();
			//reader에서 파싱한 데이터를 JSONObject로 변환하여 jsonObject에 담아준다.
			jsonObject = (JSONObject) parser.parse(reader);

			//잘 담겼음을 알 수 있다.
			logger.info("{}", jsonObject);
			
			//위에 url 열고 할거 다했으니, 닫아주는게 좋다. 우리 한창 connection 닫아준것처럼 
			responseStream.close();
			//null 값이 있을 수 있기에 catch 로 잡아준다. 자세한 내용은 솔직히 모르겠다..
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//위에서 안전하게 파싱한 jsonObject를 서비스로 넘긴다. 사실 위의 과정을 전부 서비스에서 해도 될 듯 하지만, 나는 아직 확신이 없기에. 일단 이대로 두기로. 
		int dealNo = creditService.addPurchaseInfo(jsonObject);
		
		logger.info("dealNo : {}", dealNo);

		HttpSession session = request.getSession();
		
		session.setAttribute("dealNo", dealNo);
		
		return "redirect:/credit/chargeOk";
	}
	
	//결제 완료 시, 이동할 리다이렉트 페이지!
	@RequestMapping("/chargeOk")
	public void chargeOk(@SessionAttribute(value="dealNo") int dealNo) {
		logger.info("credit/chargeOk - 결제 완료");
		//크레딧 잔액 + 결제방식 + 실제 결제 금액 + 결제 승인 시각 조회해오기
		
		logger.info("{}", dealNo);
		
	}

	
	//결제 실패 시, 이동할 리다이렉트 페이지!
	@RequestMapping("/fail")
	public void fail(Credit userNo, Model model) {
		logger.info("credit/fail - 결제 실패");
		logger.info("userno: {} ", userNo);
		
	}
	

//-----------------------------------------------------------------------------
	@RequestMapping("/exchange")
	public void exchange(Credit userNo, Model model) {
		logger.info("credit/exchange - exchange()");
		logger.info("userno: {} ", userNo);
	}

	
//-----------------------------------------------------------------------------
	//크레딧 내역에서 X표 눌러서 한 항목씩 삭제하는 url
	@ResponseBody
	@RequestMapping("/delete")
	//스프링 반환값을 int 로 준적은 처음인데... 이렇게 해도 되는걸까? 확신없음..ㅠ
	public int delete(
			//ajax로 넘어온 chbox[] 배열을 List<String> 에 담겠다는거임.
			//만약 앞에 @RequestParam(value = "chbox[]") 를 생략하면, 
			//No primary or single public constructor found for interface java.util.List - and no default constructor found either 
			//에러가 뜸!!!
			//이유는 원래 스프링이 알아서 바인딩 해주는 아이이나, 기본 생성자가 없는 모델객체인 List<String> 에는 자동으로 바인딩해줄 조건이 없는거임.
			@RequestParam(value = "chbox[]") List<String> chArr, Credit deal
			) throws Exception {
			
		logger.info("credit/delete - delete()");
		logger.info("삭제요청항목 : {}", chArr);
		
		//추후, 세션값으로 회원 정보 가져올때 코드 작성해야함
		
		//회원번호 임시로 지정(44)
		deal.setUserNo(44);
		
		//성공적으로 끝날지에 대한 결과값
		int result = 0;
		
		//dealNo 선언과 동시에 초기화
		int dealNo = 0;
		
		//배열로 담아온 dealNo를 하나씩 꺼내어 Credit TB에 set 해주기
		//추후, 세션 종료 여부를 위해 if 문으로 걸러주는거임. 근데 현재는 그냥 44를 담아놓은 Credit deal 로 써놓음
		if(deal !=null) {
			logger.info("세션유지중(추후 개발)");

			for(String i : chArr) {
				//setDealNo을 하려면, int 형으로 넣어야하는데 우리는 String 값으로 받아왔으니,
				//위에서 만들어주 int dealNo 이라는 그릇에다가 parseInt한 값을 담아서 한번에 set을 해줘야한다.
				dealNo = Integer.parseInt(i);
				deal.setDealNo(dealNo);
				logger.info("잘 담김? :{}", deal );
				//하나씩 출력되면서 잘 담긴것을 확인할 수 있음
				//하지만 for each 문 밖에서 확인하면, 단 하나의 항목만 출력된것을 확인할 수 있음.
				//그러므로, 출력도, service로 넘길 메소드도 for each 문 안에서 하나씩 진행될수 있도록 넣어줘야함.
				creditService.deleteDeal(deal);
			}
			logger.info("성공적으로 update");
			//위의 구문이 성공적으로 끝날 시에...
			//로그인이 안되었거나 세션이 만료되어 자동 로그아웃된 경우 작동하기 않게 하기 위함
			//물론 이 코드가 없더라도 카트가 삭제되지 않고 에이젝스의 error를 이용해 구분할 수 있지만, 
			//컨트롤러보다 더 깊은 Service와 DAO를 거쳐 쿼리문이 실행되는걸 막을 수 있습니다.
			//뭔말이야? 이해안됨
			result = 1;
			
		}
		return result;
	}
	
}
