package web.dto;

import java.util.Date;

public class Users {

	private int userNo;
	private String userId;
	private String userPw;
	private String userNick;
	private String userGrade;
	private String userProfile;
	private String userName;
	private Date userBirth;
	private String userEmail;
	private String userMobile;
	private Date user_joindate;
	private Date userOutdate;
	private Date userLog;
	private String accessToken;
	
	public Users() {}

	@Override
	public String toString() {
		return "Users [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userNick=" + userNick
				+ ", userGrade=" + userGrade + ", userProfile=" + userProfile + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userEmail=" + userEmail + ", userMobile=" + userMobile
				+ ", user_joindate=" + user_joindate + ", userOutdate=" + userOutdate + ", userLog=" + userLog
				+ ", accessToken=" + accessToken + "]";
	}

	public Users(int userNo, String userId, String userPw, String userNick, String userGrade, String userProfile,
			String userName, Date userBirth, String userEmail, String userMobile, Date user_joindate, Date userOutdate,
			Date userLog, String accessToken) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userNick = userNick;
		this.userGrade = userGrade;
		this.userProfile = userProfile;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userMobile = userMobile;
		this.user_joindate = user_joindate;
		this.userOutdate = userOutdate;
		this.userLog = userLog;
		this.accessToken = accessToken;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public Date getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}

	public Date getUserOutdate() {
		return userOutdate;
	}

	public void setUserOutdate(Date userOutdate) {
		this.userOutdate = userOutdate;
	}

	public Date getUserLog() {
		return userLog;
	}

	public void setUserLog(Date userLog) {
		this.userLog = userLog;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	
	
	
	
}                               
