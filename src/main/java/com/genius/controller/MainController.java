package com.genius.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView list(HttpServletRequest request) {
		String searchWordBar = request.getParameter("searchWordBar");
		String headcount = request.getParameter("headcount");
		String strtype = request.getParameter("strtype");
		String maplod = request.getParameter("maplod");
		String mapmana = request.getParameter("mapmana");
		String maptime = request.getParameter("maptime");
		if(searchWordBar!=null&&headcount.equals("all")&&strtype.equals("all")&&maplod.equals("all")&&mapmana.equals("all")&&maptime.equals("all")){
			return new ModelAndView("strboard/list").addObject("list", strumnservice.getListBySW(request.getParameter("searchWordBar")));
		}
		return new ModelAndView("/main");
	}
}
