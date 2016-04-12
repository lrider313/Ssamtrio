package com.genius.mapper;

import com.genius.model.Strumf;

public interface StrumfMapper {
	Strumf selectByStrid(Integer strid);
	int uploadSMF(Strumf strumf);
}
