package com.genius.mapper;

import com.genius.model.Fb;

public interface FbMapper {
	int insertFb(Fb fb);
	Fb selectformfb(Integer fbid);
}
