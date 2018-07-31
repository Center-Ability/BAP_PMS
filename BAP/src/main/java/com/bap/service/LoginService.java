package com.bap.service;

import com.bap.domain.MemVO;

public interface LoginService {
	
	public MemVO loginData(String mem_id) throws Exception;
	
}
