package web.dto;

import java.util.Date;

public class Files {

	private int fileNo;
	private String originname;
	private String storedname;
	private int filesize;
	private Date fileDate;
	private int boardNo;
	
	public Files() {}

	@Override
	public String toString() {
		return "Files [fileNo=" + fileNo + ", originname=" + originname + ", storedname=" + storedname + ", filesize="
				+ filesize + ", fileDate=" + fileDate + ", boardNo=" + boardNo + "]";
	}

	public Files(int fileNo, String originname, String storedname, int filesize, Date fileDate, int boardNo) {
		super();
		this.fileNo = fileNo;
		this.originname = originname;
		this.storedname = storedname;
		this.filesize = filesize;
		this.fileDate = fileDate;
		this.boardNo = boardNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getStoredname() {
		return storedname;
	}

	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public Date getFileDate() {
		return fileDate;
	}

	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
}
