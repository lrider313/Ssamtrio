package com.genius.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.command.Searchword;
import com.genius.mapper.StrumnMapper;
import com.genius.model.Member;
import com.genius.model.Strumn;

@Service
public class StrumnService {
	@Autowired
	StrumnMapper strumnmapper;
	
	@Transactional
	public int insertStrumn(Strumn strumn, HttpServletRequest request, HttpSession session) {
		int state=-1;
		if(session.getAttribute("member")==null) {
			return state;
		}
		Member member = (Member) session.getAttribute("member");
		strumn.setMemid(member.getMemid());
		strumn.setStrip(request.getRemoteAddr());
		state = strumnmapper.insertStr(strumn);

		return state;
	}
	
	@Transactional
	public List<Strumn> getList() {
		return strumnmapper.selectAll();
	}
	
	@Transactional
	public List<Strumn> getListBySW(Searchword searchword) {
		System.out.println("searchWordBar:"+searchword.getSearchWordBar());
		System.out.println("headcount:"+searchword.getHeadcount());
		System.out.println("maplod:"+searchword.getMaplod());
		System.out.println("mapmana:"+searchword.getMapmana());
		System.out.println("maptime:"+searchword.getMaptime());
		System.out.println("strtype:"+searchword.getStrtype());
		
		return strumnmapper.getListBySW(searchword);
	}
}
