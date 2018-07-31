package com.bap.service;

import java.sql.SQLException;
import java.util.List;

import com.bap.domain.SnsVO;
import com.bap.dto.SnsDTO;
import com.bap.persistence.MemDAO;
import com.bap.persistence.SnsDAO;

public class SnsServiceImpl implements SnsService {

	private SnsDAO snsDAO;
	
	public void setSnsDAO(SnsDAO snsDAO) {
		this.snsDAO = snsDAO;
	}
	
	@Override
	public void snsInsert(String mem_id, String sns_content) throws SQLException {
		int pro_num = snsDAO.search_pro_num(mem_id);
		
		SnsVO vo = new SnsVO();
		vo.setMem_id(mem_id);
		vo.setPro_num(pro_num);
		vo.setSns_content(sns_content);
		
		snsDAO.create(vo);
	}

	@Override
	public List<SnsDTO> snsSelectList(String mem_id) throws SQLException {
		int pro_num = snsDAO.search_pro_num(mem_id);
		return snsDAO.listAll(pro_num);
	}

	@Override
	public void snsDelete(int sns_no) throws SQLException {
		snsDAO.delete(sns_no);
	}
}
