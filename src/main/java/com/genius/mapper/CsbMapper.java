package com.genius.mapper;

import java.util.List;

import com.genius.model.Csb;

public interface CsbMapper {
	int insertCs(Csb csb);
	List<Csb> selectCs();
	Csb selectById (Integer csid);
	int updateCs(Csb csb);
}
