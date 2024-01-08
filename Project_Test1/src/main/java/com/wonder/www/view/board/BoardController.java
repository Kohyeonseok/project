package com.wonder.www.view.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wonder.www.biz.board.BoardService;
import com.wonder.www.biz.boardVO.BoardVO;
import com.wonder.www.biz.replyVO.ReplyVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getHikingBoardList.do")
	public ModelAndView getHikingBoardList(BoardVO vo, ModelAndView mav){
		vo.setCategory("HIKINGBOARD");
		mav.addObject("pageNum",boardService.getHikingBoardTotalPage(vo));
		vo.setOffset((vo.getPageNum()-1)*10);
		mav.addObject("list",boardService.getHikingBoardList(vo));
		mav.setViewName("getHikingBoardList.jsp");
		return mav;
	}
	
	@RequestMapping("/writeHikingBoard.do")
	public ModelAndView writeHikingBoard(BoardVO vo,ModelAndView mav) {
		mav.addObject("category",vo);
		mav.setViewName("writeHikingBoard.jsp");
		return mav;
	}
	
	@RequestMapping("/writeOkHikingBoard.do")
	public ModelAndView writeOkHikingBoard(BoardVO vo,ModelAndView mav) throws IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			long timestamp = System.currentTimeMillis();
			String newFileName = timestamp+"_"+fileName;
			vo.setFileName(newFileName);
			uploadFile.transferTo(new File("/Users/hyeonseok/Desktop/spring/Project_Test1/src/main/webapp/uploadFile/" + newFileName));
		}
		
		boardService.writeOkHikingBoard(vo);
		mav.setViewName("redirect:getHikingBoardList.do");
		return mav;
	}
	
	@RequestMapping("/getHikingBoard.do")
	public ModelAndView getHikingBoard(BoardVO vo, ModelAndView mav) {
		vo.setCategory("HIKING");
		mav.addObject("board",boardService.getHikingBoard(vo));
		mav.addObject("boardReply",boardService.getBoardReply(vo));
		System.out.println(mav);
		mav.setViewName("getHikingBoard.jsp");	
		return mav;
	}
	
	@RequestMapping("/deleteHikingBoard.do")
	public ModelAndView deleteHikingBoard(BoardVO vo, ModelAndView mav) {
		boardService.deleteHikingBoard(vo);
		mav.setViewName("redirect:getHikingBoardList.do");
		return mav;
	}
	
	@RequestMapping("/searchHikingBoard.do")
	public ModelAndView searchHikingBoard(BoardVO vo, ModelAndView mav) {
		mav.addObject("list",boardService.getSearchHikingBoard(vo));
		mav.setViewName("getHikingBoardList.jsp");
		return mav;
	}
	
	@RequestMapping("/modifyHikingBoard.do")
	public ModelAndView modifyHikingBoard(BoardVO vo, ModelAndView mav) {
		mav.addObject("board",boardService.getHikingBoard(vo));
		mav.setViewName("modifyHikingBoard.jsp");
		return mav;
	}
	
	@RequestMapping("/updateOkHikingBoard.do")
	public ModelAndView updateOkHikingBoard(BoardVO vo,ModelAndView mav) throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			long timestamp = System.currentTimeMillis();
			String newFileName = timestamp+"_"+fileName;
			vo.setFileName(newFileName);
			uploadFile.transferTo(new File("/Users/hyeonseok/Desktop/spring/Project_Test1/src/main/webapp/uploadFile/" + newFileName));
		}
		boardService.updateOkHikingBoard(vo);
		mav.setViewName("redirect:getHikingBoardList.do");
		return mav;
	}
	
	@RequestMapping("/inputReply.do")
	public void inputReply(ReplyVO vo,HttpServletResponse response) {
		boardService.inputReply(vo);
		try {
			PrintWriter out = response.getWriter();
			out.write("{\"id\": \"" + vo.getId() +"\", \"replyContent\": \"" + vo.getReplyContent() + "\", \"wtime\":\""+vo.getWtime()+"\"}");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
