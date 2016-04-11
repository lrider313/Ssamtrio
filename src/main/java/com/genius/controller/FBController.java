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
import com.genius.service.BoardService;



@Controller
@RequestMapping("/gallery")
public class FBController {
	
	
	@RequestMapping("/view_gallery")
	public String showGallery(Model model) {
		
		
		return "/gallery/view_gallery";
	}
	@RequestMapping("/write_gallery")
	public String writeGallery(Model model) {
		
		
		return "/gallery/write_gallery";
	}
	@RequestMapping("/view_igallery")
	public String showiGallery(HttpServletRequest httpServletRequest) {
		
		return "/gallery/view_igallery";
		
	}
	
}
