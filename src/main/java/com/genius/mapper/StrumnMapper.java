package com.genius.mapper;

import java.util.List;

import com.genius.command.Searchword;
import com.genius.model.Strumn;

public interface StrumnMapper {
	List<Strumn> selectAll();
	int insertStr(Strumn strumn);
	List<Strumn> getListBySW(Searchword searchword);
}
