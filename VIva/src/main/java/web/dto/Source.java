package web.dto;

public class Source {

private int sourceNo;
private String sourceName;
private int bpm;
private String key;
private String sourceImg;
private int sourcePrice;
private int tagNo;

public Source() {}

@Override
public String toString() {
	return "Source [sourceNo=" + sourceNo + ", sourceName=" + sourceName + ", bpm=" + bpm + ", key=" + key
			+ ", sourceImg=" + sourceImg + ", sourcePrice=" + sourcePrice + ", tagNo=" + tagNo + "]";
}

public Source(int sourceNo, String sourceName, int bpm, String key, String sourceImg, int sourcePrice, int tagNo) {
	super();
	this.sourceNo = sourceNo;
	this.sourceName = sourceName;
	this.bpm = bpm;
	this.key = key;
	this.sourceImg = sourceImg;
	this.sourcePrice = sourcePrice;
	this.tagNo = tagNo;
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

public String getSourceImg() {
	return sourceImg;
}

public void setSourceImg(String sourceImg) {
	this.sourceImg = sourceImg;
}

public int getSourcePrice() {
	return sourcePrice;
}

public void setSourcePrice(int sourcePrice) {
	this.sourcePrice = sourcePrice;
}

public int getTagNo() {
	return tagNo;
}

public void setTagNo(int tagNo) {
	this.tagNo = tagNo;
}






}
