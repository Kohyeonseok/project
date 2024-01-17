package com.wonder.www.biz.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wonder.www.biz.userVO.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAOMybatis userDAO;

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public int idCheckUser(UserVO vo) {
		return userDAO.idCheckUser(vo);
	}

	@Override
	public int nickNameCheck(UserVO vo) {
		return userDAO.nickNameCheck(vo);
	}

	@Override
	public List<UserVO> getUserList() {
		return userDAO.getUserList();
	}

	@Override
	public void adminDeleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}

	@Override
	public void adminThrowCaution(UserVO vo) {
		userDAO.adminThrowCaution(vo);
	}

	@Override
	public UserVO getUserInfo(UserVO vo) {
		return userDAO.getUserInfo(vo);
	}

	@Override
	public int getReportCount(UserVO vo) {
		return userDAO.getReportCount(vo);
	}

	@Override
	public int getQnACount(UserVO vo) {
		return userDAO.getQnACount(vo);
	}

	@Override
	public int getUserCount(UserVO vo) {
		return userDAO.getUserCount(vo);
	}

}
