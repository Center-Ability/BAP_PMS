package com.bap.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.bap.domain.AuthorityVO;
import com.bap.domain.SearchCriteria;
import com.bap.domain.UserListVO;

import com.bap.persistence.AuthorityDAO;
import com.bap.persistence.UserListDAO;



public class UserListServiceImpl implements UserListService{
	

	private UserListDAO userListDao;
	private AuthorityDAO authDao;
	
	

	public void setUserListDAO(UserListDAO userListDao) {
		this.userListDao = userListDao;
	}

	public void setAuthDao(AuthorityDAO authDao) {
		this.authDao = authDao;
	}

	@Override
	public void register(UserListVO user) throws Exception {
		// TODO Auto-generated method stub
		
		userListDao.create(user);
		
		
		
		AuthorityVO auth= new AuthorityVO();	
		auth.setAuth(user.getAuth());
		auth.setMem_id(user.getMem_id());		
		authDao.createAuth(auth);
		
	}

	@Override
	public UserListVO read(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		
		return userListDao.read(mem_id);
		
	}

	@Override
	public void modify(UserListVO user) throws Exception {
		// TODO Auto-generated method stub
		userListDao.update(user);
		
		AuthorityVO auth = new AuthorityVO();
		auth.setAuth(user.getAuth());
		auth.setMem_id(user.getMem_id());
		authDao.updateAuth(auth);
		
	}

	@Override
	public List<UserListVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		
		return userListDao.listAll();
	}

	@Override
	public void check_id(String mem_id, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println(userListDao.check_id(mem_id));
		out.close();
	}

	@Override
	public List<UserListVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return userListDao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return userListDao.listSearchCount(cri);
	}

	
	
	



}
