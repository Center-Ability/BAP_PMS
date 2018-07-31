package com.bap.domain;

import java.text.SimpleDateFormat;

public class UserListRequest {
	
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_bir;
	private String mem_addr;
	private String mem_zipcode;
	private String mem_rank;
	private String mem_hp;
	private String mem_mail;	
	private String mem_img;
	private String auth;
	
	
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_bir() {
		return mem_bir;
	}
	public void setMem_bir(String mem_bir) {
		this.mem_bir = mem_bir;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public String getMem_rank() {
		return mem_rank;
	}
	public void setMem_rank(String mem_rank) {
		this.mem_rank = mem_rank;
	}
	public String getMem_hp() {
		return mem_hp;
	}
	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}
	public String getMem_mail() {
		return mem_mail;
	}
	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}	
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
	
	
	
	
	@Override
	public String toString() {
		return "UserListRequest [mem_id=" + mem_id + ", mem_pass=" + mem_pass + ", mem_name=" + mem_name + ", mem_bir="
				+ mem_bir + ", mem_addr=" + mem_addr + ", mem_zipcode=" + mem_zipcode + ", mem_rank=" + mem_rank
				+ ", mem_hp=" + mem_hp + ", mem_mail=" + mem_mail + ", mem_img=" + mem_img + ", auth=" + auth + "]";
	}
	
	public UserListVO toUserListVO() {
		UserListVO userListVO=new UserListVO();
		
		userListVO.setMem_addr(mem_addr);
		try {
			userListVO.setMem_bir(new SimpleDateFormat("yyyy-MM-dd").parse(mem_bir));				
		} catch (Exception e) {			
			e.printStackTrace();
		}
		userListVO.setMem_id(mem_id);
		userListVO.setMem_img(mem_img);
		userListVO.setMem_mail(mem_mail);
		userListVO.setMem_name(mem_name);
		userListVO.setMem_pass(mem_pass);
		userListVO.setMem_hp(mem_hp);
		userListVO.setMem_rank(mem_rank);
		userListVO.setMem_zipcode(mem_zipcode);
		userListVO.setAuth(auth);
		
		return userListVO;
	}
	

}
