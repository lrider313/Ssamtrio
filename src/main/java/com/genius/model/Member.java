package com.genius.model;

import java.sql.Timestamp;

public class Member {
	private String memid;
	private String mempw;
	private String memname;
	private String memnick;
	private String mememail;
	private String memphone;
	private String memaddr;
	private Integer memauth;
	private Timestamp memdate;
	private Integer memlvl;
	
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMempw() {
		return mempw;
	}
	public void setMempw(String mempw) {
		this.mempw = mempw;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemnick() {
		return memnick;
	}
	public void setMemnick(String memnick) {
		this.memnick = memnick;
	}
	public String getMememail() {
		return mememail;
	}
	public void setMememail(String mememail) {
		this.mememail = mememail;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memphone) {
		this.memphone = memphone;
	}
	public String getMemaddr() {
		return memaddr;
	}
	public void setMemaddr(String memaddr) {
		this.memaddr = memaddr;
	}
	public Integer getMemauth() {
		return memauth;
	}
	public void setMemauth(Integer memauth) {
		this.memauth = memauth;
	}
	public Timestamp getMemdate() {
		return memdate;
	}
	public void setMemdate(Timestamp memdate) {
		this.memdate = memdate;
	}
	public Integer getMemlvl() {
		return memlvl;
	}
	public void setMemlvl(Integer memlvl) {
		this.memlvl = memlvl;
	}
}
