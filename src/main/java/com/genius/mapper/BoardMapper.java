package com.genius.mapper;

import java.util.List;

import com.genius.model.Board;

public interface BoardMapper {
	List<Board> selectAll();
	int makeBoard(Board board);
}
