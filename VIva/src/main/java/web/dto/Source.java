package web.dto;

public class Source {

	private int sourceNo;
	private String sourceName;
	private int bpm;
	private String key;
	private int sourcePrice;
	private int packNo;
	private int userNo;
	private int tagNo;
	
	public Source() {	}

	public Source(int sourceNo, String sourceName, int bpm, String key, int sourcePrice, int packNo, int userNo,
			int tagNo) {
		super();
		this.sourceNo = sourceNo;
		this.sourceName = sourceName;
		this.bpm = bpm;
		this.key = key;
		this.sourcePrice = sourcePrice;
		this.packNo = packNo;
		this.userNo = userNo;
		this.tagNo = tagNo;
	}

	@Override
	public String toString() {
		return "Source [sourceNo=" + sourceNo + ", sourceName=" + sourceName + ", bpm=" + bpm + ", key=" + key
				+ ", sourcePrice=" + sourcePrice + ", packNo=" + packNo + ", userNo=" + userNo + ", tagNo=" + tagNo
				+ "]";
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}

	public String getSourceName() {
		return sourceName;
	}

	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}

	public int getBpm() {
		return bpm;
	}

	public void setBpm(int bpm) {
		this.bpm = bpm;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getSourcePrice() {
		return sourcePrice;
	}

	public void setSourcePrice(int sourcePrice) {
		this.sourcePrice = sourcePrice;
	}

	public int getPackNo() {
		return packNo;
	}

	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	


}