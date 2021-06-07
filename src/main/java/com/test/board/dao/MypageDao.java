package com.test.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.OrderVO;
import com.test.board.domain.ReplyList;
import com.test.board.domain.ReplyVO;
import com.test.board.domain.VendorVO;

public interface MypageDao {
	// 클래스 게시 기능

	
	
	// 메인 리스트
	public abstract List<OrderVO> orderList(int uid);
	// onoff 리스트
	public abstract List<OrderVO> cancleList(int uid);
	// 댓글(후기) 기능


	//판매자 마이페이지
	public abstract int selectUID(String email);
	
	public abstract MemberVO vendorSelect(String email);
	
	public abstract List<ContentVO> selectContents(int uid);
	
	public abstract VendorVO selectVendor(int uid);
	
	//내 예약현황 가져오기
	public abstract List<OrderVO> orderAll(int cid);
	
	//판매자 정보 수정
	public abstract void updateVendor(VendorVO vendorVO);
	
	
	// 나의 후기 리스트
	public abstract List<ReplyList> replyList(int uid);
	// 댓글 수정
	public abstract int replyUpdate(ReplyVO replyVO);
	// 댓글 삭제
	public abstract void replyDelete(int rid);
	
	
	//구매자 정보 수정
	public abstract void updateMember(MemberVO memberVO);
	
	//판매자 이름 구하기
	public abstract MemberVO selectFromUi(int uid);
	
	
	
	
}
