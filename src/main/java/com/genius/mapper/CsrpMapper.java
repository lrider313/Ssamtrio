package com.genius.mapper;

import java.util.List;

import com.genius.model.Csrp;

public interface CsrpMapper {
int insertRe(Csrp csrp);
List<Csrp> selectRe(Integer csid);
}
