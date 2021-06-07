package com.test.board.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("ReplyList")
public class ReplyList {

	private int uid;
	private String repcontent;
	private Date repdate;
	private String nickname;
	private int rid;
	private String title;
	
	public ReplyList() {}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getRepcontent() {
		return repcontent;
	}

	public void setRepcontent(String repcontent) {
		this.repcontent = repcontent;
	}

	public Date getRepdate() {
		return repdate;
	}

	public void setRepdate(Date repdate) {
		this.repdate = repdate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public ReplyList(int uid, String repcontent, Date repdate, String nickname, int rid, String title) {
		super();
		this.uid = uid;
		this.repcontent = repcontent;
		this.repdate = repdate;
		this.nickname = nickname;
		this.rid = rid;
		this.title = title;
	}

	
	
	

	

	
}
