package com.bap.service;

import java.util.List;

import com.bap.domain.MemVO;

public interface GroupService {
	
	public List<MemVO> noGroupMember() throws Exception;
	
	public List<MemVO> myTeamList(int pro_num) throws Exception;
	
	public void groupSave(String modifyData, int pro_num) throws Exception;
	
}
