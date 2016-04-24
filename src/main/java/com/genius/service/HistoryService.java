package com.genius.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.genius.mapper.HistoryMapper;
import com.genius.model.History;

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
	public List<History> getHistoryList() {
		return historymapper.getHistoryList();
	}
}
