package com.genius.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.mapper.CsrpMapper;
import com.genius.model.Csrp;
import com.genius.model.Member;

@Service
public class CsrpService {
	
@Autowired
CsrpMapper csrpmapper;


@Transactional
public int insertRe(Csrp csrp, HttpSession session){
	Member member = (Member) session.getAttribute("member");
	csrp.setMemid(member.getMemid());
	return csrpmapper.insertRe(csrp);
}

public List<Csrp> selectRe(Integer csid){
	return csrpmapper.selectRe(csid);
}
}
