package com.test.board.domain;

public class PageRow {

	private int startRow;
	private int endRow;
	private int cid;
	
	public PageRow() {}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public PageRow(int startRow, int endRow, int cid) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "PageRow [startRow=" + startRow + ", endRow=" + endRow + ", cid=" + cid + "]";
	}
	
	
	
	
}
