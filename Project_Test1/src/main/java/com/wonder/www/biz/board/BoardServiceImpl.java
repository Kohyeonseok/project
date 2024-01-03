package com.wonder.www.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonder.www.biz.boardVO.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> getHikingBoardList(BoardVO vo) {
		return boardDAO.getHikingBoardList(vo);
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

}
