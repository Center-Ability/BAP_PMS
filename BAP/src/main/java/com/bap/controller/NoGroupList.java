package com.bap.controller;

import java.util.List;

import com.bap.domain.MemVO;

public class NoGroupList {
	
	private List<MemVO> noGroupList;

	public List<MemVO> getNoGroupList() {
		return noGroupList;
	}

	public void setNoGroupList(List<MemVO> noGroupList) {
		this.noGroupList = noGroupList;
	}

	@Override
	public String toString() {
		return "NoGroupList [noGroupList=" + noGroupList + "]";
	}
	
	
	
}
