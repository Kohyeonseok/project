package com.wonder.www.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wonder.www.biz.user.UserService;
import com.wonder.www.biz.userVO.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/join.do")
	public ModelAndView insertUser(UserVO vo,ModelAndView mav) {
		userService.insertUser(vo);
		mav.setViewName("redirect:index.jsp");
		return mav;
	}
	
	@RequestMapping("/login.do")
	public ModelAndView getUser(UserVO vo,ModelAndView mav,HttpSession session) {
		UserVO user = new UserVO();
		user = userService.getUser(vo);
		if(user==null) {
			mav.addObject("logId",1);
			mav.setViewName("index.jsp");
			return mav;
		}else {
			session.setAttribute("logId", user);
			mav.addObject("logId",user);
			mav.setViewName("main.jsp");
			return mav;
		}
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(UserVO vo, ModelAndView mav,HttpSession session) {
		session.removeAttribute("logId");
		mav.setViewName("redirect:index.jsp");
		return mav;
	}
	
	@RequestMapping("/modify.do")
	public ModelAndView modify(UserVO vo,ModelAndView mav) {
		userService.updateUser(vo);
		mav.setViewName("login.do");
		return mav;
	}
	
	@RequestMapping("/deleteUser.do")
	public ModelAndView deleteUser(UserVO vo,ModelAndView mav,HttpSession session) {
		userService.deleteUser(vo);
		session.removeAttribute("logId");
		mav.setViewName("index.jsp");
		return mav;
	}
	
}
