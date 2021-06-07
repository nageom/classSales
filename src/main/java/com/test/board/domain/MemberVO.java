package com.test.board.domain;

import java.sql.Date;

public class MemberVO {
	private int uid;
	private String name;
	private String password;
	private String email;
	
	private int verification;
	private String nickname;
	private Date regdate;
	
	public MemberVO() {}

	public MemberVO(int uid, String name, String password, String email, int verification,
			String nickname, Date regdate) {
		super();
		this.uid = uid;
		this.name = name;
		this.password = password;
		this.email = email;
		
		this.verification = verification;
		this.nickname = nickname;
		this.regdate = regdate;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public int getVerification() {
		return verification;
	}

	public void setVerification(int verification) {
		this.verification = verification;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
