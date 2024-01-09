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
import com.wonder.www.biz.qnaVO.QnAVO;
import com.wonder.www.biz.replyVO.ReplyVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardList(BoardVO vo, ModelAndView mav){
		mav.addObject("pageNum",boardService.getBoardTotalPage(vo));
		mav.addObject("category",vo.getCategory().toUpperCase());
		vo.setOffset((vo.getPageNum()-1)*10);
		mav.addObject("list",boardService.getBoardList(vo));
		mav.setViewName("getBoardList.jsp");
		return mav;
	}
	
	@RequestMapping("/searchBoard.do")
	public ModelAndView searchBoard(BoardVO vo, ModelAndView mav) {
		mav.addObject("category",vo.getCategory().toUpperCase());
		mav.addObject("list",boardService.getSearchBoard(vo));
		mav.setViewName("getBoardList.jsp");
		return mav;
	}
	
	@RequestMapping("/writeBoard.do")
	public ModelAndView writeBoard(BoardVO vo,ModelAndView mav) {
		mav.addObject("category",vo.getCategory().toUpperCase());
		mav.setViewName("writeBoard.jsp");
		return mav;
	}
	
	@RequestMapping("/writeOkBoard.do")
	public ModelAndView writeOkBoard(BoardVO vo,ModelAndView mav) throws IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			long timestamp = System.currentTimeMillis();
			String newFileName = timestamp+"_"+fileName;
			vo.setFileName(newFileName);
			uploadFile.transferTo(new File("/Users/hyeonseok/Desktop/spring/Project_Test1/src/main/webapp/uploadFile/" + newFileName));
		}
		
		boardService.writeOkBoard(vo);
		mav.setViewName("redirect:getBoardList.do?category="+vo.getCategory());
		return mav;
	}
	
	@RequestMapping("/getBoard.do")
	public ModelAndView getBoard(BoardVO vo, ModelAndView mav) {
		mav.addObject("board",boardService.getBoard(vo));
		mav.addObject("boardReply",boardService.getBoardReply(vo));
		mav.addObject("category",vo.getCategory().toUpperCase());
		System.out.println(mav);
		mav.setViewName("getBoard.jsp");	
		return mav;
	}
	
	@RequestMapping("/deleteBoard.do")
	public ModelAndView deleteBoard(BoardVO vo, ModelAndView mav) {
		boardService.deleteBoard(vo);
		mav.setViewName("redirect:getBoardList.do?category="+vo.getCategory());
		return mav;
	}
	
	
	
	@RequestMapping("/modifyBoard.do")
	public ModelAndView modifyBoard(BoardVO vo, ModelAndView mav) {
		mav.addObject("category",vo.getCategory().toUpperCase());
		mav.addObject("board",boardService.getBoard(vo));
		mav.setViewName("modifyBoard.jsp");
		return mav;
	}
	
	@RequestMapping("/updateOkBoard.do")
	public ModelAndView updateOkBoard(BoardVO vo,ModelAndView mav) throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			long timestamp = System.currentTimeMillis();
			String newFileName = timestamp+"_"+fileName;
			vo.setFileName(newFileName);
			uploadFile.transferTo(new File("/Users/hyeonseok/Desktop/spring/Project_Test1/src/main/webapp/uploadFile/" + newFileName));
		}
		boardService.updateOkBoard(vo);
		mav.setViewName("redirect:getBoardList.do?category="+vo.getCategory());
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
	
	@RequestMapping("/deleteReply.do")
	public void deleteReply(ReplyVO vo,HttpServletResponse response) {
		boardService.deleteReply(vo);
		try {
			PrintWriter out = response.getWriter();
			out.write(1);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/report.do")
	public ModelAndView reportBoard(BoardVO vo,ModelAndView mav) {
		boardService.reportBoard(vo);
		mav.setViewName("redirect:getHikingBoardList.do");
		return mav;
	}
	
	@RequestMapping("/getReportBoardList.do")
	public ModelAndView getReportBoardList(ModelAndView mav){
		mav.addObject("list",boardService.getReportBoardList());
		mav.setViewName("reportBoard.jsp");
		return mav;
	}
	
	@RequestMapping("/adminDeleteBoard.do")
	public ModelAndView adminDeleteBoard(BoardVO vo,ModelAndView mav) {
		boardService.adminDeleteBoard(vo);
		mav.setViewName("getReportBoardList.do");
		return mav;
	}
	
	@RequestMapping("/adminDeleteReport.do")
	public ModelAndView adminDeleteReport(BoardVO vo,ModelAndView mav) {
		boardService.adminDeleteReport(vo);
		mav.setViewName("getReportBoardList.do");
		return mav;
	}
	
	@RequestMapping("/getQNABoardList.do")
	public ModelAndView getQNABoard(QnAVO vo, ModelAndView mav) {
		mav.addObject("QnAList",boardService.getQNABoardList(vo));
		mav.setViewName("QNABoardList.jsp");
		return mav;
	}
	
	@RequestMapping("/writeOkQnABoard.do")
	public ModelAndView writeOkQnABoard(QnAVO vo,ModelAndView mav) {
		boardService.writeOkQnABoard(vo);
		mav.setViewName("redirect:getQNABoardList.do?id=" + vo.getId());
		return mav;
	}
	
	@RequestMapping("/getQnABoard.do")
	public ModelAndView getQnABoard(QnAVO vo,ModelAndView mav) {
		mav.addObject("board",boardService.getQnABoard(vo));
		mav.setViewName("QNABoard.jsp");
		return mav;
	}
	
	@RequestMapping("/writeQnAReply.do")
	public ModelAndView writeQnAReply(QnAVO vo,ModelAndView mav) {
		boardService.writeQnAReply(vo);
		mav.setViewName("redirect:getQNABoardList.do?id="+vo.getId());
		return mav;
	}
	
}
