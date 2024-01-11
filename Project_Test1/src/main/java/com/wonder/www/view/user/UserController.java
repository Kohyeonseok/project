package com.wonder.www.view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
	
	@RequestMapping("/index.do")
	public ModelAndView index(ModelAndView mav) {
		mav.setViewName("redirect:index.jsp");
		return mav;
	}
	
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
	
	@RequestMapping("/idCheck.do")
	public void idCheck(UserVO vo,HttpServletResponse response) {
		int num = userService.idCheckUser(vo);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(num));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/nickNameCheck.do")
	public void nickNameCheck(UserVO vo,HttpServletResponse response) {
		int num = userService.nickNameCheck(vo);
		System.out.println(vo.getNickName());
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(num));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getUserList.do")
	public ModelAndView getUserList(ModelAndView mav) {
		mav.addObject("list",userService.getUserList());
		mav.setViewName("userList.jsp");
		return mav;
	}
	
	@RequestMapping("/adminDeleteUser.do")
	public ModelAndView adminDeleteUser(UserVO vo, ModelAndView mav) {
		userService.adminDeleteUser(vo);
		mav.setViewName("redirect:getUserList.do");
		return mav;
	}
	
	@RequestMapping("/adminThrowCaution.do")
	public ModelAndView adminThrowCaution(UserVO vo, ModelAndView mav) {
		userService.adminThrowCaution(vo);
		mav.setViewName("redirect:getUserList.do");
		return mav;
	}
	@RequestMapping("/exitUser.do")
	public void exitUser(UserVO vo, HttpServletResponse response,HttpSession session) throws IOException {
		System.out.println("test");
		PrintWriter out = response.getWriter();
		userService.deleteUser(vo);
		session.removeAttribute("logId");
		out.write("");
	}
	
	@RequestMapping("/getUserInfo.do")
	public ModelAndView getUserInfo(UserVO vo,ModelAndView mav) {
		mav.addObject("user",userService.getUserInfo(vo));
		mav.setViewName("getUserInfo.jsp");
		return mav;
	}

}
