package com.test.board.domain;

public class RepCheck {

	private int cid;
	private int uid;
	
	
	public RepCheck(int cid, int uid) {
		super();
		this.cid = cid;
		this.uid = uid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
