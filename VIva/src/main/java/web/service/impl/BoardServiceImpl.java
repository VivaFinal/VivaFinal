package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.BoardDao;
import web.dto.Board;
import web.dto.Files;
import web.dto.Tag;
import web.service.face.BoardService;
import web.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired BoardDao boardDao;
	@Autowired private ServletContext context;
	
	@Override
	public List<Board> list(Paging page) {		
		return boardDao.selectList(page);
	}

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
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//----------------------------------------------

		Files boardFile = new Files();
		boardFile.setBoardNo( board.getBoardNo() );
		boardFile.setOriginname(originName);
		boardFile.setStoredname(storedName);
		
		boardDao.insertFile(boardFile);
	}
	
	
	@Override
	public Files getAttachFile(Board viewBoard) {
		return boardDao.selectBoardFileByBoardNo(viewBoard);
	}

	@Override
	public void update(Board board, MultipartFile file) {
		
		if( "".equals( board.getBoardTitle() ) ) {
			board.setBoardTitle("(제목없음)");
		}
		boardDao.update(board);
		
		//-------------------------------------------------------
		
				//업로드된 파일 처리
				if(file !=null) {
					//빈 파일일 경우
//					if( file.getSize() <= 0 ) {
//						return;
//					}
//					
					//파일이 저장될 경로
					String storedPath = context.getRealPath("upload");
					File storedFolder = new File(storedPath);
					if( !storedFolder.exists() ) {
						storedFolder.mkdir();
					}

					//파일이 저장될 이름
					String originName = file.getOriginalFilename();
					String storedName = originName + UUID.randomUUID().toString().split("-")[4];
					
					//저장될 파일 정보 객체
					File dest = new File(storedFolder, storedName);

					try {
						file.transferTo(dest);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					Files boardFile = new Files();
					boardFile.setBoardNo( board.getBoardNo() );
					boardFile.setOriginname(originName);
					boardFile.setStoredname(storedName);
					
					boardDao.insertFile(boardFile);
				}

				//-----------------------------------------------------

		
	}

	@Override
	public void delete(Board board) {
		
		boardDao.delete(board);	
	}
	
}
