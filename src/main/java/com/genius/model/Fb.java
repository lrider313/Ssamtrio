package com.genius.model;

import java.security.Timestamp;

public class Fb {
	private Integer fbid;
	private String fbtitle;
	private String fbcont;
	private Timestamp fbdate;
	private Integer fbcount;
	private String fbip;
	private String memid;
	private Integer boardid;
	public Integer getFbid() {
		return fbid;
	}
	
	public void setFbid(Integer fbid) {
		this.fbid = fbid;
	}
	public String getFbtitle() {
		return fbtitle;
	}
	public void setFbtitle(String fbtitle) {
		this.fbtitle = fbtitle;
	}
	public String getFbcont() {
		return fbcont;
	}
	public void setFbcont(String fbcont) {
		this.fbcont = fbcont;
	}
	public Timestamp getFbdate() {
		return fbdate;
	}
	public void setFbdate(Timestamp fbdate) {
		this.fbdate = fbdate;
	}
	public Integer getFbcount() {
		return fbcount;
	}
	public void setFbcount(Integer fbcount) {
		this.fbcount = fbcount;
	}
	public String getFbip() {
		return fbip;
	}
	public void setFbip(String fbip) {
		this.fbip = fbip;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public Integer getBoardid() {
		return boardid;
	}
	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}
}
