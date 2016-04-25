package com.genius.mapper;

import java.util.List;

import com.genius.command.Searchword;
import com.genius.model.Strumn;

public interface StrumnMapper {
	int updateOne(Strumn strumn);
	List<Strumn> selectAll();
	int insertStr(Strumn strumn);
	List<Strumn> getListBySW(Searchword searchword);
	List<Strumn> getListByMapList(List<Integer> mapidList);
	int deleteOne(Integer strid);
}
