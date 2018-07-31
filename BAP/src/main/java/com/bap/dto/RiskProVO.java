package com.bap.dto;

public class RiskProVO {

	private int pro_num;
	private String pro_name;
	private String mem_id;
	
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	
	public String getMem_id() {
		return mem_id ;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	@Override
	public String toString() {
		return "RiskProVO [pro_num=" + pro_num + ", pro_name=" + pro_name + ", mem_id=" + mem_id + "]";
	}
	
	
}
