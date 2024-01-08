package com.wonder.www.biz.user;

import java.util.List;

import org.mybatis.spring.MyBatisSystemException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wonder.www.biz.userVO.UserVO;

@Repository("userDAO")
public class UserDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}

	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);
	}

	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}

	public UserVO getUser(UserVO vo) {
		UserVO user = new UserVO();
		try {
			return mybatis.selectOne("UserDAO.getUser",vo);
		}catch(MyBatisSystemException e) {
			user=null;
			return user;
		}
	}

	public int idCheckUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.idCheckUser", vo);
	}

	public int nickNameCheck(UserVO vo) {
		return mybatis.selectOne("UserDAO.nickNameCheck", vo);
	}
	
	public List<UserVO> getUserList(){
		return mybatis.selectList("UserDAO.getUserList");
	}
	
}
