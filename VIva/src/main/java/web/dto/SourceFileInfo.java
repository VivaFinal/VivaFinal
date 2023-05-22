package web.dto;

import java.util.Date;

public class SourceFileInfo {

	private int uploadNo;
	private String fileOriginname;
	private String fileStoredname;
	private int fileSize;
	private Date sourceDate;
	private int userNo;
	private int sourceNo;
	private int packNo;
	
	public SourceFileInfo() {}

	@Override
	public String toString() {
		return "SourceFileInfo [uploadNo=" + uploadNo + ", fileOriginname=" + fileOriginname + ", fileStoredname="
				+ fileStoredname + ", fileSize=" + fileSize + ", sourceDate=" + sourceDate + ", userNo=" + userNo
				+ ", sourceNo=" + sourceNo + ", packNo=" + packNo + "]";
	}

	public SourceFileInfo(int uploadNo, String fileOriginname, String fileStoredname, int fileSize, Date sourceDate,
			int userNo, int sourceNo, int packNo) {
		super();
		this.uploadNo = uploadNo;
		this.fileOriginname = fileOriginname;
		this.fileStoredname = fileStoredname;
		this.fileSize = fileSize;
		this.sourceDate = sourceDate;
		this.userNo = userNo;
		this.sourceNo = sourceNo;
		this.packNo = packNo;
	}

	public int getUploadNo() {
		return uploadNo;
	}

	public void setUploadNo(int uploadNo) {
		this.uploadNo = uploadNo;
	}

	public String getFileOriginname() {
		return fileOriginname;
	}

	public void setFileOriginname(String fileOriginname) {
		this.fileOriginname = fileOriginname;
	}

	public String getFileStoredname() {
		return fileStoredname;
	}

	public void setFileStoredname(String fileStoredname) {
		this.fileStoredname = fileStoredname;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getSourceDate() {
		return sourceDate;
	}

	public void setSourceDate(Date sourceDate) {
		this.sourceDate = sourceDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}

	public int getPackNo() {
		return packNo;
	}

	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}
	
	
}                         
