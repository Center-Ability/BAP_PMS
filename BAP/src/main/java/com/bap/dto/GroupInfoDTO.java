package com.bap.dto;

public class GroupInfoDTO {

	private String mem_id;
	private String mem_name;
	private String mem_rank;
	
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
	public String getMem_rank() {
		return mem_rank;
	}
	public void setMem_rank(String mem_rank) {
		this.mem_rank = mem_rank;
	}
	
	@Override
	public String toString() {
		return "GroupInfoDTO [mem_id=" + mem_id + ", mem_name=" + mem_name + ", mem_rank=" + mem_rank + "]";
	}
	
}
