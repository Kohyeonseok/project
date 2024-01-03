package com.wonder.www.biz.board;

import java.util.List;

import com.wonder.www.biz.boardVO.BoardVO;

public interface BoardService {

	List<BoardVO> getHikingBoardList(BoardVO vo);
	
	void writeOkHikingBoard(BoardVO vo);
	
	BoardVO getHikingBoard(BoardVO vo);
	
	void deleteHikingBoard(BoardVO vo);
	
	List<BoardVO> getSearchHikingBoard(BoardVO vo);
}
