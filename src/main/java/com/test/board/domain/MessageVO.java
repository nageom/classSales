package com.test.board.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("MessageVO")
public class MessageVO {
	private int msg_id;
	private int uid;
	private int recipient;
	private int sender;
	private String msg_content;
	private String msg_title;
	private Date msgdate;
	
	public MessageVO() {}
	
	public MessageVO(int msg_id, int uid, int recipient, int sender, String msg_content, String msg_title, Date msgdate) {
		super();
		this.msg_id = msg_id;
		this.uid = uid;
		this.recipient = recipient;	// 수신자
		this.sender = sender;	// 발신자
		this.msg_content = msg_content;
		this.msg_title = msg_title;
		this.msgdate = msgdate;
	}

	public int getMsg_id() {
		return msg_id;
	}

	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getRecipient() {
		return recipient;
	}

	public void setRecipient(int recipient) {
		this.recipient = recipient;
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public Date getMsgdate() {
		return msgdate;
	}

	public void setMsgdate(Date msgdate) {
		this.msgdate = msgdate;
	}
	
}
