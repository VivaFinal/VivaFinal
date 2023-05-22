package web.dto;

import java.util.Date;

public class Pack {

private int packNo;       
private String packName;     
private String packContent;  
private String packImg;      
private Date packDate;     
private int tagNo;        
private int sourceNo;     

public Pack() {}

public Pack(int packNo, String packName, String packContent, String packImg, Date packDate, int tagNo, int sourceNo) {
	super();
	this.packNo = packNo;
	this.packName = packName;
	this.packContent = packContent;
	this.packImg = packImg;
	this.packDate = packDate;
	this.tagNo = tagNo;
	this.sourceNo = sourceNo;
}

@Override
public String toString() {
	return "Pack [packNo=" + packNo + ", packName=" + packName + ", packContent=" + packContent + ", packImg=" + packImg
			+ ", packDate=" + packDate + ", tagNo=" + tagNo + ", sourceNo=" + sourceNo + "]";
}

public int getPackNo() {
	return packNo;
}

public void setPackNo(int packNo) {
	this.packNo = packNo;
}

public String getPackName() {
	return packName;
}

public void setPackName(String packName) {
	this.packName = packName;
}

public String getPackContent() {
	return packContent;
}

public void setPackContent(String packContent) {
	this.packContent = packContent;
}

public String getPackImg() {
	return packImg;
}

public void setPackImg(String packImg) {
	this.packImg = packImg;
}

public Date getPackDate() {
	return packDate;
}

public void setPackDate(Date packDate) {
	this.packDate = packDate;
}

public int getTagNo() {
	return tagNo;
}

public void setTagNo(int tagNo) {
	this.tagNo = tagNo;
}

public int getSourceNo() {
	return sourceNo;
}

public void setSourceNo(int sourceNo) {
	this.sourceNo = sourceNo;
}




}
