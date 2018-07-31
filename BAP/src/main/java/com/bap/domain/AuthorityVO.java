package com.bap.domain;

public class AuthorityVO {
	
	private String mem_id;
	private String auth;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	@Override
	public String toString() {
		return "AuthorityVO [mem_id=" + mem_id + ", auth=" + auth + "]";
	}
	
	
	
	

}
