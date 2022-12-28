package my.model;

import java.util.Date;

public class User {
	   private String userId;
	   private String userPw;
	   private String name;
	   private String num;
	   private String address;
	   private Date loginTime;
	   
	   public User() { }
	   
	public User(String userId, String userPw, String name, String num, String address, Date loginTime) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.name = name;
		this.num = num;
		this.address = address;
		this.loginTime = loginTime;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	   
	   
	   
	   
	   

	}
