package web.dto;

import java.util.Date;

public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String categoryType;
	private int boardHit;
	private int boardLike;
	private int userNo;
	private int userNick;
	
	public Board() {}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", categoryType=" + categoryType + ", boardHit=" + boardHit
				+ ", boardLike=" + boardLike + ", userNo=" + userNo + ", userNick=" + userNick + "]";
	}

	public Board(int boardNo, String boardTitle, String boardContent, Date boardDate, String categoryType, int boardHit,
			int boardLike, int userNo, int userNick) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.categoryType = categoryType;
		this.boardHit = boardHit;
		this.boardLike = boardLike;
		this.userNo = userNo;
		this.userNick = userNick;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public int getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserNick() {
		return userNick;
	}

	public void setUserNick(int userNick) {
		this.userNick = userNick;
	}

	
}