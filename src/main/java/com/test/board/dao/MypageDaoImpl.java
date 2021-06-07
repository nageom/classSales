package com.test.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.test.board.domain.ContentVO;
import com.test.board.domain.MemberVO;
import com.test.board.domain.OrderVO;
import com.test.board.domain.ReplyList;
import com.test.board.domain.ReplyVO;
import com.test.board.domain.VendorVO;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public MypageDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	
	@Override
	public int selectUID(String email) {
		return sqlSessionTemplate.selectOne("selectUID",email);
		
	}
	@Override
	public MemberVO vendorSelect(String email) {
	
		return sqlSessionTemplate.selectOne("vendorSelect", email);
	}
	
	@Override
	public List<ContentVO> selectContents(int uid) {
		return sqlSessionTemplate.selectList("selectContents", uid);
	}
	
	//내 예약현황 가져오기
	public List<OrderVO> orderAll(int cid) {
		return sqlSessionTemplate.selectList("orderAll",cid);
	}
	
	//판매자 정보 수정
	public void updateVendor(VendorVO vendorVO) {
		sqlSessionTemplate.update("updateVendor", vendorVO);
		
	}
	
	public VendorVO selectVendor(int uid) {
		return sqlSessionTemplate.selectOne("selectVendor",uid);
	}
	
	
	
// 구매자마이페이지
		@Override
		public List<OrderVO> orderList(int uid) {
			return sqlSessionTemplate.selectList("orderList", uid);
		}

		@Override
		public List<OrderVO> cancleList(int uid) {
			return sqlSessionTemplate.selectList("cancleList",uid);
		}
//나의 댓글 모아보기
		@Override
		public List<ReplyList> replyList(int uid) {
			
			return sqlSessionTemplate.selectList("replyList", uid);
		}

		@Override
		public int replyUpdate(ReplyVO replyVO) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public void replyDelete(int rid) {
			sqlSessionTemplate.delete("repDelete", rid);
		}
	
		//구매자 정보 수정
		public void updateMember(MemberVO memberVO) {
			sqlSessionTemplate.update("updateMember", memberVO);
		}
	
	
	
	//Ui로 Member 구하기 -> 판매자 이름 구할때 쓰임 
	public MemberVO selectFromUi (int uid) {
		System.out.println(uid);
		//return sqlSessionTemplate.selectOne("selectFromUi",uid);
		MemberVO mem = sqlSessionTemplate.selectOne("selectFromUi",uid);
		System.out.println(mem.getNickname());
		return sqlSessionTemplate.selectOne("selectFromUi",uid);
		
		
	}
	
	
	
	
	
	
	

}
