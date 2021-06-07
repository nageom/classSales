package com.test.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.board.dao.MypageDao;
import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.OrderVO;
import com.test.board.domain.ReplyList;
import com.test.board.domain.ReplyVO;
import com.test.board.domain.VendorVO;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageDao mypageDao;

	@Override
	public List<OrderVO> orderList(int uid) {
		return mypageDao.orderList(uid);
	}

	@Override
	public List<OrderVO> cancleList(int uid) {
		return mypageDao.cancleList(uid);
	}

	@Override
	public List<ReplyList> replyList(int uid) {
		// TODO Auto-generated method stub
		return mypageDao.replyList(uid);
	}

	@Override
	public int replyUpdate(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		return mypageDao.replyUpdate(replyVO);
	}

	@Override
	public void replyDelete(int rid) {
		mypageDao.replyDelete(rid);
	}

	
	//내 예약현황 가져오기
	public List<OrderVO> orderAll(int cid){
		return mypageDao.orderAll(cid);
	}
	
	//구매자 정보 수정
	public void updateMember(MemberVO memberVO) {
		mypageDao.updateMember(memberVO);
	}
	
	
	
//판매자 마이페이지 
	@Override
	public int selectUID(String email) {
		// TODO Auto-generated method stub
		return mypageDao.selectUID(email);
	}

	@Override
	public MemberVO vendorSelect(String email) {
		// TODO Auto-generated method stub
		return mypageDao.vendorSelect(email);
	}

	@Override
	public List<ContentVO> selectContents(int uid) {
		// TODO Auto-generated method stub
		return mypageDao.selectContents(uid);
	}

	
	//판매자 마이페이지
	public void updateVendor(VendorVO vendorVO) {
		mypageDao.updateVendor(vendorVO);
	}
	
	public VendorVO selectVendor(int uid) {
		return mypageDao.selectVendor(uid);
	}
	
	//Ui로 Member 구하기 -> 판매자 이름 구할때 쓰임 
	public MemberVO selectFromUi (int uid) {
		System.out.println(uid);
		return mypageDao.selectFromUi(uid);
	}
	

}