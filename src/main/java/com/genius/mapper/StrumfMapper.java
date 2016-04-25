package com.genius.mapper;

import java.util.List;

import com.genius.model.Strumf;

public interface StrumfMapper {
	List<Strumf> selectByStrid(Integer strid);
	int uploadSMF(Strumf strumf);
	Strumf selectByMapid(Integer mapid);
	int mapcountInc(Integer mapid);
	List<String> getMapnameListByMapid(List<Integer> mapidList);
	int deleteList(List<Integer> mapidList);
	int mapcountListInc(List<Integer> mapidList);
}
