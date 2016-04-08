package com.genius.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.genius.model.Board;
import com.genius.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/make.str")
	public String make() {
		return "board/make";
	}
	
	@RequestMapping("/makeBoard.str")
	public String makeBoard(Board board) {
		if(boardService.makeBoard(board)==1) {
			return "redirect:/strboard/list.str";
		}
		return "redirect:/board/makeBoard.str";
	}

}
