package com.genius.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.mapper.HistoryMapper;
import com.genius.model.History;
import com.genius.model.Member;

@Service
public class HistoryService {

	@Autowired
	HistoryMapper historymapper;
	
	@Transactional
	public void addHistoryList(List<History> historyList) {
		historymapper.addHistoryList(historyList);
	}
	
	@Transactional
	public void delHistoryList(List<History> historyList) {
		historymapper.delHistoryById(historyList);
	}
	
	@Transactional
	public List<History> getHistoryList(HttpSession session) {
		if(session.getAttribute("member") != null) {
			Member member = (Member) session.getAttribute("member");
			String memid = member.getMemid();
			return historymapper.getHistoryList(memid);
		} else {
			return null;
		}
	}
}
