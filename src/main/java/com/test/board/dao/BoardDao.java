package com.test.board.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.ReplyVO;
import com.test.board.domain.ResDTO;
import com.test.board.domain.ResDays;
import com.test.board.domain.VendorVO;
import com.test.board.domain.OrderVO;

public interface BoardDao {
	
	// 게시판 기능
	
	

	
	//나검 //날짜 가져오기 
	//public abstract List<String> getDays(int cid);
	public abstract List<ResDays> getDays(int cid);
	
	//주문 테이블 
	public abstract void insertOrder(OrderVO orderVO);
	
	
	//contents 테이블 불러오기
	public abstract ContentVO selectContent(int cid);
	
	//세션에 넣을 Member 객체를 email 로 불러오기
	public abstract MemberVO selectMember(String email);
	
	//예약 후 예약 가능인원 변경
	public abstract void updateRes(ResDTO resDTO);

	//환불시 oid로 환불금액 받아오기
	public abstract int selectAmount(String oid);
	
	
	//환불 성공시 order의 state를 2로 바꿔줌
	public abstract void updateState(String oid);
	
	//섬네일 이미지 및 이미지들 경로 가져오기
		public abstract String imgList(int cid);
		
	

	

}
