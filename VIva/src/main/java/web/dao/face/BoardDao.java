package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.dto.Tag;
import web.util.Paging;

public interface BoardDao {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * paging.startNo, paging.endNo를 이용하여 rownum을 조회한다
	 * 
	 * @param page - 페이지 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Board> selectList(Paging page);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param board - 삽입할 게시글 정보
	 */
	public void insertBoard(Board board);

	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewBoard - 조회된 게시글 번호
	 */
	public void hit(Board viewBoard);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewBoard - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Board select(Board viewBoard);



}
