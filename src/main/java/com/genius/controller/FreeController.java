package com.genius.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freeboard")
public class FreeController {

	@RequestMapping("/freeBoardWrite.str")
	public String freeBoardWrite(){
		return "freeboard/freeBoardWrite";
	}
	
	@RequestMapping("freeSelectForm.str")
	public String freeSlectFrom(){
		return "freeboard/freeSelectForm";
	}
	
	@RequestMapping("freeBoardList.str")
	public String freeBoardList(){
		return "freeboard/freeBoardList";
	}
}
	