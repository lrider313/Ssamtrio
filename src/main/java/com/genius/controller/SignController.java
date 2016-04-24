package com.genius.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.genius.model.Member;
import com.genius.service.CartService;
import com.genius.service.SignProService;

@Controller
@RequestMapping("/sign")
public class SignController {
	Log log = LogFactory.getLog(SignController.class);
	
	@Autowired
	SignProService signProService;
	
	@Autowired
	CartService cartService;
	
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
			//세션에 장바구니 정보가 있다면 DB로 장바구니 정보 저장.
			if(session.getAttribute("cartList") != null){
				log.info("signin OK! 장바구니 정보 DB에 넣기 시도 중...");
				int state = cartService.addCartListOnSignin(session);
				log.info("signin 후 session의 장바구니 처리 state: " + state);
			}
			return new ModelAndView("redirect:/main/");
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
		if(signProService.signupPro(member)==1) {
			System.out.println("Member signup success!!");
			return "redirect:/strboard/list.str";
		}
		return "redirect:/sign/signupForm.str";
	}
	
	@RequestMapping("/signOut.str")
	public String signOut(HttpSession session) {
		session.invalidate();
		return "redirect:/main/";
	}
	
	@RequestMapping("/checkExistId.str")
	public @ResponseBody Map<String, String> checkExistId(Member member) {
		Map<String,String> uableId = new HashMap<String,String>();
		uableId.put("usableId", signProService.checkExistId(member.getMemid()));
		return uableId;
	}
}
