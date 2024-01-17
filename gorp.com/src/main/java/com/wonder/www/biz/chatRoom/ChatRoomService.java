package com.wonder.www.biz.chatRoom;

import java.util.List;

import com.wonder.www.biz.chatRoomVO.ChatRoomVO;

public interface ChatRoomService {

	List<ChatRoomVO> getChatRoom(ChatRoomVO vo); 
	
	void sendMessage(ChatRoomVO vo);
	
	List<ChatRoomVO> getReloadChatRoom(ChatRoomVO vo);
	
	int maxNo(ChatRoomVO vo);
}
