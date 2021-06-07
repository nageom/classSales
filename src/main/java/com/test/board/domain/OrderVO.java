package com.test.board.domain;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("orderVO")
public class OrderVO {
/*
 * create table "ORDER" (
	"OID" varchar2(30) primary key,
	"UID" number REFERENCES MEMBER("UID"),
	"CID" number REFERENCES CONTENTS("CID"),
	"AMOUNT" number,								==> 추가 (실제 결제금액) 
	"QUANTITY" number,
	"PAYDATE" timestamp default sysdate				==> 수정 1 (date -> timestamp) 
);
 * 
 */
	private String oid;
	private int uid;
	private int cid;
	private int amount;
	private int quantity;
	private Date paydate;
	private String resday;
	private int state;
	private String title;
	private String deliver;
	
	
	
	
	
	public String getDeliver() {
		return deliver;
	}





	public void setDeliver(String deliver) {
		this.deliver = deliver;
	}





	public String getOid() {
		return oid;
	}





	public void setOid(String oid) {
		this.oid = oid;
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





	public int getAmount() {
		return amount;
	}





	public void setAmount(int amount) {
		this.amount = amount;
	}





	public int getQuantity() {
		return quantity;
	}





	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}





	public Date getPaydate() {
		return paydate;
	}





	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}





	public String getResday() {
		return resday;
	}





	public void setResday(String resday) {
		this.resday = resday;
	}





	public int getState() {
		return state;
	}





	public void setState(int state) {
		this.state = state;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	@Override
	public String toString() {
		return "OrderVO [oid=" + oid + ", uid=" + uid + ", cid=" + cid + ", amount=" + amount + ", quantity=" + quantity
				+ ", paydate=" + paydate + ", resday=" + resday + ", state=" + state + ", title=" + title + ", deliver="
				+ deliver + "]";
	}




	
	
	
	
	
	
	

}
