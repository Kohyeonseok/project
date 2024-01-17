package com.wonder.www.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonder.www.biz.boardVO.BoardVO;
import com.wonder.www.biz.clubVO.ClubVO;
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

	@Override
	public List<ClubVO> getClubBoardList(ClubVO vo) {
		return boardDAO.getClubBoardList(vo);
	}

	@Override
	public void createOkClubBoard(ClubVO vo) {
		boardDAO.createOkClubBoard(vo);
	}

	@Override
	public ClubVO getClubBoard(ClubVO vo) {
		return boardDAO.getClubBoard(vo);
	}

	@Override
	public List<ClubVO> getClubMembers(ClubVO vo) {
		return boardDAO.getClubMembers(vo);
	}

	@Override
	public void joinClub(ClubVO vo) {
		boardDAO.joinClub(vo);
	}

	@Override
	public ClubVO getClubMember(ClubVO vo) {
		return boardDAO.getClubMember(vo);
	}

	@Override
	public void cancleClub(ClubVO vo) {
		boardDAO.cancleClub(vo);
	}

	@Override
	public List<ClubVO> searchClubBoard(ClubVO vo) {
		return boardDAO.searchClubBoard(vo);
	}

	@Override
	public void deleteClubBoard(ClubVO vo) {
		boardDAO.deleteClubBoard(vo);
	}

	@Override
	public int getReportCount(BoardVO vo) {
		return boardDAO.getReportCount(vo);
	}

	@Override
	public int getQnACount(BoardVO vo) {
		return boardDAO.getQnACount(vo);
	}

	@Override
	public int getUserCount(BoardVO vo) {
		return boardDAO.getUserCount(vo);
	}

	@Override
	public List<BoardVO> getUserWriteBoardList(BoardVO vo) {
		return boardDAO.getUserWriteBoardList(vo);
	}
	
	public List<ClubVO> getUserJoinClubList(ClubVO vo){
		return boardDAO.getUserJoinClubList(vo);
	}

}
