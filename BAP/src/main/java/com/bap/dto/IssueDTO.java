package com.bap.dto;

import java.util.Date;

public class IssueDTO {
	
	private int issue_no;
	private String Issue_title;
	private String mem_id;
	private String mem_name;
	private Date issue_date;
	private String issue_content;
	private int pro_num;
	private int issue_status;
	private String pro_name;
	public int getIssue_no() {
		return issue_no;
	}
	public void setIssue_no(int issue_no) {
		this.issue_no = issue_no;
	}
	public String getIssue_title() {
		return Issue_title;
	}
	public void setIssue_title(String issue_title) {
		Issue_title = issue_title;
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
	public Date getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(Date issue_date) {
		this.issue_date = issue_date;
	}
	public String getIssue_content() {
		return issue_content;
	}
	public void setIssue_content(String issue_content) {
		this.issue_content = issue_content;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public int getIssue_status() {
		return issue_status;
	}
	public void setIssue_status(int issue_status) {
		this.issue_status = issue_status;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	
	@Override
	public String toString() {
		return "IssueDTO [issue_no=" + issue_no + ", Issue_title=" + Issue_title + ", mem_id=" + mem_id + ", mem_name="
				+ mem_name + ", issue_date=" + issue_date + ", issue_content=" + issue_content + ", pro_num=" + pro_num
				+ ", issue_status=" + issue_status + ", pro_name=" + pro_name + "]";
	}
	
	
	
	
}
