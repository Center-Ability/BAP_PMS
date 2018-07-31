package com.bap.service;

import java.util.List;

import com.bap.domain.MemVO;

public interface GroupService {
	
	public List<MemVO> noGroupMember() throws Exception;
	
	public List<MemVO> myTeamList(String mem_id) throws Exception;
	
	public void groupSave(String modifyData, String mem_id) throws Exception;
	
}
