package com.bap.controller;

import java.util.List;

import com.bap.domain.MemVO;

public class NoGroupList {
	
	private List<MemVO> noGroupList;
	private List<MemVO> myTeamList;
	
	public List<MemVO> getNoGroupList() {
		return noGroupList;
	}
	public void setNoGroupList(List<MemVO> noGroupList) {
		this.noGroupList = noGroupList;
	}
	public List<MemVO> getMyTeamList() {
		return myTeamList;
	}
	public void setMyTeamList(List<MemVO> myTeamList) {
		this.myTeamList = myTeamList;
	}
	
	@Override
	public String toString() {
		return "NoGroupList [noGroupList=" + noGroupList + ", myTeamList=" + myTeamList + "]";
	}

}
