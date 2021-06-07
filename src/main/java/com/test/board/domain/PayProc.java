package com.test.board.domain;

import org.apache.ibatis.type.Alias;

@Alias("payProc")
public class PayProc {
	private String oid;
	private int cid;
	private int uid;
	private int quantity;//
	private String resdate;//
	private int amount;//
	
	
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "PayProc [oid=" + oid + ", cid=" + cid + ", uid=" + uid + ", quantity=" + quantity + ", resdate="
				+ resdate + ", amount=" + amount + "]";
	}
	
	
	
	
	

}
