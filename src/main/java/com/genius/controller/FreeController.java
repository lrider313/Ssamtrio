package com.genius.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("freeSelectRec.str")
	public void freeSelectRec (@RequestParam("fbid") int fbid,HttpServletResponse response) throws Exception {		
		PrintWriter out=response.getWriter();
		fbservice.updateRec(fbid);      // 추천수 증가
	    Fb fb = fbservice.selectformfb(fbid);
	    int cnt = fb.getFbrec();    
	   
	    out.println(cnt);
    }
	
	
	@RequestMapping("freeSelectForm.str")
	public ModelAndView freeSlectFrom(int fbid) {
		
		fbservice.updatefb(fbid);		// 조회수 증가
//		fbservice.updateRec(fbid);      // 추천수 증가
		
		return new ModelAndView("freeboard/freeSelectForm").addObject("fb", fbservice.selectformfb(fbid));
	}
	
	
	@RequestMapping("freeBoardList.str")
	public ModelAndView freeBoardList(){
		return new ModelAndView("freeboard/freeBoardList").addObject("fb", fbservice.selectListfb());
	}
	
	@RequestMapping("freeBoardUpdate.str")
	public ModelAndView freeBoardUpdate(Integer fbid){
		return new ModelAndView("freeboard/freeBoardUpdate").addObject("fb", fbservice.selectformfb(fbid));
	}
		
	@RequestMapping(value= "freeUpdatepro.str" , method=RequestMethod.POST)
	public ModelAndView freeUpdatepro(Fb fb){
		fbservice.updateFbWrite(fb);
		return new ModelAndView ("freeboard/freeSelectForm").addObject("fb", fbservice.selectformfb(fb.getFbid()));
	}
	
	@RequestMapping("freeBoardDelete.str")
	public String freeBoardDelete(int fbid){
		fbservice.deleteFb(fbid);
		return "redirect:/freeboard/freeBoardList.str";
	}
}
	