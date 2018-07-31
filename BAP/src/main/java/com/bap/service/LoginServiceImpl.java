package com.bap.service;

import com.bap.domain.MemVO;
import com.bap.persistence.MemDAO;

public class LoginServiceImpl implements LoginService {

	private MemDAO memDAO;
	
	public void setMemDAO(MemDAO memDAO) {
		this.memDAO = memDAO;
	}

	@Override
	public MemVO loginData(String mem_id) throws Exception {
		return memDAO.read(mem_id);
	}
	
}