package com.test.board.service;

import java.util.List;

import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.OrderVO;
import com.test.board.domain.ReplyList;
import com.test.board.domain.ReplyVO;
import com.test.board.domain.VendorVO;

public interface MypageService {
	// 클래스 게시 기능

	// 메인 리스트
	public abstract List<OrderVO> orderList(int uid);
	
	public abstract List<OrderVO> cancleList(int uid);

	
// 댓글 리스트
	public abstract List<ReplyList> replyList(int uid);
	
	// 댓글 수정
	public abstract int replyUpdate(ReplyVO replyVO);
	// 댓글 삭제
	public abstract void replyDelete(int rid);
	
	//내 예약현황 가져오기
	public abstract List<OrderVO> orderAll(int cid);

	//구매자 정보 수정
	public abstract void updateMember(MemberVO memberVO);
	
		
//판매자 마이페이지
	public abstract int selectUID(String email);
		
	public abstract MemberVO vendorSelect(String email);
	
	public abstract List<ContentVO> selectContents(int uid);		
	
	//판매자 정보 수정
	public abstract void updateVendor(VendorVO vendorVO);
	
	public abstract VendorVO selectVendor(int uid);
		
	
	//Ui로 Member 구하기 -> 판매자 이름 구할때 쓰임 
	public abstract MemberVO selectFromUi (int uid);
			

}