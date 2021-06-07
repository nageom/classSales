package com.test.board.dao;

import java.util.List;

import com.test.board.domain.MessageVO;

public interface MessageDao {
	// 쪽지 기능
	
	// 쪽지 리스트(받은 쪽지보기 - recipient == uid)
	public abstract List<MessageVO> recList(int uid);
	// 쪽지 리스트(보낸 쪽지보기 - sender == uid)
	public abstract List<MessageVO> sendList(int uid);
	
	// 쪽지 보내기(recipient == (문의)content.uid & (답장)message.sender 지정)
	public abstract void msgInsert(MessageVO messageVO);
	
	// 쪽지 읽기
	public abstract MessageVO msgSelect(int msg_id);
	
	// 쪽지 삭제
	public abstract int msgDelete(int msg_id);
}
