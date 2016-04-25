package com.genius.mapper;

import java.util.List;

import com.genius.model.History;

public interface HistoryMapper {
	int addHistoryList(List<History> historyList);
	int delHistoryById(List<History> historyList);
	List<History> getHistoryList(String memid);
}
