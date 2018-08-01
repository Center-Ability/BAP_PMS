package com.bap.persistence;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bap.domain.ProVO;
import com.bap.dto.GroupInfoDTO;

@Repository
public class ProDAOImpl implements ProDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	private static String namespace = "com.bap.mappers.pro-Mapper";

	@Override
	public int create(ProVO proVO) throws SQLException {
		session.insert(namespace + ".create", proVO);
		return (int)session.selectOne(namespace + ".searchLatestPro_num");
	}

	@Override
	public ProVO readProjectOne(int pro_num) throws SQLException {
		return (ProVO)session.selectOne(namespace + ".readProjectOne", pro_num);
	}

	@Override
	public int searchPro_numById(String mem_id) throws SQLException {
		return (int)session.selectOne(namespace + ".searchPro_numById", mem_id);
	}

	@Override
	public String searchMem_nameById(String mem_id) throws SQLException {
		return (String)session.selectOne(namespace + ".searchMem_nameById", mem_id);
	}

	@Override
	public List<GroupInfoDTO> searchGroupInfoByPro_num(int pro_num) throws Exception {
		return (List<GroupInfoDTO>)session.selectList(namespace + ".searchGroupInfoByPro_num", pro_num);
	}

	@Override
	public List<ProVO> searchProInfoByStatus(ProVO proVO) throws Exception {
		return (List<ProVO>)session.selectList(namespace + ".searchProInfoByStatus", proVO);
	}

}
