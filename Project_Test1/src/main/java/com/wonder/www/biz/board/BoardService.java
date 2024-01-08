package com.wonder.www.biz.board;

import java.util.List;

import com.wonder.www.biz.boardVO.BoardVO;
import com.wonder.www.biz.replyVO.ReplyVO;

public interface BoardService {

	List<BoardVO> getHikingBoardList(BoardVO vo);
	
	void writeOkHikingBoard(BoardVO vo);
	
	BoardVO getHikingBoard(BoardVO vo);
	
	void deleteHikingBoard(BoardVO vo);
	
	List<BoardVO> getSearchHikingBoard(BoardVO vo);
	
	void updateOkHikingBoard(BoardVO vo);
	
	BoardVO getHikingBoardTotalPage(BoardVO vo);
	
	void inputReply(ReplyVO vo);
	
	List<ReplyVO> getBoardReply(BoardVO vo);
}
