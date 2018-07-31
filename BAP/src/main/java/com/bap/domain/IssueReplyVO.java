package com.bap.domain;

import java.util.Date;

public class IssueReplyVO {

	private int issue_reply_no;
	private String mem_id;
	private String mem_name;

	

	private String issue_reply_content;
	private int issue_no;
	private Date issue_reply_date;

	public int getIssue_reply_no() {
		return issue_reply_no;
	}

	public void setIssue_reply_no(int issue_reply_no) {
		this.issue_reply_no = issue_reply_no;
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
	
	public String getIssue_reply_content() {
		return issue_reply_content;
	}

	public void setIssue_reply_content(String issue_reply_content) {
		this.issue_reply_content = issue_reply_content;
	}

	public int getIssue_no() {
		return issue_no;
	}

	public void setIssue_no(int issue_no) {
		this.issue_no = issue_no;
	}

	public Date getIssue_reply_date() {
		return issue_reply_date;
	}

	public void setIssue_reply_date(Date issue_reply_date) {
		this.issue_reply_date = issue_reply_date;
	}

	@Override
	public String toString() {
		return "IssueReplyVO [issue_reply_no=" + issue_reply_no + ", mem_id=" + mem_id + ", mem_name=" + mem_name
				+ ", issue_reply_content=" + issue_reply_content + ", issue_no=" + issue_no + ", issue_reply_date="
				+ issue_reply_date + "]";
	}

}
