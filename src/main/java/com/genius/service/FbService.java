package com.genius.service;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.mapper.FbMapper;
import com.genius.model.Fb;

@Service
public class FbService {

	@Autowired
	FbMapper fbmapper;
	
	@Transactional
	public List<Fb> getFboardList() {
		System.out.println("getFBoardList..");
		return fbmapper.selectFboard();
	}
	
	@Transactional
	public void insertFb(Fb fb, HttpServletRequest request) {
		System.out.println("makeFboard()...");
		System.out.println("제목?"+ fb.getFbtitle());
		System.out.println("내용?"+ fb.getFbcont());
		fb.setFbip(request.getRemoteAddr());
		fbmapper.insertFb(fb);
	}
}
