package com.genius.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.genius.model.Csb;
import com.genius.service.BoardService;
import com.genius.service.CsbService;

@Controller
@RequestMapping("/csboard")
public class CsController {
	
	@Autowired
	CsbService csbservice;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/serviceForm.str")
	public ModelAndView serviceForm() {
		return new ModelAndView("csboard/serviceForm").addObject("boardList", boardService.getBoardList());
	}
	
	@RequestMapping(value="/servicePro.str", method=RequestMethod.POST)
	public String servicePro(MultipartFile file, HttpServletRequest request, Csb csb) {
		if(csbservice.insertCs(file, request, csb)==1) {
			return "redirect:/strboard/list.str";
		}
		return "redirect:/csboard/serviceList.str";
	}
	
	@RequestMapping("/serviceUpdate.str")
	public String serviceUpdate() {
		return "csboard/serviceUpdate";
		
	}
	
	@RequestMapping("/serviceList.str")
	public String serviceList() {
		return "csboard/serviceList";
		
	}
	
	
	
}
