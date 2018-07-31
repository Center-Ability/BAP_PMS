package com.bap.domain;

import java.util.*;

public class NoticeVO {

	private int notice_no;
	private String notice_title;
	private String mem_id;
	private Date notice_date;
	private String notice_content;
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	@Override
	public String toString() {
		return "BoardVO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", mem_id=" + mem_id
				+ ", notice_date=" + notice_date + ", notice_content=" + notice_content + "]";
	}
	
	
	
}
