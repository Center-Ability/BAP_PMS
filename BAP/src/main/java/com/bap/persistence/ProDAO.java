package com.bap.persistence;

import java.sql.SQLException;
import java.util.List;

import com.bap.domain.ProVO;
import com.bap.dto.GroupInfoDTO;

public interface ProDAO {
	
	public int create(ProVO proVO) throws SQLException;
	
	public ProVO readProjectOne(int pro_num) throws SQLException;
	
	public int searchPro_numById(String mem_id) throws SQLException;
	
	public String searchMem_nameById(String mem_id) throws SQLException;
	
	public List<GroupInfoDTO> searchGroupInfoByPro_num(int pro_num) throws Exception;
	
	public List<ProVO> searchProInfoByStatus(ProVO proVO) throws Exception;
}
