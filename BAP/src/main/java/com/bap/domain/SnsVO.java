package com.bap.domain;

import java.util.Date;

public class SnsVO {

	private int sns_no;
	private String mem_id;
	private Date sns_date;
	private String sns_content;
	private int pro_num;
	
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getSns_date() {
		return sns_date;
	}
	public void setSns_date(Date sns_date) {
		this.sns_date = sns_date;
	}
	public String getSns_content() {
		return sns_content;
	}
	public void setSns_content(String sns_content) {
		this.sns_content = sns_content;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	
	@Override
	public String toString() {
		return "SnsVO [sns_no=" + sns_no + ", mem_id=" + mem_id + ", sns_date=" + sns_date + ", sns_content="
				+ sns_content + ", pro_num=" + pro_num + "]";
	}
	
}
