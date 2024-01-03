package com.wonder.www.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wonder.www.biz.boardVO.BoardVO;


@Repository("boardDAO")
public class BoardDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<BoardVO> getHikingBoardList(BoardVO vo) {
		vo.setCount(countPost(vo));
		vo.setPageNum((int) Math.ceil(vo.getCount()/10.0));
		
		String SQL = "SELECT * FROM HIKINGBOARD ORDER BY NO DESC";
//		String SQL = "SELECT * FROM HIKINGBOARD ORDER BY NO DESC LIMIT 10 OFFSET ?";
//		Object[] args= {offset};
//		return jdbcTemplate.query(SQL,args, new BoardRowMapping());
		return jdbcTemplate.query(SQL,new BoardRowMapping());
	}
			
	public int countPost(BoardVO vo) {
		try {
	        String category = vo.getCategory();
	        String SQL = "SELECT COUNT(*) FROM " + category + "BOARD";
	        return jdbcTemplate.queryForObject(SQL, Integer.class);
	    } catch (EmptyResultDataAccessException e) {
	        return 0;
	    }
	}
	
	public void writeOkHikingBoard(BoardVO vo) {
		String SQL = "INSERT INTO HIKINGBOARD (ID, TITLE, CONTENT,FILENAME, CATEGORY) values(?,?,?,?,?)";
		Object[] args = {vo.getId(),vo.getTitle(),vo.getContent(),vo.getFileName(),vo.getCategory()};
		jdbcTemplate.update(SQL,args);
	}
	
	public BoardVO getHikingBoard(BoardVO vo) {
		String SQL="SELECT * FROM HIKINGBOARD WHERE NO =?";
		Object[] args = {vo.getNo()};
		return jdbcTemplate.queryForObject(SQL, args, new BoardRowMapping());
	}
	
	public void deleteHikingBoard(BoardVO vo) {
		String SQL="DELETE FROM HIKINGBOARD WHERE NO=?";
		Object[] args = {vo.getNo()};
		jdbcTemplate.update(SQL,args);
	}
	
	public List<BoardVO> getSearchHikingBoard(BoardVO vo) {
		String SQLT="SELECT * FROM HIKINGBOARD WHERE TITLE LIKE CONCAT('%',?,'%') ORDER BY NO DESC";
		String SQLC="SELECT * FROM HIKINGBOARD WHERE CONTENT LIKE CONCAT('%',?,'%') ORDER BY NO DESC";
		String SQL="SELECT * FROM HIKINGBOARD ORDER BY NO DESC";
		Object[] args = {vo.getSearchContent()};
		
		if(vo.getSearchCategory().equals("title")) {
			return jdbcTemplate.query(SQLT,args,new BoardRowMapping());
		}else if(vo.getSearchCategory().equals("content")){
			return jdbcTemplate.query(SQLC,args,new BoardRowMapping());
		}
		return jdbcTemplate.query(SQL, new BoardRowMapping());
		
	}
	
	public void updateHikingBoardHit(BoardVO vo) {
		String SQL ="UPDATE HIKINGBOARD SET HIT=HIT+1 WHERE NO=?";
		Object[] args = {vo.getNo()};
		jdbcTemplate.update(SQL,args);
	}
	

}
