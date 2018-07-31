package com.bap.dto;

public class CreateProDTO {
	
	private String pro_num;
	private String pro_name;
	private String mem_id;
	private String pro_contents;
	private String pro_start;
	private String pro_end;
	private String pro_status;
	private String pro_per;
	
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPro_contents() {
		return pro_contents;
	}
	public void setPro_contents(String pro_contents) {
		this.pro_contents = pro_contents;
	}
	public String getPro_start() {
		return pro_start;
	}
	public void setPro_start(String pro_start) {
		this.pro_start = pro_start;
	}
	public String getPro_end() {
		return pro_end;
	}
	public void setPro_end(String pro_end) {
		this.pro_end = pro_end;
	}
	public String getPro_status() {
		return pro_status;
	}
	public void setPro_status(String pro_status) {
		this.pro_status = pro_status;
	}
	public String getPro_per() {
		return pro_per;
	}
	public void setPro_per(String pro_per) {
		this.pro_per = pro_per;
	}
	
	@Override
	public String toString() {
		return "CreateProDTO [pro_num=" + pro_num + ", pro_name=" + pro_name + ", mem_id=" + mem_id + ", pro_contents="
				+ pro_contents + ", pro_start=" + pro_start + ", pro_end=" + pro_end + ", pro_status=" + pro_status
				+ ", pro_per=" + pro_per + "]";
	}
	
}
