package com.bap.persistence;

import java.sql.SQLException;
import java.util.List;

import com.bap.domain.SnsVO;
import com.bap.dto.SnsDTO;

public interface SnsDAO {

	public void create(SnsVO vo) throws SQLException;
	
	public List<SnsDTO> listAll(int pro_num) throws SQLException;
	
	public int search_pro_num(String mem_id) throws SQLException;
	
	public void delete(int sns_no) throws SQLException;
	
}
