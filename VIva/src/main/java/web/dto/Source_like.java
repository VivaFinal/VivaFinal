package web.dto;

public class Source_like {
	
	private int	sourceNo;
	private int	userNo;
	
	public Source_like() {	}

	public Source_like(int sourceNo, int userNo) {
		super();
		this.sourceNo = sourceNo;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Source_like [sourceNo=" + sourceNo + ", userNo=" + userNo + "]";
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
