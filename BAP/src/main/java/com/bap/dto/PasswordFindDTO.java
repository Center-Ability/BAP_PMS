package com.bap.dto;

public class PasswordFindDTO {

	private String mem_id;
	private String mem_mail;

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_mail() {
		return mem_mail;
	}

	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}

	@Override
	public String toString() {
		return "FindRequest [mem_id=" + mem_id + ", mem_mail=" + mem_mail + "]";
	}

}
