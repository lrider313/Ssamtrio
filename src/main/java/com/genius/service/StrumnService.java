package com.genius.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.mapper.StrumnMapper;
import com.genius.model.Strumn;

@Service
public class StrumnService {
	@Autowired
	StrumnMapper strumnmapper;
	
	@Transactional
	public int insertStrumn(Strumn strumn, HttpServletRequest request) {
		System.out.println("insertStrumn()...");
		int state=-1;
		strumn.setStrip(request.getRemoteAddr());
		System.out.println(strumn.getStrtitle());
		System.out.println(strumn.getStrcont());
		System.out.println(strumn.getStrip());
		strumnmapper.insertStr(strumn);
		return state;
	}
	
	@Transactional
	public List<Strumn> getList() {
		System.out.println("getList()...");
		return strumnmapper.selectAll();
	}
}
