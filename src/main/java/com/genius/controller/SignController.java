package com.genius.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.genius.model.Member;
import com.genius.service.SignProService;

@Controller
@RequestMapping("/sign")
public class SignController {
	
	@Autowired
	SignProService signProService;
	
	@RequestMapping("/signinForm.str")
	public String signinForm() {
		return "/sign/signinForm";
	}
	
	@RequestMapping("/signinPro.str")
	public ModelAndView signinPro(HttpServletRequest request, HttpSession session) {
		Member member = new Member();
		member.setMemid(request.getParameter("memid"));
		member.setMempw(request.getParameter("mempw"));
		member = signProService.checkSignin(member);
		if(member!=null) {
			session.setAttribute("member", member);
			return new ModelAndView("redirect:/strboard/list.str");
		}
		return new ModelAndView("/sign/signinForm");
	}
	
	@RequestMapping("/signoutPro.str")
	public String signoutPro(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/strboard/list.str";
	}
	
	@RequestMapping("/signupForm.str")
	public String signupForm() {
		return "/sign/signupForm";
	}
	
	@RequestMapping("/signupPro.str")
	public String signupPro(Member member) {
//		System.out.println("memid" + member.getMemid());
//		System.out.println("mempw" + member.getMempw());
//		System.out.println("memname" + member.getMemname());
//		System.out.println("memnick" + member.getMemnick());
//		System.out.println("memphone" + member.getMemphone());
//		System.out.println("memaddr" + member.getMemaddr());
		if(signProService.signupPro(member)==1) {
			System.out.println("Member signup success!!");
			return "redirect:/strboard/list.str";
		}
		return "redirect:/sign/signupForm.str";
	}
}
