package com.wonder.www.biz.user;

import java.util.List;

import com.wonder.www.biz.userVO.UserVO;

public interface UserService {

	void insertUser(UserVO vo);
	
	void updateUser(UserVO vo);
	
	void deleteUser(UserVO vo);
	
	UserVO getUser(UserVO vo);
	
	int idCheckUser(UserVO vo);
	
	int nickNameCheck(UserVO vo);
	
	List<UserVO> getUserList();
	
	void adminDeleteUser(UserVO vo);
	
	void adminThrowCaution(UserVO vo);
	
	UserVO getUserInfo(UserVO vo);
	
	int getReportCount(UserVO vo);

	int getQnACount(UserVO vo);
	
	int getUserCount(UserVO vo);
}
