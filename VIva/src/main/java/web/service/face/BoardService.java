package web.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Board;
import web.dto.Tag;
import web.util.Paging;

public interface BoardService {

	/**
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * 파라미터 객체의 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 
	 * 두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param paging - curPage를 저장하고 있는 객체
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(Paging paging);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param page - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Board> list(Paging page);

	/**
	 * 게시글 상세보기
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Board view(Board viewBoard);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param board - 게시글 정보 DTO
	 * @param file - 첨부파일 정보 DTO
	 */
	public void write(Board board, MultipartFile file);




}
