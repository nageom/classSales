package com.test.board.dao;

import com.test.board.domain.MemberVO;

public interface LoginDao {
	public abstract int loginCheck(String email);
	public abstract MemberVO login(String email);
}