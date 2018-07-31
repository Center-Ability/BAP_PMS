package com.bap.persistence;

import java.util.List;

import com.bap.domain.SearchCriteria;
import com.bap.domain.UserListVO;


public interface UserListDAO {
	
	
	//신입사원등록
	public void create(UserListVO vo)throws Exception;
	
	//사원상세보기
	public UserListVO read(String mem_id)throws Exception;
	
	
	
	//사원수정
	public void update(UserListVO vo)throws Exception;
	
	//사원 전체보기
	public List<UserListVO> listAll() throws Exception;
	
	//아이디 중복 검사
	public int check_id(String mem_id) throws Exception;
	
	//검색
	public List<UserListVO> listSearch(SearchCriteria cri) throws Exception;
	
	//검색list갯수
	public int listSearchCount(SearchCriteria cri) throws Exception;


	
	
	
	
	

}
