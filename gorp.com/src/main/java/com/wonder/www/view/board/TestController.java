package com.wonder.www.view.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin(origins = "http://localhost:8080")
@RestController
public class TestController {

	@CrossOrigin(origins = "http://localhost:8080")
	@RequestMapping("/test.do")
	public ModelAndView test(ModelAndView mav) {
		mav.setViewName("test.jsp");
		return mav;
	}
	
	
	@CrossOrigin(origins = "http://localhost:8080")
	@ResponseBody
	@RequestMapping(value="/cat.do", method = RequestMethod.GET)
	public String cat() {
		System.out.print("요청이 들어오나....");
		List<ImageObj> list = new ArrayList<ImageObj>();
		
		for (int i = 0; i<10 ; i++) {
			ImageObj imageObj = new ImageObj();
			imageObj.setImage_url("images/test-image.png");
			imageObj.setTitle("테스트제목입니다."+i);
			imageObj.setCount(i);
			imageObj.setDate("2024-01-02");
			list.add(imageObj);
		}
		return "ddddd";
	}
	
	

	public static class ImageObj {
		private String image_url;
		private String title;
		private int count;
		private String date;
		
		public String getImage_url() {
			return image_url;
		}
		public void setImage_url(String image_url) {
			this.image_url = image_url;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		
		
	}
}


