package com.genius.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.genius.model.Member;
import com.genius.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	CartService cartservice;
	
	@RequestMapping("/cartList")
	public ModelAndView cartList(HttpSession session, HttpServletResponse response) throws IOException{
		if(session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			return new ModelAndView("/cart/cartList").addObject("mapListInCart", cartservice.getCartList(member.getMemid()));
		}
		return new ModelAndView("/main");
	}
	
	@RequestMapping("/addCart.str")
	public @ResponseBody Map<String, String> addCart(@RequestParam(value="checkedCartList[]") List<String> cartList, HttpSession session) {
//		for(String s : cartList) {
//			System.out.println(s);
//		}
		if(cartList != null) {
			return cartservice.addCartList(session, cartList);
		} else {
			Map<String,String> msg = new HashMap<>();
			msg.put("state", "noSelect");
			return msg;
		}
	}
	
}
