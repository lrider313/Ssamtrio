package com.genius.model;

import java.security.Timestamp;

public class Csrp {
	private Integer csrpid;
	private String csrpcont;
	private Timestamp csrpdate;
	private Integer csid;
	private String memid;
	public Integer getCsrpid() {
		return csrpid;
	}
	public void setCsrpid(Integer csrpid) {
		this.csrpid = csrpid;
	}
	public String getCsrpcont() {
		return csrpcont;
	}
	public void setCsrpcont(String csrpcont) {
		this.csrpcont = csrpcont;
	}
	public Timestamp getCsrpdate() {
		return csrpdate;
	}
	public void setCsrpdate(Timestamp csrpdate) {
		this.csrpdate = csrpdate;
	}
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
}
