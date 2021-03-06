package com.genius.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.genius.command.Searchword;
import com.genius.model.Strumn;
import com.genius.service.StrumnService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	StrumnService strumnservice;
	
	
	@RequestMapping("/")
	public ModelAndView goMainPage() {
		return new ModelAndView("/main").addObject("strumn", strumnservice.getList());
	}
	
	@RequestMapping("/list.str")
	public @ResponseBody List<Strumn> list(Searchword searchword) {
		return strumnservice.getListBySW(searchword);
	}
}
