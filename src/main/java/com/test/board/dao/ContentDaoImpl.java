package com.test.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.board.domain.ContentVO;
import com.test.board.domain.PageRow;
import com.test.board.domain.RepCheck;
import com.test.board.domain.ReplyList;
import com.test.board.domain.ReplyVO;

@Repository
public class ContentDaoImpl implements ContentDao{

	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public ContentDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 클래스 게시 기능

	@Override
	public List<ContentVO> mainList() {
		return sqlSessionTemplate.selectList("mainList");
	}

	@Override
	public List<ContentVO> onoffList(int on_off) {
		return sqlSessionTemplate.selectList("onoffList", on_off);
	}

	@Override
	public List<ContentVO> bigcateList(String big_name, int on_off) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("big_name", big_name);
		paramMap.put("on_off", on_off);
		return sqlSessionTemplate.selectList("bigcateList", paramMap);
	}

	@Override
	public List<ContentVO> smallcateList(String small_name, int on_off) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("small_name", small_name);
		paramMap.put("on_off", on_off);
		return sqlSessionTemplate.selectList("smallcateList", paramMap);
	}

	@Override
	public List<ContentVO> newList(int on_off) {
		return sqlSessionTemplate.selectList("newList", on_off);
	}

	@Override
	public List<ContentVO> hotList() {
		return sqlSessionTemplate.selectList("hotList");
	}

	@Override
	public List<ContentVO> areaList(String area, int on_off) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("area", area);
		paramMap.put("on_off", on_off);
		
		return sqlSessionTemplate.selectList("areaList", paramMap);
	}

	@Override
	public void formInsert(ContentVO contentVO) {
		sqlSessionTemplate.insert("formInsert", contentVO);
	}

	@Override
	public void classInsert(ContentVO contentVO) {
		sqlSessionTemplate.insert("classInsert", contentVO);
	}

	@Override
	public ContentVO select(int cid) {
		ContentVO contentVO = (ContentVO) sqlSessionTemplate.selectOne("select", cid);
		return contentVO;
	}

	@Override
	public int update(ContentVO contentVO) {
		return sqlSessionTemplate.update("update", contentVO);
	}

	@Override
	public int delete(ContentVO contentVO) {
		return sqlSessionTemplate.delete("delete", contentVO);
	}
	
	@Override
	public void uploadContent(ContentVO contentVO) {
		sqlSessionTemplate.insert("upContent", contentVO);
		
	}
	//판매물 삭제
	@Override
	public int delete(int cid) {
		return sqlSessionTemplate.delete("deleteCon", cid);
	}
	//전체 판매 리스트
	@Override
	public List<ContentVO> manageList() {
		
		return sqlSessionTemplate.selectList("manageList");
	}
	//판매자별 판매 리스트
	@Override
	public List<ContentVO> manageListByVendor(String search) {
		System.out.println("dao: " + search);
		return sqlSessionTemplate.selectList("manageListByVendor", search);
	}
	// 댓글기능

	// 페이징 startRow, endRow, cid 넘겨줌
	@Override
	public List<ReplyList> repList(PageRow pageRow) {
		return sqlSessionTemplate.selectList("repList", pageRow);
	}

	@Override
	public void repInsert(ReplyVO replyVO) {
		sqlSessionTemplate.insert("repInsert", replyVO);
	}

	@Override
	public int repUpdate(ReplyVO replyVO) {
		return sqlSessionTemplate.update("repUpdate", replyVO);
	}

	@Override
	public int repDelete(int rid) {
		return sqlSessionTemplate.delete("repDelete", rid);
	}
	@Override
	public int repCount(int cid) {
		return sqlSessionTemplate.selectOne("repCount", cid);
	}
	// 댓글 (본인 주문 상품에만 댓글 등록 가능) 
	public int repCheck (RepCheck repCheck) {
		return sqlSessionTemplate.selectOne("repCheck", repCheck);
	}
	

}
