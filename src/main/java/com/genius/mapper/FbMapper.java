package com.genius.mapper;

import java.util.List;

import com.genius.model.Fb;

public interface FbMapper {
	List<Fb> selectFboard();
	void insertFb(Fb fb);
}
