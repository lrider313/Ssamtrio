package com.genius.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.genius.service.HistoryService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	HistoryService historyService;
	
	@RequestMapping("/memberInfo.str")
	public ModelAndView memberInfo() {
		return new ModelAndView("/member/memberInfo").addObject("historyList", historyService.getHistoryList());
	}
}
