package com.wonder.www.biz.board;

import java.util.List;

import com.wonder.www.biz.boardVO.BoardVO;
import com.wonder.www.biz.clubVO.ClubVO;
import com.wonder.www.biz.qnaVO.QnAVO;
import com.wonder.www.biz.replyVO.ReplyVO;

public interface BoardService {

	List<BoardVO> getBoardList(BoardVO vo);
	
	BoardVO getBoardTotalPage(BoardVO vo);
	
	List<BoardVO> getSearchBoard(BoardVO vo);
	
	void writeOkBoard(BoardVO vo);
	
	BoardVO getBoard(BoardVO vo);
	
	void deleteBoard(BoardVO vo);
	
	
	void updateOkBoard(BoardVO vo);
	
	
	void inputReply(ReplyVO vo);
	
	List<ReplyVO> getBoardReply(BoardVO vo);
	
	void reportBoard(BoardVO vo);
	
	List<BoardVO> getReportBoardList();
	
	void adminDeleteBoard(BoardVO vo);
	
	void adminDeleteReport(BoardVO vo);
	
	void deleteReply(ReplyVO vo);
	
	List<QnAVO> getQNABoardList(QnAVO vo);
	
	void writeOkQnABoard(QnAVO vo);
	
	QnAVO getQnABoard(QnAVO vo);
	
	void writeQnAReply(QnAVO vo);
	
	List<ClubVO> getClubBoardList(ClubVO vo);
	
	void createOkClubBoard(ClubVO vo);
	
	ClubVO getClubBoard(ClubVO vo);
	
	List<ClubVO> getClubMembers(ClubVO vo);
	
	void joinClub(ClubVO vo);
	
	ClubVO getClubMember(ClubVO vo);
	
	void cancleClub(ClubVO vo);
	
	List<ClubVO> searchClubBoard(ClubVO vo);
	
	void deleteClubBoard(ClubVO vo);

	int getReportCount(BoardVO vo);

	int getQnACount(BoardVO vo);
	
	int getUserCount(BoardVO vo);
	
	List<BoardVO> getUserWriteBoardList(BoardVO vo);
	
	List<ClubVO> getUserJoinClubList(ClubVO vo);
}
