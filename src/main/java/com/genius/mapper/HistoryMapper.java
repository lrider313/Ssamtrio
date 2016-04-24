package com.genius.mapper;

import java.util.List;

import com.genius.model.History;

public interface HistoryMapper {
	List<History> getHistoryList();
	int addHistoryList(List<History> historyList);
	int delHistoryById(List<History> historyList);
	
}
