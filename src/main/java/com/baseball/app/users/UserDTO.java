package com.baseball.app.users;

public class UserDTO {
	
	
	private String userId;
	private String password;
	private String name;
	private String phone;
	private String email;
	private String address;
	private Long teamNum;
	private Long point;
	
	
	
	
	public Long getPoint() {
		return point;
	}
	public void setPoint(Long point) {
		this.point = point;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getTeamNum() {
		return teamNum;
	}
	public void setTeamNum(Long teamNum) {
		this.teamNum = teamNum;
	}
	
	
	
	
}