package com.wonder.www.biz.chatRoom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonder.www.biz.chatRoomVO.ChatRoomVO;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {

	@Autowired
	private ChatRoomDAOMybatis chatRoomDAO;
	
	@Override
	public List<ChatRoomVO> getChatRoom(ChatRoomVO vo) {
		return chatRoomDAO.getChatRoom(vo);
	}

	@Override
	public void sendMessage(ChatRoomVO vo) {
		chatRoomDAO.sendMessage(vo);
	}

	@Override
	public List<ChatRoomVO> getReloadChatRoom(ChatRoomVO vo) {
		return chatRoomDAO.getReloadChatRoom(vo);
	}

	@Override
	public int maxNo(ChatRoomVO vo) {
		return chatRoomDAO.maxNo(vo);
	}
}
