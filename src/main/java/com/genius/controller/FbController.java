package com.genius.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.genius.model.Board;
import com.genius.model.Fb;
import com.genius.service.BoardService;
import com.genius.service.FbService;



@Controller
@RequestMapping("/gallery")
public class FbController {
	@Autowired
	FbService fbService;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/view_gallery.str")
	public ModelAndView showGallery(Model model) {
		return new ModelAndView("gallery/view_gallery").addObject("list", fbService.getFboardList());
	}
	@RequestMapping("/write_gallery.str")
	public ModelAndView writeGallery(Model model) {
		
		return new ModelAndView("gallery/write_gallery").addObject("boardList", boardService.getBoardList());
	}
	@RequestMapping("/view_igallery")
	public String showiGallery(HttpServletRequest httpServletRequest) {
		
		return "/gallery/view_igallery";
		
	}
	@RequestMapping("/insertFboard.str")
	public String insertBoard(Fb fb, HttpServletRequest request){
		System.out.println(fb.getFbtitle());
		System.out.println(fb.getFbcont());
		System.out.println(fb.getFbcount());
		fbService.insertFb(fb, request);
		
		return "redirect:/gallery/view_gallery.str";
	}
	
}
