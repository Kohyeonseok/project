package com.wonder.www.biz.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wonder.www.biz.userVO.UserVO;

@Repository("userDAO")
public class UserDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insertUser(UserVO vo) {
		String SQL="INSERT INTO USER (name,id,nickName,password,email,postcode,roadAddress,jibunAddress,detailAddress,extraAddress,phoneNum,gender) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] args= {vo.getName(),vo.getId(),vo.getNickName(),vo.getPassword(),vo.getEmail(),vo.getSample4_postcode(),vo.getSample4_roadAddress(),vo.getSample4_jibunAddress(),vo.getSample4_detailAddress(),vo.getSample4_extraAddress(),vo.getPhoneNum(),vo.getGender()};
		jdbcTemplate.update(SQL,args);
	}
	
	public void deleteUser(UserVO vo) {
		String SQL="DELETE FROM USER WHERE ID=?";
		Object[] args= {vo.getId()};
		jdbcTemplate.update(SQL,args);
	}
	
	public void updateUser(UserVO vo) {
		String SQL="UPDATE USER SET name=?,nickName=?,password=?,postcode=?,roadAddress=?,jibunAddress=?,detailAddress=?,extraAddress=?,phoneNum=?, gender=? WHERE id=?";
		Object[] args= {vo.getName(),vo.getNickName(),vo.getPassword(),vo.getSample4_postcode(),vo.getSample4_roadAddress(),vo.getSample4_jibunAddress(),vo.getSample4_detailAddress(),vo.getSample4_extraAddress(),vo.getPhoneNum(),vo.getGender(),vo.getId()};
		jdbcTemplate.update(SQL,args);
	}
	
	public UserVO getUser(UserVO vo) {
		String SQL="SELECT * FROM USER WHERE id=? AND password=?";
		UserVO user = new UserVO();
		Object[] args = {vo.getId(),vo.getPassword()};
//		return jdbcTemplate.queryForObject(SQL, args,new UserRowMapping());
		try {
	        return jdbcTemplate.queryForObject(SQL, args, new UserRowMapping());
	    } catch (EmptyResultDataAccessException e) {
	        user = null;
	        return user;
	    }	
	}
	
	public int idCheckUser(UserVO vo) {
		String SQL="SELECT COUNT(*) FROM USER WHERE id=?";
		Object[] args = {vo.getId()};
		int num = jdbcTemplate.queryForObject(SQL,args,Integer.class); 
		return num;
	}
	
	public int nickNameCheck(UserVO vo) {
		String SQL="SELECT COUNT(*) FROM USER WHERE nickName=?";
		Object[] args = {vo.getNickName()};
		int num = jdbcTemplate.queryForObject(SQL,args,Integer.class);
		return num;
	}

}
