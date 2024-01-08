package com.wonder.www.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonder.www.biz.boardVO.BoardVO;
import com.wonder.www.biz.replyVO.ReplyVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAOMybatis boardDAO;

	@Override
	public List<BoardVO> getHikingBoardList(BoardVO vo) {
		return boardDAO.getHikingBoardList(vo);
	}
	
	@Override
	public BoardVO getHikingBoardTotalPage(BoardVO vo) {
		vo.setTotalPage((int) Math.ceil(boardDAO.countPost(vo)/10.0));
		return vo;
	}
	
	

	@Override
	public void writeOkHikingBoard(BoardVO vo) {
		boardDAO.writeOkHikingBoard(vo);
	}

	@Override
	public BoardVO getHikingBoard(BoardVO vo) {
		boardDAO.updateHikingBoardHit(vo);
		return boardDAO.getHikingBoard(vo);
	}

	@Override
	public void deleteHikingBoard(BoardVO vo) {
		boardDAO.deleteHikingBoard(vo);
	}

	@Override
	public List<BoardVO> getSearchHikingBoard(BoardVO vo) {
		return boardDAO.getSearchHikingBoard(vo);
	}

	@Override
	public void updateOkHikingBoard(BoardVO vo) {
		boardDAO.updateOkHikingBoard(vo);
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

}
