package com.bap.service;

import java.util.List;

import com.bap.domain.ProVO;
import com.bap.dto.CreateProDTO;
import com.bap.dto.GroupInfoDTO;

public interface ProService {
	
	public int createPro(CreateProDTO createProDTO) throws Exception;
	
	public ProVO readProjectOne(int pro_num) throws Exception;
	
	public int searchPro_numById(String mem_id) throws Exception;
	
	public String searchMem_nameById(String mem_id) throws Exception;
	
	public List<GroupInfoDTO> searchGroupInfoByPro_num(int pro_num) throws Exception;
	
	public List<ProVO> searchProInfoByStatus(ProVO proVO) throws Exception;
	
}
