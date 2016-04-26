package com.genius.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void signinPro(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
//		response.setCharacterEncoding("UTF-8");
		response.setContentType ("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
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
			writer.println("<script type='text/javascript'>");
			writer.println("alert('"+member.getMemnick()+"님 환영합니다.');");
			writer.println("location.href='/Ssamtrio/main/';");
		} else {
			System.out.println("ㅇㅇ");
			writer.println("<script type='text/javascript'>");
			writer.println("alert('아이디 혹은 비밀번호가 일치하지 않습니다.');");
			writer.println("location.href='/Ssamtrio/sign/signinForm.str';");
		}
		writer.println("</script>");
		writer.flush();
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
	public void signupPro(Member member, HttpServletResponse response) throws IOException {
		response.setContentType ("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(signProService.signupPro(member)==1) {
			System.out.println("Member signup success!!");
			writer.println("<script type='text/javascript'>");
			writer.println("alert('"+member.getMemnick()+"님 가입을 축하합니다.');");
			writer.println("location.href='/Ssamtrio/main/';");
		} else {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('회원가입에 실패했습니다.');");
			writer.println("location.href='/Ssamtrio/sign/signupForm.str';");
		}
		writer.println("</script>");
		writer.flush();
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
