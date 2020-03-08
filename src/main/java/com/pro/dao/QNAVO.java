package com.pro.dao;

public class QNAVO {
	private int qnum, deleted, replydeleted;
	private String qtitle, qwriter, qcontent, qdate, qreply;
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQwriter() {
		return qwriter;
	}
	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQdate() {
		return qdate;
	}
	public void setQdate(String qdate) {
		this.qdate = qdate;
	}
	public String getQreply() {
		return qreply;
	}
	public void setQreply(String qreply) {
		this.qreply = qreply;
	}
	public int getReplydeleted() {
		return replydeleted;
	}
	public void setReplydeleted(int replydeleted) {
		this.replydeleted = replydeleted;
	}
}
