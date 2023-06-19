package web.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

public class Credit {
	private int dealNo;
	private int userNo;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm:ss")
	private Timestamp dealDate;
	private int dealCategory;
	private int amount;
	
	public Credit() {}

	public Credit(int dealNo, int userNo, Timestamp dealDate, int dealCategory, int amount) {
		super();
		this.dealNo = dealNo;
		this.userNo = userNo;
		this.dealDate = dealDate;
		this.dealCategory = dealCategory;
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Credit [dealNo=" + dealNo + ", userNo=" + userNo + ", dealDate=" + dealDate + ", dealCategory="
				+ dealCategory + ", amount=" + amount + "]";
	}

	public int getDealNo() {
		return dealNo;
	}

	public void setDealNo(int dealNo) {
		this.dealNo = dealNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Timestamp getDealDate() {
		return dealDate;
	}

	public void setDealDate(Timestamp chargeTime) {
		this.dealDate = chargeTime;
	}

	public int getDealCategory() {
		return dealCategory;
	}

	public void setDealCategory(int dealCategory) {
		this.dealCategory = dealCategory;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}


}
