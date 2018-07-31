package com.bap.domain;

public class TeamVO {

	private int pro_num;
	private String mem_id;
	
	public int getPro_num() {
		return pro_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	@Override
	public String toString() {
		return "TeamVO [pro_num=" + pro_num + ", mem_id=" + mem_id + "]";
	}
	
}
