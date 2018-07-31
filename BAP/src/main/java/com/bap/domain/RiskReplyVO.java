package com.bap.domain;

import java.util.Date;

public class RiskReplyVO {

	private int risk_reply_no;
	private String mem_id;
	private String mem_name;
	private String risk_reply_content;
	private int risk_no;
	private Date risk_reply_date;
	
	public int getRisk_reply_no() {
		return risk_reply_no;
	}
	public void setRisk_reply_no(int risk_reply_no) {
		this.risk_reply_no = risk_reply_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	
	public String getRisk_reply_content() {
		return risk_reply_content;
	}
	public void setRisk_reply_content(String risk_reply_content) {
		this.risk_reply_content = risk_reply_content;
	}
	public int getRisk_no() {
		return risk_no;
	}
	public void setRisk_no(int risk_no) {
		this.risk_no = risk_no;
	}
	public Date getRisk_reply_date() {
		return risk_reply_date;
	}
	public void setRisk_reply_date(Date risk_reply_date) {
		this.risk_reply_date = risk_reply_date;
	}
	
	@Override
	public String toString() {
		return "RiskReplyVO [risk_reply_no=" + risk_reply_no + ", mem_id=" + mem_id + ", mem_name=" + mem_name
				+ ", risk_reply_content=" + risk_reply_content + ", risk_no=" + risk_no + ", risk_reply_date="
				+ risk_reply_date + "]";
	}
	
	
}
