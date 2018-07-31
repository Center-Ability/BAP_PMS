package com.bap.persistence;

import java.util.List;

import com.bap.domain.MemVO;

public interface MemDAO {

	public void create(MemVO vo) throws Exception;
	
	public MemVO read(String mem_id) throws Exception;
	
	public void update(MemVO vo) throws Exception;
	
	public void delete(String mem_id) throws Exception;
	
	public String searchNameById(String mem_id) throws Exception;
	
	public List<MemVO> listAll() throws Exception;
	
	public List<MemVO> noGroupMember() throws Exception;
	
	public List<MemVO> myTeamList(int pro_num) throws Exception;
	
}
