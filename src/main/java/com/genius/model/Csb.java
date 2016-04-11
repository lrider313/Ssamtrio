package com.genius.model;

import java.sql.Timestamp;

public class Csb {
	private Integer csid;
	private Integer cstype;
	private String cstitle;
	private String cscont;
	private String csip;
	private Timestamp csdate;
	private String csfile;
	private Integer boardid;
	private String memid;
	
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public Integer getCsid() {
		return csid;
	}
	public Integer getCstype() {
		return cstype;
	}
	public void setCstype(Integer cstype) {
		this.cstype = cstype;
	}
	public String getCstitle() {
		return cstitle;
	}
	public void setCstitle(String cstitle) {
		this.cstitle = cstitle;
	}
	public String getCscont() {
		return cscont;
	}
	public void setCscont(String cscont) {
		this.cscont = cscont;
	}
	public String getCsip() {
		return csip;
	}
	public void setCsip(String csip) {
		this.csip = csip;
	}
	public Timestamp getCsdate() {
		return csdate;
	}
	public void setCsdate(Timestamp csdate) {
		this.csdate = csdate;
	}
	public String getCsfile() {
		return csfile;
	}
	public void setCsfile(String csfile) {
		this.csfile = csfile;
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
