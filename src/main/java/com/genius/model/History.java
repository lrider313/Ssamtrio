package com.genius.model;

import java.sql.Timestamp;
import java.util.List;

public class History {
	private Integer historyid;
	private Timestamp hisdate;
	private Integer mapid;
	private String memid;
	private List<Strumf> strumf;
	public Integer getHistoryid() {
		return historyid;
	}
	public void setHistoryid(Integer historyid) {
		this.historyid = historyid;
	}
	public Timestamp getHisdate() {
		return hisdate;
	}
	public void setHisdate(Timestamp hisdate) {
		this.hisdate = hisdate;
	}
	public Integer getMapid() {
		return mapid;
	}
	public void setMapid(Integer mapid) {
		this.mapid = mapid;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public List<Strumf> getStrumf() {
		return strumf;
	}
	public void setStrumf(List<Strumf> strumf) {
		this.strumf = strumf;
	}
}
