package com.wonder.www.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wonder.www.biz.boardVO.BoardVO;
import com.wonder.www.biz.qnaVO.QnAVO;
import com.wonder.www.biz.replyVO.ReplyVO;

@Repository("boardDAO")
public class BoardDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BoardVO> getBoardList(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardList",vo);
	}
	
	public int countPost(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.countPost",vo);
	}
	
	public List<BoardVO> getSearchBoard(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getSearchBoard",vo);
	}
	
	
	public void writeOkBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.writeOkBoard",vo);
	}
	
	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getBoard",vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard",vo);
	}
	

	public void updateBoardHit(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoardHit",vo);
	}
	
	public void updateOkBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateOkBoard",vo);
	}
	
	public void inputReply(ReplyVO vo) {
		mybatis.insert("BoardDAO.inputReply",vo);
	}
	
	public List<ReplyVO> getBoardReply(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardReply",vo);
	}
	
	public void reportBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.reportBoard",vo);
	}
	
	public List<BoardVO> getReportBoardList(){
		return mybatis.selectList("BoardDAO.getReportBoardList");
	}
	
	public void adminDeleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.adminDeleteBoard",vo);
	}
	
	public void adminDeleteReport(BoardVO vo) {
		mybatis.delete("BoardDAO.adminDeleteReport",vo);
	}
	
	public void deleteReply(ReplyVO vo) {
		mybatis.delete("BoardDAO.deleteReply",vo);
	}
	
	public List<QnAVO> getQNABoardList(QnAVO vo){
		return mybatis.selectList("BoardDAO.getQNABoardList",vo);
	}
	
	public void writeOkQnABoard(QnAVO vo) {
		mybatis.insert("BoardDAO.writeOkQnABoard",vo);
		vo.setGroupNum((Integer) mybatis.selectOne("BoardDAO.getCurNum"));
		mybatis.update("BoardDAO.updateGroupNum",vo);
	}
	
	public QnAVO getQnABoard(QnAVO vo) {
		return mybatis.selectOne("BoardDAO.getQnABoard",vo);
	}
	
	public void writeQnAReply(QnAVO vo) {
		mybatis.update("BoardDAO.updateStepNum",vo);
		mybatis.insert("BoardDAO.writeQnAReply",vo);
		mybatis.update("BoardDAO.updateResult",vo);
	}
}
