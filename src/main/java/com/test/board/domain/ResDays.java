package com.test.board.domain;

import org.apache.ibatis.type.Alias;

@Alias("ResDays")
public class ResDays {

	private String resday;
	private int person;
	
	public String getResday() {
		return resday;
	}
	public void setResday(String resday) {
		this.resday = resday;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	

	
	
	
	
}
