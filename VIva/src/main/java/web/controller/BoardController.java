package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Tag;
import web.dto.Users;
import web.service.face.BoardService;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired BoardService boardService;
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/list")
	public void list( Paging paging, Model model ) {
		logger.info("/board/list [GET]");
		
		//페이징 계산
		Paging page = boardService.getPaging( paging );
		logger.info("{}", page);
		
		//게시글 목록 조회
		List<Board> boardList = boardService.list( page );
		
		model.addAttribute("page", page);
		model.addAttribute("boardList", boardList);
	}
	
	@RequestMapping("/view")
	public String view( Board viewBoard, Model model ) {
		logger.info("/board/view");
		
		//잘못된 게시글 번호 처리
		if( viewBoard.getBoardNo() < 1 ) {
			return "redirect:./list";
		}
		
		//게시글 조회
		viewBoard = boardService.view( viewBoard );
		logger.info("조회된 게시글 {}", viewBoard);
		
		//모델값 전달  - 게시글
		model.addAttribute("viewBoard", viewBoard);
		
		
		return "board/view";
	}
		
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProc( 
			
			Board board, MultipartFile file, HttpSession session, Model model,
			@RequestParam(value="id", required=false) String id,
			@RequestParam(value="title", required=false) String title,
			@RequestParam(value="content", required=false) String content,
			@RequestParam(value="categoryType", required=false) String categoryType
//			@RequestParam(value="id") String id,
//			@RequestParam(value="title") String title,
//			@RequestParam(value="content") String content
			
			){
		
		logger.info("/board/write [POST]");	
		
		  //로그인 String id = null; if( session.getAttribute("id")!= null ) {
//		  logger.info("로그인 실패"); return "redirect:./main"; } else {
//		  logger.info("로그인 성공"); id = (String)session.getAttribute("id");
//		  
//		  } model.addAttribute("userId", id);
		
//		board.setUserId( (String) session.getAttribute("id") );
//		board.setUserNick( (String) session.getAttribute("nick") );	
//		board.setUserId("id");
//		board.setUserNick("nick");
//		board.setBoardTitle("write");// 여기에 tilte담아야함
//		board.setBoardContent("content");
		
		model.addAttribute("id", id);
		model.addAttribute("title", title);
		model.addAttribute("content", content);
		
		
		boardService.write( board, file );
		
		return "redirect:./list";	//게시글 목록
	}

}
