package web.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Users;
import web.service.face.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired UsersService usersService;
	
	@GetMapping("/login")
	public void login() {}
	
//	@GetMapping("/main")
//	public String login(@RequestParam("code")String code, HttpSession session) {
//		logger.info("/users/kakao");
//		
//		logger.info("code: {}", code);
//		String access_Token = kakaoService.getAccessToken(code);
//		logger.info("controller access_token : {}" + access_Token);
//		
//		HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
//	    System.out.println("login Controller : " + userInfo);
//	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
//	    if (userInfo.get("email") != null) {
//	        session.setAttribute("userId", userInfo.get("email"));
//	        session.setAttribute("access_Token", access_Token);
//	        session.setAttribute("kakaoId", userInfo.get("id"));
//	        
//	    }
//	    
//		return "redirect:./main";
//		
//	}

	@PostMapping("/login")
	public String loginProcess(Users users, HttpSession session) {
		logger.info("{}", users);


		boolean loginResult = usersService.login(users);
		
		if( loginResult ) {
			logger.info("로그인 성공");
			
			session.setAttribute("login", loginResult);
			session.setAttribute("id", users.getUserId());
			session.setAttribute("nick", usersService.getNick(users));
			
			return "redirect:./main";
			
		} else {
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return "redirect:./login";
		}
		
	}
	
//	@RequestMapping("/logout")
//	public String logout(HttpSession session) {
//		
//		kakaoService.kakaoLogout((String)session.getAttribute("access_Token"));
//		session.removeAttribute("access_Token");
//		session.removeAttribute("userId");
//		return "redirect:./main";
//	}
	
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String joinProcess(Users users) {
		
		boolean joinResult = usersService.join(users);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:./login";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:./join";
		}
	}
	
	
	@RequestMapping("/idfind")
	public void idfind(Users users) {
		
	}
	
	@RequestMapping("/pwfind")
	public void pwfind(Users users) {
		
	}
	@RequestMapping("/updateInfo")
	public void updateInfo(Users users) {
		
	}
	
}



















