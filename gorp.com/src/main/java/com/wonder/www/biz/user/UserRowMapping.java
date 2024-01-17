package com.wonder.www.biz.user;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.wonder.www.biz.userVO.UserVO;

public class UserRowMapping implements RowMapper<UserVO> {

	@Override
	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		UserVO vo = new UserVO();
		vo.setEmail(rs.getString("email"));
		vo.setGender(rs.getString("gender"));
		vo.setId(rs.getString("id"));
		vo.setName(rs.getString("name"));
		vo.setNickName(rs.getString("nickName"));
		vo.setPassword(rs.getString("password"));
		vo.setPhoneNum(rs.getString("phoneNum"));
		vo.setSample4_detailAddress(rs.getString("detailAddress"));
		vo.setSample4_extraAddress(rs.getString("extraAddress"));
		vo.setSample4_jibunAddress(rs.getString("jibunAddress"));
		vo.setSample4_postcode(rs.getString("postcode"));
		vo.setSample4_roadAddress(rs.getString("roadAddress"));
		
		return vo;
	}

}
