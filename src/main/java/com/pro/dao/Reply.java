package com.pro.dao;

public class Reply {
	private String rcontext, rwriter, rdate;
	private int rnum, bnum, rrcm;

	private String visit;
	
	
	public String getVisit() {
		return visit;
	}

	public void setVisit(String visit) {
		this.visit = visit;
	}

	public String getRcontext() {
		return rcontext;
	}

	public void setRcontext(String rcontext) {
		this.rcontext = rcontext;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getRrcm() {
		return rrcm;
	}

	public void setRrcm(int rrcm) {
		this.rrcm = rrcm;
	}

}
