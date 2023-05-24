package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Tag;
import web.service.face.BoardService;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired BoardService boardService;
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/list")
	public void Page( Paging paging, Model model ) {
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
	public String writeProc( Board board, MultipartFile file, HttpSession session ) {
		logger.info("/board/write [POST]");
		
		board.setUserId( (String) session.getAttribute("id") );
		board.setUserNick( (String) session.getAttribute("nick") );
		
		boardService.write( board, file );
		
		return "redirect:./list";	//게시글 목록
	}

}
