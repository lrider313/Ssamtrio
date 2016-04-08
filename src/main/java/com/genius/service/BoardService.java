package com.genius.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.mapper.BoardMapper;
import com.genius.model.Board;

@Service
public class BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	@Transactional
	public List<Board> getBoardList() {
		System.out.println("getBoardList()...");
		return boardMapper.selectAll();
	}
	
	@Transactional
	public int makeBoard(Board board) {
		System.out.println("makeBoard()...");
		return boardMapper.makeBoard(board);
	}
}
