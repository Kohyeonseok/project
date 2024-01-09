package com.wonder.www.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonder.www.biz.boardVO.BoardVO;
import com.wonder.www.biz.qnaVO.QnAVO;
import com.wonder.www.biz.replyVO.ReplyVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAOMybatis boardDAO;

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}
	
	@Override
	public BoardVO getBoardTotalPage(BoardVO vo) {
		vo.setTotalPage((int) Math.ceil(boardDAO.countPost(vo)/10.0));
		return vo;
	}
	
	@Override
	public List<BoardVO> getSearchBoard(BoardVO vo) {
		return boardDAO.getSearchBoard(vo);
	}

	
	

	@Override
	public void writeOkBoard(BoardVO vo) {
		boardDAO.writeOkBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		boardDAO.updateBoardHit(vo);
		return boardDAO.getBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}


	@Override
	public void updateOkBoard(BoardVO vo) {
		boardDAO.updateOkBoard(vo);
	}

	

	@Override
	public void inputReply(ReplyVO vo) {
		boardDAO.inputReply(vo);
	}

	@Override
	public List<ReplyVO> getBoardReply(BoardVO vo) {
		return boardDAO.getBoardReply(vo);
	}

	@Override
	public void reportBoard(BoardVO vo) {
		boardDAO.reportBoard(vo);
	}

	@Override
	public List<BoardVO> getReportBoardList() {
		return boardDAO.getReportBoardList();
	}

	@Override
	public void adminDeleteBoard(BoardVO vo) {
		boardDAO.adminDeleteBoard(vo);
	}

	@Override
	public void adminDeleteReport(BoardVO vo) {
		boardDAO.adminDeleteReport(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		boardDAO.deleteReply(vo);
	}

	@Override
	public List<QnAVO> getQNABoardList(QnAVO vo) {
		return boardDAO.getQNABoardList(vo);
	}

	@Override
	public void writeOkQnABoard(QnAVO vo) {
		boardDAO.writeOkQnABoard(vo);
	}

	@Override
	public QnAVO getQnABoard(QnAVO vo) {
		return boardDAO.getQnABoard(vo);
	}

	@Override
	public void writeQnAReply(QnAVO vo) {
		boardDAO.writeQnAReply(vo);
	}

}
