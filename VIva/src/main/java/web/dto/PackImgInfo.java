package web.dto;

public class PackImgInfo {
	
	private String packImgOriginname;
	private String packImgStoredname;
	private int packNo;
	
	public PackImgInfo() {	}

	public PackImgInfo(String packImgOriginname, String packImgStoredname, int packNo) {
		super();
		this.packImgOriginname = packImgOriginname;
		this.packImgStoredname = packImgStoredname;
		this.packNo = packNo;
	}

	@Override
	public String toString() {
		return "PackImgInfo [packImgOriginname=" + packImgOriginname + ", packImgStoredname=" + packImgStoredname
				+ ", packNo=" + packNo + "]";
	}

	public String getPackImgOriginname() {
		return packImgOriginname;
	}

	public void setPackImgOriginname(String packImgOriginname) {
		this.packImgOriginname = packImgOriginname;
	}

	public String getPackImgStoredname() {
		return packImgStoredname;
	}

	public void setPackImgStoredname(String packImgStoredname) {
		this.packImgStoredname = packImgStoredname;
	}

	public int getPackNo() {
		return packNo;
	}

	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}
	
	
	

}
