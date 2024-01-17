package com.wonder.www.biz.board;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.wonder.www.biz.boardVO.BoardVO;

public class BoardRowMapping implements RowMapper<BoardVO> {

	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException { // rowNum 행의 수
		BoardVO board = new BoardVO();
	
		board.setNo(rs.getInt("no"));;
		board.setId(rs.getString("id"));
		board.setTitle(rs.getString("title"));
		board.setContent(rs.getString("content"));
		board.setHit(rs.getInt("hit"));
		board.setWtime(rs.getString("wtime"));
		board.setFileName(rs.getString("fileName"));
		board.setCategory(rs.getString("category"));
		
		return board;
	}

}
