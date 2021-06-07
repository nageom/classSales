package com.test.board.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("ReplyVO")
public class ReplyVO {
	private int rid;
	private int uid;
	private int cid;
	private String repcontent;
	private Date repdate;
	
	public ReplyVO() {}
	
	public ReplyVO(int rid, int uid, int cid, String repcontent, Date repdate) {
		super();
		this.rid = rid;
		this.uid = uid;
		this.cid = cid;
		this.repcontent = repcontent;
		this.repdate = repdate;
	}
	
	public ReplyVO(int uid, int cid, String repcontent) {
		this.uid = uid;
		this.cid = cid;
		this.repcontent = repcontent;
		
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
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

	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", uid=" + uid + ", cid=" + cid + ", repcontent=" + repcontent + ", repdate="
				+ repdate + "]";
	}
	
	
	
	
	
}
