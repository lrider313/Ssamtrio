package com.genius.model;

import java.sql.Timestamp;

public class Strumn {
	private Integer strid;
	private String strtitle;
	private String strcont;
	private String strtype;
	private String strip;
	private Integer strcount;
	private Timestamp strdate;
	private Integer boardid;
	private String memid;
	public Integer getStrid() {
		return strid;
	}
	public void setStrid(Integer strid) {
		this.strid = strid;
	}
	public String getStrtitle() {
		return strtitle;
	}
	public void setStrtitle(String strtitle) {
		this.strtitle = strtitle;
	}
	public String getStrcont() {
		return strcont;
	}
	public void setStrcont(String strcont) {
		this.strcont = strcont;
	}
	public String getStrtype() {
		return strtype;
	}
	public void setStrtype(String strtype) {
		this.strtype = strtype;
	}
	public String getStrip() {
		return strip;
	}
	public void setStrip(String strip) {
		this.strip = strip;
	}
	public Integer getStrcount() {
		return strcount;
	}
	public void setStrcount(Integer strcount) {
		this.strcount = strcount;
	}
	public Timestamp getStrdate() {
		return strdate;
	}
	public void setStrdate(Timestamp strdate) {
		this.strdate = strdate;
	}
	public Integer getBoardid() {
		return boardid;
	}
	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
}
