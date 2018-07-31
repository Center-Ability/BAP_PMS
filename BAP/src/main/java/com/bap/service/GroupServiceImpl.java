package com.bap.service;

import java.util.List;

import com.bap.domain.MemVO;
import com.bap.persistence.MemDAO;
import com.bap.persistence.SnsDAO;
import com.bap.persistence.TeamDAO;

public class GroupServiceImpl implements GroupService {

	private MemDAO memDAO;
	private SnsDAO snsDAO;
	private TeamDAO teamDAO;
	
	public void setMemDAO(MemDAO memDAO) {
		this.memDAO = memDAO;
	}
	
	public void setSnsDAO(SnsDAO snsDAO) {
		this.snsDAO = snsDAO;
	}
	
	public void setTeamDAO(TeamDAO teamDAO) {
		this.teamDAO = teamDAO;
	}
	
	@Override
	public List<MemVO> noGroupMember() throws Exception {
		return memDAO.noGroupMember();
	}

	@Override
	public List<MemVO> myTeamList(String mem_id) throws Exception {
		int pro_num = snsDAO.search_pro_num(mem_id);
		System.out.println(pro_num);
		return memDAO.myTeamList(pro_num);
	}

	@Override
	public void groupSave(String modifyData, String mem_id) throws Exception {
		teamDAO.modify(modifyData, mem_id);
	}

}
