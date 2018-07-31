package com.bap.service;

import java.sql.SQLException;
import java.util.List;

import com.bap.dto.SnsDTO;

public interface SnsService {

	public void snsInsert(String mem_id, String sns_content) throws SQLException;
	
	public List<SnsDTO> snsSelectList(String mem_id) throws SQLException;
	
	public void snsDelete(int sns_no) throws SQLException;
	
}
