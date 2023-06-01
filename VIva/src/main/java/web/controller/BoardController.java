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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Files;
import web.dto.Tag;
import web.dto.Users;
import web.service.face.BoardService;
import web.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired BoardService boardService;
	
	private final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list( Paging paging, Model model, String userNick ) {
		logger.info("/board/list [GET]");
		
		//페이징 계산
		Paging page = boardService.getPaging(paging);
		logger.info("{}", page);
		
		//게시글 목록 조회
		List<Board> boardList = boardService.list(page);
		
		model.addAttribute("page", page);
		model.addAttribute("boardList", boardList);
		model.addAttribute("userNick", userNick);
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
		logger.info("viewBoard : {} ",viewBoard);
		//첨부파일 정보 모델값 전달
		Files boardFile = boardService.getAttachFile(viewBoard);
		model.addAttribute("boardFile", boardFile);
		
		return "board/view";
	}
		
	
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProc( 
			
			Board board, MultipartFile file,Model model,
			@RequestParam(value="boardTitle", required=false) String boardTitle,
			@RequestParam(value="boardContent", required=false) String boardContent	
			
			){		
		logger.info("/board/write [POST]");	
		
		  //로그인 String id = null; if( session.getAttribute("id")!= null ) {
//		  logger.info("로그인 실패"); return "redirect:./main"; } else {
//		  logger.info("로그인 성공"); id = (String)session.getAttribute("id");
//		  
//		  } model.addAttribute("userId", id);
		
		board.setBoardTitle(boardTitle);// 여기에 tilte담아야함
		board.setBoardContent(boardContent);
	
		boardService.write( board, file );
		
		return "redirect:./list";	//게시글 목록
	}
	
	
	@GetMapping("/update")
	public String update( Board board, Model model ) {
		
		//잘못된 게시글 번호 처리
		if( board.getBoardNo() < 1 ) {
			return "redirect:/board/list";
		}
		
		//수정할 게시글의 상세보기
		board = boardService.view(board);
		model.addAttribute("updateBoard", board);
		
		//첨부파일 정보 모델값 전달
		Files boardFile = boardService.getAttachFile(board);
		model.addAttribute("boardFile", boardFile);
			
		return "board/update";
	}
	
	@PostMapping("/update")
	public String updateProc( Board board, MultipartFile file ,
			@RequestParam(value="boardTitle", required=false) String boardTitle,
			@RequestParam(value="boardContent", required=false) String boardContent
			) {
		
		board.setBoardTitle(boardTitle);// 여기에 tilte담아야함
		board.setBoardContent(boardContent);
		
		
		
		System.out.println("===============================");
		System.out.println(board);
		System.out.println("===============================");
		//게시글+첨부파일 수정
		boardService.update( board, file );
		
		return "redirect:./view?boardNo=" + board.getBoardNo();
	}
	
	@RequestMapping("/delete")
	public String delete( Board board ) {
		boardService.delete(board);
		
		return "redirect:./list";
	}

}
