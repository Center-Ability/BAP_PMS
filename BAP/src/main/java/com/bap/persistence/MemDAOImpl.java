package com.bap.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bap.domain.MemVO;

@Repository
public class MemDAOImpl implements MemDAO {

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	private static String namespace = "com.bap.mappers.mem-Mapper";
	
	
	@Override
	public void create(MemVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public MemVO read(String mem_id) throws Exception {
		return (MemVO)session.selectOne(namespace + ".read", mem_id);
	}

	@Override
	public void update(MemVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(String mem_id) throws Exception {
		session.delete(namespace + ".delete", mem_id);
	}
	
	@Override
	public String searchNameById(String mem_id) throws Exception {
		return (String)session.selectOne(namespace + ".searchNameById", mem_id);
	}

	@Override
	public List<MemVO> listAll() throws Exception {
		return (List<MemVO>)session.selectList(namespace + ".listAll");
	}

	@Override
	public List<MemVO> noGroupMember() throws Exception {
		return (List<MemVO>)session.selectList(namespace + ".noGroupMember");
	}

	@Override
	public List<MemVO> myTeamList(int pro_num) throws Exception {
		return (List<MemVO>)session.selectList(namespace + ".myTeamList", pro_num);
	}

}
