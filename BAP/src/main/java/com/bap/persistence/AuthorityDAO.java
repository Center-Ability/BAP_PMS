package com.bap.persistence;

import java.util.List;

import com.bap.domain.AuthorityVO;




public interface AuthorityDAO {
	
	public void createAuth(AuthorityVO vo)throws Exception;
	
	public AuthorityVO readAuth(String mem_id)throws Exception;
	
	public void updateAuth(AuthorityVO vo)throws Exception;
	
	
	
	

}
