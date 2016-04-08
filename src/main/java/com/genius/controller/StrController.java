package com.genius.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.genius.model.Strumn;
import com.genius.service.BoardService;
import com.genius.service.StrumnService;

@Controller
@RequestMapping("/strboard")
public class StrController {
	
	//이 Autowired는 XML에서 설정한 Bean이 아닌 StrumnListService.java파일의 @Service Annotation을 통해 자동 주입하고 있다.
	@Autowired
	StrumnService strumnService;
	
	@Autowired
	BoardService boardService;
	
//	@RequestMapping("/main.str")
//	public String mainPage() {
//		return "strboard/main";
//	}
	
	@RequestMapping("/list.str")
	public ModelAndView list() {
		return new ModelAndView("strboard/list").addObject("list", strumnService.getList());
	}
	
	@RequestMapping("/write.str")
	public ModelAndView write() {
		return new ModelAndView("strboard/write").addObject("boardList", boardService.getBoardList());
	}
	
	@RequestMapping("/insertStrumn.str")
	public String insertStrumn(Strumn strumn, HttpServletRequest request) {
		System.out.println(strumn.getStrtitle());
		System.out.println(strumn.getStrcont());
		System.out.println(strumn.getStrip());
		strumnService.insertStrumn(strumn, request);
		return "redirect:/strboard/list.str";
	}

}
