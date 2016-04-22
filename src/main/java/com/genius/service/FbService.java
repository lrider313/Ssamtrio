package com.genius.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public int insertFb(Fb fb, HttpServletRequest request, HttpSession Session) {
	fb.setFbip(request.getRemoteAddr());
	return	fbmapper.insertFb(fb);
	}
	
	@Transactional
	public Fb selectformfb(Integer fbid){
		return fbmapper.selectformfb(fbid);
	}
}
