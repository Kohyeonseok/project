package com.wonder.www.biz.user;

import com.wonder.www.biz.userVO.UserVO;

public interface UserService {

	void insertUser(UserVO vo);
	
	void updateUser(UserVO vo);
	
	void deleteUser(UserVO vo);
	
	UserVO getUser(UserVO vo);
}
