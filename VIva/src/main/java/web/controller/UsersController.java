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
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String joinProcess(Users users) {
		
		boolean joinResult = usersService.join(users);
		
		if(joinResult) {
			logger.info("회원가입 성공");
			return "redirect:/";			
		} else {
			logger.info("회원가입 실패");
			return "redirect:./join";
		}
	}
	
	@RequestMapping("/main")
	public void main() {}
	
}



















