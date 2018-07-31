package com.bap.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bap.domain.SnsVO;
import com.bap.dto.SnsDTO;

@Repository
public class SnsDAOImpl implements SnsDAO {

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	private static String namespace = "com.bap.mappers.sns-Mapper";
	
	@Override
	public void create(SnsVO vo) throws SQLException {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public List<SnsDTO> listAll(int pro_num) throws SQLException {
		return (List<SnsDTO>)session.selectList(namespace + ".listAll", pro_num);
	}

	@Override
	public int search_pro_num(String mem_id) throws SQLException {
		return (int)session.selectOne(namespace + ".search_pro_num", mem_id);
	}

	@Override
	public void delete(int sns_no) throws SQLException {
		session.delete(namespace + ".delete", sns_no);
	}

}
