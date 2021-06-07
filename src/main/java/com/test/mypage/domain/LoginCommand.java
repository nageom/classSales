package com.test.mypage.domain;

public class LoginCommand {

	private String email;
	private String password;

	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public boolean checkPassword(String checkPassword) {
		if (password.equals(checkPassword)) {
			return true;
			
		}
		return false;
		
	}
	
	
}
