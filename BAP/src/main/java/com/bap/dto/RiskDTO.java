package com.bap.dto;

import java.util.Date;

public class RiskDTO {
	
	private int risk_no;
	private String risk_title;
	private String mem_id;
	private String mem_name;
	private Date risk_date;
	private String risk_content;
	private int pro_num;
	private int risk_status;
	private String pro_name;
	
	
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getRisk_no() {
		return risk_no;
	}
	public void setRisk_no(int risk_no) {
		this.risk_no = risk_no;
	}
	public String getRisk_title() {
		return risk_title;
	}
	public void setRisk_title(String risk_title) {
		this.risk_title = risk_title;
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
	public Date getRisk_date() {
		return risk_date;
	}
	public void setRisk_date(Date risk_date) {
		this.risk_date = risk_date;
	}
	public String getRisk_content() {
		return risk_content;
	}
	public void setRisk_content(String risk_content) {
		this.risk_content = risk_content;
	}
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public int getRisk_status() {
		return risk_status;
	}
	public void setRisk_status(int risk_status) {
		this.risk_status = risk_status;
	}
	
	@Override
	public String toString() {
		return "RiskDTO [risk_no=" + risk_no + ", risk_title=" + risk_title + ", mem_id=" + mem_id + ", mem_name="
				+ mem_name + ", risk_date=" + risk_date + ", risk_content=" + risk_content + ", pro_num=" + pro_num
				+ ", risk_status=" + risk_status + ", pro_name=" + pro_name + "]";
	}
	
	
}
