package com.genius.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {

	
	@RequestMapping("/view_cart")
	public String cart(){
		
		return "/cart/view_cart";
	}
	
}
