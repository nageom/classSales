package com.test.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.board.dao.ContentDao;
import com.test.board.domain.ContentVO;
import com.test.board.domain.PageRow;
import com.test.board.domain.RepCheck;
import com.test.board.domain.ReplyList;
import com.test.board.domain.ReplyVO;

@Service
public class ContentServiceImpl implements ContentService{

	@Autowired
	ContentDao contentDao;

	@Override
	public List<ContentVO> mainList() {
		return contentDao.mainList();
	}

	@Override
	public List<ContentVO> bigcateList(String big_name, int on_off) {
		return contentDao.bigcateList(big_name, on_off);
	}

	@Override
	public List<ContentVO> smallcateList(String small_name, int on_off) {
		return contentDao.smallcateList(small_name, on_off);
	}

	@Override
	public List<ContentVO> onoffList(int on_off) {
		return contentDao.onoffList(on_off);
	}

	@Override
	public List<ContentVO> newList(int on_off) {
		return contentDao.newList(on_off);
	}

	@Override
	public List<ContentVO> hotList() {
		return contentDao.hotList();
	}

	@Override
	public List<ContentVO> areaList(String area, int on_off) {
		return contentDao.areaList(area, on_off);
	}

	@Override
	public void formInsert(ContentVO contentVO) {
		contentDao.formInsert(contentVO);
	}

	@Override
	public void classInsert(ContentVO contentVO) {
		contentDao.classInsert(contentVO);
	}

	@Override
	public ContentVO select(int cid) {
		return contentDao.select(cid);
	}
	
	@Override
	public int delete(int cid) {
		 return contentDao.delete(cid);
	}
	@Override
	public int update(ContentVO contentVO) {
		return contentDao.update(contentVO);
	}

	@Override
	public int delete(ContentVO contentVO) {
		return contentDao.delete(contentVO);
	}
	
	//컨텐츠 등록
	@Override
	public void uploadContent(ContentVO contentVO) {
		contentDao.uploadContent(contentVO);

	}
	@Override
	public List<ContentVO> manageList() {
		
		return contentDao.manageList();
	}
	@Override
	public List<ContentVO> manageListByVendor(String search) {
		
		return contentDao.manageListByVendor(search);
	}
	//댓글
	// 페이징 startRow, endRow, cid 넘겨줌
	@Override
	public List<ReplyList> repList(PageRow pageRow) {
		return contentDao.repList(pageRow);
	}

	@Override
	public void repInsert(ReplyVO replyVO) {
		contentDao.repInsert(replyVO);
	}

	@Override
	public int repUpdate(ReplyVO replyVO) {
		return contentDao.repUpdate(replyVO);
	}

	@Override
	public int repDelete(int rid) {
		return contentDao.repDelete(rid);
	}
	//댓글 개수 
	@Override
	public int repCount(int cid) {
		return contentDao.repCount(cid);
	}
	// 댓글 (본인 주문 상품에만 댓글 등록 가능) 
	public int repCheck (RepCheck repCheck) {
		return contentDao.repCheck(repCheck);
	}

}