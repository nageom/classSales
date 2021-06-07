package com.test.board.dao;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.ReplyVO;
import com.test.board.domain.ResDTO;
import com.test.board.domain.ResDays;
import com.test.board.domain.VendorVO;
import com.test.board.domain.OrderVO;

@Repository
public class BoardDaoImpl implements BoardDao{

	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public BoardDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	

	
	////날짜 가져오기 
	/*
	public List<String> getDays(int cid) {
		return sqlSessionTemplate.selectList("getDays", cid);
	}*/
	
	public List<ResDays> getDays(int cid) { 
		return sqlSessionTemplate.selectList("getDays", cid);
	}
	
	public void updateRes(ResDTO resDTO) {
		sqlSessionTemplate.update("updateRes", resDTO);
	}
	
	
	//주문 테이블 
	public void insertOrder(OrderVO orderVO) {
		sqlSessionTemplate.insert("insertOrder", orderVO);
	}
	// contents 테이블
	public ContentVO selectContent(int cid) {
		return sqlSessionTemplate.selectOne("selectContent", cid);
	}
	//세션에 넣을 Member 객체를 email 로 불러오기
	public MemberVO selectMember(String email) {
		return sqlSessionTemplate.selectOne("selectMember", email);
		
	}

	//환불시 oid로 환불금액 받아오기
	public int selectAmount(String oid) {
		return sqlSessionTemplate.selectOne("selectAmount", oid);
	}

	//환불 성공시 order의 state를 2로 바꿔줌
	public void updateState(String oid) {
		sqlSessionTemplate.update("updateState", oid);
	}
	
	@Override
	public String imgList(int cid) {
		
		return sqlSessionTemplate.selectOne("imgList", cid);
	}
	
	
	
	
	

}
