package com.wonder.www.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wonder.www.biz.boardVO.BoardVO;
import com.wonder.www.biz.replyVO.ReplyVO;

@Repository("boardDAO")
public class BoardDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BoardVO> getHikingBoardList(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getHikingBoardList",vo);
	}
	
	public int countPost(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.countPost",vo);
	}
	
	public void writeOkHikingBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.writeOkHikingBoard",vo);
	}
	
	public BoardVO getHikingBoard(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getHikingBoard",vo);
	}
	
	public void deleteHikingBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteHikingBoard",vo);
	}
	
	public List<BoardVO> getSearchHikingBoard(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getSearchHikingBoard",vo);
	}
	
	public void updateHikingBoardHit(BoardVO vo) {
		mybatis.update("BoardDAO.updateHikingBoardHit",vo);
	}
	
	public void updateOkHikingBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateOkHikingBoard",vo);
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
}
