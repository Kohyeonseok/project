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
import com.wonder.www.biz.clubVO.ClubVO;
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
		mav.addObject("reportCount",boardService.getReportCount(vo));
		mav.addObject("qnaCount",boardService.getQnACount(vo));
		mav.addObject("userCount",boardService.getUserCount(vo));
		mav.setViewName("redirect:getBoardList.do?category="+vo.getReportBoardCategory());
		return mav;
	}
	
	@RequestMapping("/getReportBoardList.do")
	public ModelAndView getReportBoardList(BoardVO vo,ModelAndView mav){
		mav.addObject("list",boardService.getReportBoardList());
		mav.addObject("reportCount",boardService.getReportCount(vo));
		mav.addObject("qnaCount",boardService.getQnACount(vo));
		mav.addObject("userCount",boardService.getUserCount(vo));
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
	public ModelAndView getQNABoard(QnAVO vo, BoardVO bo,ModelAndView mav) {
		mav.addObject("QnAList",boardService.getQNABoardList(vo));
		mav.addObject("reportCount",boardService.getReportCount(bo));
		mav.addObject("qnaCount",boardService.getQnACount(bo));
		mav.addObject("userCount",boardService.getUserCount(bo));
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
	public ModelAndView getQnABoard(QnAVO vo,BoardVO bo,ModelAndView mav) {
		mav.addObject("board",boardService.getQnABoard(vo));
		mav.addObject("reportCount",boardService.getReportCount(bo));
		mav.addObject("qnaCount",boardService.getQnACount(bo));
		mav.addObject("userCount",boardService.getUserCount(bo));
		mav.setViewName("QNABoard.jsp");
		return mav;
	}
	
	@RequestMapping("/writeQnAReply.do")
	public ModelAndView writeQnAReply(QnAVO vo,BoardVO bo,ModelAndView mav) {
		boardService.writeQnAReply(vo);
		mav.addObject("reportCount",boardService.getReportCount(bo));
		mav.addObject("qnaCount",boardService.getQnACount(bo));
		mav.addObject("userCount",boardService.getUserCount(bo));
		mav.setViewName("redirect:getQNABoardList.do?id="+vo.getId());
		return mav;
	}
	
	@RequestMapping("/getClubBoardList.do")
	public ModelAndView getClubBoardList(ClubVO vo,ModelAndView mav) {
		mav.addObject("clubBoard",boardService.getClubBoardList(vo));
		mav.setViewName("clubBoardList.jsp");
		return mav;
	}
	
	@RequestMapping("/createOkClubBoard.do")
	public ModelAndView createOkClubBoard(ClubVO vo,ModelAndView mav) throws IllegalStateException, IOException {
		
		MultipartFile uploadFile = vo.getUploadFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			long timestamp = System.currentTimeMillis();
			String newFileName = timestamp+"_"+fileName;
			vo.setFileName(newFileName);
			uploadFile.transferTo(new File("/Users/hyeonseok/Desktop/spring/Project_Test1/src/main/webapp/uploadFile/" + newFileName));
		}
		
		boardService.createOkClubBoard(vo);
		boardService.joinClub(vo);
		mav.setViewName("redirect:getClubBoardList.do");
		return mav;
	}
	
	@RequestMapping("/getClubBoard.do")
	public ModelAndView getClubBoard(ClubVO vo , ModelAndView mav) {
		mav.addObject("clubBoard",boardService.getClubBoard(vo));
		mav.addObject("members",boardService.getClubMembers(vo));
		mav.setViewName("clubBoard.jsp");
		return mav;
	}
	
	@RequestMapping("/joinClub.do")
	public void joinClub(ClubVO vo,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		if(boardService.getClubMember(vo)==null) {
			boardService.joinClub(vo);			
			out.write("success");
		}else {
			out.write("fail");
		}
	}
	
	@RequestMapping("/cancleClub.do")
	public void cancleClub(ClubVO vo,HttpServletResponse response ) throws IOException {
		PrintWriter out = response.getWriter();
		if(boardService.getClubMember(vo)!=null) {
			boardService.cancleClub(vo);			
			out.write("success");
		}else {
			out.write("fail");
		}
	}
	
	@RequestMapping("/searchClubBoard.do")
	public ModelAndView searchClubBoard(ClubVO vo,ModelAndView mav) {
		mav.addObject("clubBoard",boardService.searchClubBoard(vo));
		mav.setViewName("clubBoardList.jsp");
		return mav;
	}
	
	@RequestMapping("/deleteClubBoard.do")
	public void deleteClubBoard(ClubVO vo,HttpServletResponse response ) throws IOException {
		PrintWriter out = response.getWriter();
		boardService.deleteClubBoard(vo);
		out.write("success");
	}
	
	@RequestMapping("/adminPage.do")
	public ModelAndView adminPage(BoardVO vo,ModelAndView mav) {
		mav.addObject("reportCount",boardService.getReportCount(vo));
		mav.addObject("qnaCount",boardService.getQnACount(vo));
		mav.addObject("userCount",boardService.getUserCount(vo));
		mav.setViewName("adminPage.jsp");
		return mav;
	}
}
