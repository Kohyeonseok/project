package com.wonder.www.view.chatRoom;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wonder.www.biz.chatRoom.ChatRoomService;
import com.wonder.www.biz.chatRoomVO.ChatRoomVO;

@Controller
public class ChatRoomController {

	@Autowired
	ChatRoomService chatRoomService;
	
	@RequestMapping("/getChatRoom.do")
	public ModelAndView getChatRoom(ChatRoomVO vo, ModelAndView mav) {
		vo.setMessage("님이 입장하셨습니다.");
		chatRoomService.sendMessage(vo);
		mav.addObject("maxNo",chatRoomService.maxNo(vo));
		mav.addObject("roomId",vo.getRoomId());
		mav.addObject("chatMessage",chatRoomService.getChatRoom(vo));
		System.out.println(chatRoomService.getChatRoom(vo));
		mav.setViewName("chatRoom.jsp");
		return mav;
	}
	
	@RequestMapping("/sendMessage.do")
	public void sendMessage(ChatRoomVO vo,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		chatRoomService.sendMessage(vo);
		out.write("success");
	}
	
	@RequestMapping("/getMessages.do")
	public void getMessage(ChatRoomVO vo, HttpServletResponse response) {
			
	    try {
	        // 채팅 메시지 가져오기
	        List<ChatRoomVO> messages = chatRoomService.getReloadChatRoom(vo);

	        // ObjectMapper 객체 생성
	        ObjectMapper mapper = new ObjectMapper();

	        // 채팅 메시지를 JSON으로 변환
	        String json = mapper.writeValueAsString(messages);

	        // 응답에 쓰기
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print(json);
	        out.flush();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
}
