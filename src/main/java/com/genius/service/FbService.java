package com.genius.service;

import java.util.List;

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
	
	@Transactional
	public List<Fb> selectListfb(){
		return fbmapper.selectListfb();
	}
	
	@Transactional
	public int updatefb(int fbid){
		return fbmapper.updateFb(fbid);
	}
	
	@Transactional
	public int updateRec(int fbid){
		return fbmapper.updateRec(fbid);
	}
	
	@Transactional
	public int updateFbWrite(Fb fb){
		return fbmapper.updateFbWrite(fb);
		
	}
	
	@Transactional
	public int deleteFb(int fbid){
		return fbmapper.deleteFb(fbid);
	}
}
