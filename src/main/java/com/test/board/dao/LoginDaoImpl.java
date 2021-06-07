package com.test.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.test.board.domain.MemberVO;

public class LoginDaoImpl implements LoginDao{
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public LoginDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public int loginCheck(String email) {
		
		return sqlSessionTemplate.selectOne("checkUser", email);
	}
	@Override
	public MemberVO login(String email) {
		
		return sqlSessionTemplate.selectOne("loginUser", email);
	}
}