package com.wonder.www.biz.chatRoom;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wonder.www.biz.chatRoomVO.ChatRoomVO;

@Repository
public class ChatRoomDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ChatRoomVO> getChatRoom(ChatRoomVO vo) {
		return mybatis.selectList("ChatRoomDAO.getChatRoom",vo);
	}
	
	public void sendMessage(ChatRoomVO vo) {
		mybatis.insert("ChatRoomDAO.sendMessage",vo);
	}

	public List<ChatRoomVO> getReloadChatRoom(ChatRoomVO vo){
		return mybatis.selectList("ChatRoomDAO.getReloadChatRoom",vo);
	}
	
	public int maxNo(ChatRoomVO vo) {
		return mybatis.selectOne("ChatRoomDAO.maxNo",vo);
	}
}
