package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.BoardDao;
import web.dto.Board;
import web.dto.Tag;
import web.service.face.BoardService;
import web.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardDao boardDao;

	@Override
	public Paging getPaging(Paging paging) {
		
		//총 게시글 수 조회
		int totalCount = boardDao.selectCntAll();
		
		//페이징 계산
		Paging page = new Paging( totalCount, paging.getCurPage() );
		
		return page;
	}
	
	
	@Override
	public Board view(Board viewBoard) {
		
		//조회수 증가
		boardDao.hit( viewBoard );
		
		//상세보기 조회 결과 리턴
		return boardDao.select(viewBoard);
	}
	
	
	@Override
	public List<Board> list(Paging page) {
		
		return boardDao.selectList( page );
	}
	
	@Override
	public void write(Board board, MultipartFile file) {
		
		if("".equals( board.getBoardTitle() ) ) {
			board.setBoardTitle("제목 없음");
		}
		boardDao.insertBoard( board );
		
		//----------------------------------------------
		
		//빈 파일인 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		
	}

	

}
