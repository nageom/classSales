package com.test.board.service;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.board.dao.BoardDao;

import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.ReplyVO;
import com.test.board.domain.ResDTO;
import com.test.board.domain.ResDays;
import com.test.board.domain.VendorVO;
import com.test.board.domain.OrderVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	private BoardDao boardDao;
	
	@Autowired
	public BoardServiceImpl (BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	
	///////날짜기능
	/*
	public List<String> getDays(int cid) {
		return boardDao.getDays(cid);
	}
	*/

	public List<ResDays> getDays(int cid) {
		return boardDao.getDays(cid);
		
	}
	
	// 주문 테이블 
	public void insertOrder(OrderVO orderVO) {
		boardDao.insertOrder(orderVO);
	}
	
	//contents 테이블
	public ContentVO selectContent(int cid) {
		return boardDao.selectContent(cid);
	}
	
	//세션에 넣을 Member 객체를 email 로 불러오기
	public MemberVO selectMember(String email) {
		return boardDao.selectMember(email); 
		
	}

	public void updateRes(ResDTO resDTO) {
		boardDao.updateRes(resDTO);
		
	}
	
	//환불시 oid로 환불금액 받아오기
	public int selectAmount(String oid) {
		return boardDao.selectAmount(oid);
	}
	
	
	//환불 성공시 order의 state를 2로 바꿔줌
	public void updateState(String oid) {
		boardDao.updateState(oid);
	}
	
	
	
	@Override
	public String imgList(int cid) {
		
		return boardDao.imgList(cid);
	}
	
	
	
	
	
	
}
