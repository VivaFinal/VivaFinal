package web.controller;


import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Users;
import web.service.face.KakaoService;
import web.service.face.MailSendService;
import web.service.face.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired UsersService usersService;
	@Autowired KakaoService kakaoService; 
	@Autowired MailSendService mailService;
	
	@GetMapping("/login")
	public void login() {
		logger.info("/login [GET]");
	}
	
	//임시로 만든 main페이지
	@GetMapping("/main")
	public void kakaoLogin() {
		logger.info("users/main [GET]");
	}
	
	@GetMapping("/kakaologin")
	   public String kakaoLogin(
	         @RequestParam("code")String code
			   , HttpSession session, Users users) {
	      
	      logger.info("/kakaologin [GET]");
	      logger.info("code: {}", code);
	      //카카오 인가코드로 access_token 요청후 저장
	      String access_Token = kakaoService.getAccessToken(code);
	      logger.info("controller access_token : {}" + access_Token);

	      // 액세스 토큰으로 읽어온 사용자 정보
	      HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
	      logger.info("Info {}", userInfo);

	      
	      // 파라미터에 kakao에서 읽어온 고유ID를 입력
	      users.setKakaoId((String)userInfo.get("id"));
	      
	      //카카오 ID가 Db에 있는지 확인해서 true, false 반환
	      boolean kakaoIdCheck = usersService.getkakaoId(users);
	      logger.info("users{}",users.getKakaoId());
	      
	      
           if(kakaoIdCheck) {
        	   //카카오ID가 Db에 있다면 세션에s id,email저장 후 로그인 성공!
        	   logger.info("회원 정보 조회 여부 : {}",kakaoIdCheck);

        	   session.setAttribute("login", true);
        	   
	          //카카오 아이디로 회원 번호 저장
		      int num = usersService.selectAll(users);
		      logger.info("유저번호 : {}",num);
	          session.setAttribute("userNo", num);
        	   
        	   return "/users/main";
           }else {
        	   //카카오 ID가 DB에 없으면 로그인처음이므로 카카오 회원가입으로 보내서 추가회원정보 받기
        	   logger.info("회원 정보 조회 여부 : {}",kakaoIdCheck);

        	   session.setAttribute("kakaoId", userInfo.get("id"));
        	   session.setAttribute("userNo", users.getUserNo());
        	   logger.info("userNo : {} ", users.getUserNo());
        	   
        	   return "/users/kakaojoin";
           }
	           
    }
	
	@PostMapping("/login")
	public String loginProcess(Users users, HttpSession session
			,HttpServletRequest request
			,HttpServletResponse response
			,boolean rememberId
			){
		logger.info("{}", users);

		//일반 로그인시 유저 아이디와 비밀번호 일치하면 true,false
		boolean loginResult = usersService.login(users);
		
		// true값 받아와서 로그인 성공시
		if( loginResult ) {
			logger.info("로그인 성공");
			//유저 번호 가져오기
			Users getUserNo = usersService.getNo(users);
			//세션에 true값 저장
			session.setAttribute("login", loginResult);
			
			//***************아이디 저장하기********************
			session.setAttribute("id", users.getUserId());
			//rememberId는 체크박스 name이다
			//아이디 저장 체크박스가 체크되어있으면 쿠키저장
			if(rememberId(rememberId)) {
				Cookie cookie = new Cookie("id", users.getUserId());
				response.addCookie(cookie);
			}else {
				//아이디 저장 체크박스가 체크되어있지않으면 cookie삭제
				Cookie cookie = new Cookie("id", users.getUserId());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			session.setAttribute("nick", usersService.getNick(users));
			session.setAttribute("userNo", getUserNo.getUserNo());
			
			return "redirect:./main";
			
		} else {	//로그인 실패시
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return "redirect:./login";
		}
		
	}
	
	//아이디 저장 체크박스 눌렀으면 true 가져오기
	private boolean rememberId(boolean rememberId) {
		return rememberId;
	}


	// 발급받은 토큰을 만료시켜 로그아웃 시킨다
   // 리턴은 메인페이지로
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	
    	if(session.getAttribute("access_Token") != null) {
    		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
    	}
        
    	// 세션 삭제
        session.invalidate();
        logger.info("logout() - 로그아웃 성공");
        return "redirect:./main";
    }


	@GetMapping("/join")
	public void join() {}
	
	//회원가입시 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
	
	@PostMapping("/join")
	public String joinProcess(Users users, Model model) {
		
		
		boolean joinResult = usersService.join(users);
				
			if(joinResult) {
				logger.info("회원가입 성공");
				return "redirect:./login";			
			} else {
				logger.info("회원가입 실패");
				return "redirect:./join";
			}
			
		}
		
	@GetMapping("/kakaojoin")
	public void kakaojoin() {
	
	}
	@PostMapping("/kakaojoin")
	public String kakaojoinProc(Users users,HttpSession session) {
		
		String kakao = (String)session.getAttribute("kakaoId");
		
		users.setKakaoId(kakao);
		logger.info("users : {}",users);
		
		usersService.kakaojoin(users);
		
		return "redirect:./main";
	}

	//아이디 중복 검사
	@RequestMapping("/userIdChk")
	@ResponseBody
	public String userIdChk(Users users) {
		
		logger.info("userIdChk입니다");
		
		int result = usersService.idCheck(users);
		
		logger.info("결과값 {} " , result);
		
		//result가 1이면 DB에 아이디 존재
		if(result != 0) {
			return "fail";	//중복 아이디 존재
		}else {
			return "success";	//중복 아이디 없음
		}
	}
	//닉네임 중복 검사
	@RequestMapping("/userNickChk")
	@ResponseBody
	public String userNickChk(Users users) {
		
		logger.info("userNickChk입니다");
		
		int result = usersService.idCheck(users);
		
		logger.info("결과값 {} " , result);
		
		//result가 1이면 DB에 닉네임 존재
		if(result != 0) {
			return "fail";	//중복 닉네임 존재
		}else {
			return "success";	//중복 닉네임 없음
		}
	}
	
	//아이디찾기에서 이름과 이메일 존재여부 ajax
	@RequestMapping("/checkIdPw")
	@ResponseBody
	public String nameEmailfind(Users users, Model model) {
		
		logger.info("userNameChk입니다", users);
		
		Users result = usersService.nameEmailCheck(users);
		
		logger.info("결과값 {} " , result);
		
		
		//result가 DB에 이름과 닉네임 존재하지않으면 fail을 리턴
		if(result == null || "".equals(result.getUserEmail())) {

			return "fail";
		}else {
			model.addAttribute("userId",result.getUserId());
			
			return "success";
		}
	}
	
	//아이디찾기
	@RequestMapping("/idcheck")
	public void idcheck(Users users) {
		logger.info("/users/idcheck");
	}

	//비밀번호 찾기
	@RequestMapping("/pwcheck")
	public void pwfind(Users users) {
		logger.info("/users/pwcheck");
		
	}
	
	// 마이페이지
	@RequestMapping("/mypage")
	public void userInfo(Users users) {
		logger.info("/users/mypage[GET]");
	}
	
}



















