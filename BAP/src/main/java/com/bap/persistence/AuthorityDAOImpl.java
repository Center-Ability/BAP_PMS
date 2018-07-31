package com.bap.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bap.domain.AuthorityVO;

public class AuthorityDAOImpl implements AuthorityDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession session) {
		this.sqlSession = session;
	}

	private static String namespace = "BAP";

	@Override
	public void createAuth(AuthorityVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".createAuth", vo);

	}

	@Override
	public void updateAuth(AuthorityVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + ".updateAuth", vo);
	}

	@Override
	public AuthorityVO readAuth(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return (AuthorityVO)sqlSession.selectOne(namespace + ".readAuth",mem_id);
	}

	
	

}
