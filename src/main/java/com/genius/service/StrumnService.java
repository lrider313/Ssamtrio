package com.genius.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Map<String,String> updateOne(Strumn strumn) {
		Map<String,String> message = new HashMap<String,String>();
		String temp = strumn.getStrtitle()+"로 ";
		if(strumnmapper.updateOne(strumn)==1) {
			message.put("state", temp+"수정하였습니다.");
		} else {
			message.put("state", temp+"수정하는데 실패했습니다.");
		}
		return message;
	}
	
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
//		System.out.println("searchWordBar:"+searchword.getSearchWordBar());
//		System.out.println("headcount:"+searchword.getHeadcount());
//		System.out.println("maplod:"+searchword.getMaplod());
//		System.out.println("mapmana:"+searchword.getMapmana());
//		System.out.println("maptime:"+searchword.getMaptime());
//		System.out.println("strtype:"+searchword.getStrtype());
		return strumnmapper.getListBySW(searchword);
	}
	
	@Transactional
	public Map<String,String> deleteOne(Integer strid) {
		Map<String,String> message = new HashMap<String,String>();
		message.put("state", "삭제했습니다.");
		if(strumnmapper.deleteOne(strid)<1){
			message.put("state", "삭제에 실패했습니다.\n 다시 시도해보세요.");
		}
		return message;
	}
}
