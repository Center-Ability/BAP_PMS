package com.bap.dto;

import java.util.Date;

public class SnsDTO {
	
	private int sns_no;
	private Date sns_date;
	private String mem_name;
	private String mem_rank;
	private String sns_content;
	
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public Date getSns_date() {
		return sns_date;
	}
	public void setSns_date(Date sns_date) {
		this.sns_date = sns_date;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_rank() {
		return mem_rank;
	}
	public void setMem_rank(String mem_rank) {
		this.mem_rank = mem_rank;
	}
	public String getSns_content() {
		return sns_content;
	}
	public void setSns_content(String sns_content) {
		this.sns_content = sns_content;
	}
	
	@Override
	public String toString() {
		return "SnsDTO [sns_no=" + sns_no + ", sns_date=" + sns_date + ", mem_name=" + mem_name + ", mem_rank="
				+ mem_rank + ", sns_content=" + sns_content + "]";
	}
	
	
	
}
