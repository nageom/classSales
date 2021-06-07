package com.test.board.domain;

public class ResDTO {
	private int quantity;
	private String resday;
	private int cid;
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getResday() {
		return resday;
	}
	public void setResday(String resday) {
		this.resday = resday;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public ResDTO(int quantity, String resday, int cid) {
		super();
		this.quantity = quantity;
		this.resday = resday;
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "ResDTO [quantity=" + quantity + ", resday=" + resday + ", cid=" + cid + "]";
	}
	
	
	
	
	

}
