package com.genius.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.genius.model.Fb;
import com.genius.service.BoardService;
import com.genius.service.FbService;

@Controller
@RequestMapping("/freeboard")
public class FreeController {

	
	@Autowired
	FbService fbservice;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/freeBoardWrite.str")
	public ModelAndView freeBoardWrite(){
		return new ModelAndView("freeboard/freeBoardWrite").addObject("boardList", boardService.getBoardList());
	}
	@RequestMapping(value="/freeBoardPro.str", method=RequestMethod.POST)
	public String servicePro( HttpServletRequest request, Fb fb, HttpSession session) {
		if(fbservice.insertFb(fb, request, session)==1) {
			return "redirect:/freeboard/freeBoardList.str";
		}
		return "redirect:/freeboard/freeBoardWrite.str";
	}
	
	
	@RequestMapping("freeSelectForm.str")
	public ModelAndView freeSlectFrom(int fbid){
		return new ModelAndView("freeboard/freeSelectForm").addObject("fb", fbservice.selectformfb(fbid));
	}
	
	@RequestMapping("freeBoardList.str")
	public String freeBoardList(){
		return "freeboard/freeBoardList";
	}
}
	