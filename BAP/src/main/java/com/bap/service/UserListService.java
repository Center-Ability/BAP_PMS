package com.bap.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.bap.domain.SearchCriteria;
import com.bap.domain.UserListVO;


public interface UserListService {
	
	public void register(UserListVO userlist)throws Exception;
	
	public UserListVO read(String mem_id)throws Exception;
	
	public void modify(UserListVO userlist)throws Exception;
	
	public List<UserListVO> listAll() throws Exception;
	
	public void check_id(String mem_id, HttpServletResponse response) throws Exception;
	
	public List<UserListVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

	 

}
