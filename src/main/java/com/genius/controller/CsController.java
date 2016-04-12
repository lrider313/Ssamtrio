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
			return "redirect:/csboard/serviceList.str";
		}
		return "redirect:/csboard/serviceForm.str";
	}
	
	@RequestMapping("/serviceUpdateForm.str")
	public ModelAndView serviceUpdateForm(Integer csid) {
		return new ModelAndView("csboard/serviceUpdateForm").addObject("csb", csbservice.selectById(csid));
	}
	
	//2번 
	//이쪽으로 던저서 post 로 request 함 
	// 그담에 csb 라는 모델에 담아서 받음 .
	@RequestMapping(value="/serviceUpdate.str", method=RequestMethod.POST)
	public String serviceUpdate(Csb csb) {
		//System.out.println(csb.getCstitle());
		//위에 처럼 csb모델에 get 으로 선언해둔걸 호출해봄 프린트로 
		// 그담에 서비스로 던짐 csb 모델통쨰로 즉 객체화 그대로 던짐 
		csbservice.updateCs(csb);
		return "redirect:/csboard/serviceList.str";
	}
	
	@RequestMapping("/serviceList.str")
	public ModelAndView serviceList() {
		return new ModelAndView("csboard/serviceList").addObject("csb", csbservice.selectCs());
		
	}
	
	@RequestMapping("/serviceSelectForm.str")
	public ModelAndView serviceSelectForm(int csid) {
		//System.out.println(csid);
		return new ModelAndView("csboard/serviceSelectForm").addObject("csb", csbservice.selectById(csid));
	}
}
