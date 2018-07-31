package com.bap.persistence;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.bap.domain.SearchCriteria;
import com.bap.domain.UserListVO;


public class UserListDAOImpl implements UserListDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession session) {
		this.sqlSession = session;
	}

	private static String namespace = "BAP";

	@Override
	public void create(UserListVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".create", vo);

	}

	@Override
	public UserListVO read(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return (UserListVO) sqlSession.selectOne(namespace + ".read", mem_id);
	}

	@Override
	public void update(UserListVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespace + ".update", vo);
	
	}

	@Override
	public List<UserListVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		
		 int offset = (0 - 1) * 10;
		 int limit = 10;
		
		 RowBounds rowbounds = new RowBounds(offset, limit);
		
		 return sqlSession.selectList(namespace + ".listAll",null, rowbounds);
	 
		
	}

	@Override
	public int check_id(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return (int) sqlSession.selectOne(namespace + ".check_id", mem_id);
	}

	@Override
	public List<UserListVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		
		int offset = (cri.getPage() - 1) * 10;
		int limit = 10;
		
		RowBounds rowbounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList(namespace + ".listSearch", cri, rowbounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return (int) sqlSession.selectOne(namespace + ".listSearchCount", cri);
	}

	

	

	

}
