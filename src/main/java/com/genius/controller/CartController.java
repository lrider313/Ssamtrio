package com.genius.controller;

import java.io.IOException;
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

import com.genius.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	CartService cartservice;
	
	@RequestMapping("/cartList")
	public ModelAndView cartList(HttpSession session, HttpServletResponse response) throws IOException{
		return new ModelAndView("/cart/cartList").addObject("mapListInCart", cartservice.getCartList(session));
	}
	
	@RequestMapping("/addCartList.str")
	public @ResponseBody Map<String, String> addCartList(@RequestParam(value="checkedCartList[]") List<Integer> mapidList, HttpSession session) {
		if(mapidList != null) {
			return cartservice.addCartList(session, mapidList);
		} else {
			Map<String,String> msg = new HashMap<String,String>();
			msg.put("state", "noSelect");
			return msg;
		}
	}
	
	@RequestMapping("/addCart.str")
	public @ResponseBody Map<String, String> addCart(@RequestParam Integer mapid, HttpSession session) {
		if(mapid != null) {
			return cartservice.addCart(session, mapid);
		}
		return null;
	}
	
	@RequestMapping("/delCart.str")
	public @ResponseBody Map<String,String> delCart(@RequestParam(value="list[]") List<Integer> mapidList, HttpSession session){
		return cartservice.deleteCartByMapid(mapidList, session);
			
	}
	
}
