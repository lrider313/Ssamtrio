package com.genius.mapper;

import java.util.List;

import com.genius.model.Fb;

public interface FbMapper {
	int insertFb(Fb fb);
	Fb selectformfb(Integer fbid);
	List<Fb> selectListfb();
	int updateFb(int fbid);
	int updateRec(int fbid);
}
