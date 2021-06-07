package com.test.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.test.board.domain.MessageVO;

public class MessageDaoImpl implements MessageDao{
	
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public MessageDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<MessageVO> recList(int uid) {
		return sqlSessionTemplate.selectList("recList", uid);
	}

	@Override
	public List<MessageVO> sendList(int uid) {
		return sqlSessionTemplate.selectList("sendList", uid);
	}

	@Override
	public void msgInsert(MessageVO messageVO) {
		sqlSessionTemplate.insert("msgInsert", messageVO);
	}

	@Override
	public MessageVO msgSelect(int msg_id) {
		MessageVO messageVO = (MessageVO) sqlSessionTemplate.selectOne("msgSelect", msg_id);
		return messageVO;
	}

	@Override
	public int msgDelete(int msg_id) {
		return sqlSessionTemplate.delete("msgDelete", msg_id);
	}
	
}
