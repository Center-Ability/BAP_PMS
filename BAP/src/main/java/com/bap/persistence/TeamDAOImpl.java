package com.bap.persistence;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.bap.domain.TeamVO;

public class TeamDAOImpl implements TeamDAO {

private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	private static String namespace = "com.bap.mappers.team-Mapper";
	
	@Override
	public void modify(String modifyData, int pro_num) throws SQLException {
		
		String str = modifyData.substring(0, modifyData.length()-1);
		str = str.replace("[관리자]","");
		str = str.replace("[품질관리팀]","");
		str = str.replace("[팀장]","");
		str = str.replace("[팀원]","");
		String[] array = str.split(",");
		
		
		TeamVO teamVO = new TeamVO();
		teamVO.setPro_num(pro_num);
		
		System.out.println(str);
		System.out.println(pro_num);
		
		session.delete(namespace + ".delete", pro_num);
		
		for(String name : array) {
			String id = (String)session.selectOne("com.bap.mappers.mem-Mapper.readIdByName", name);
			
			teamVO.setMem_id(id);
			session.insert(namespace + ".create", teamVO);
		}

	}

	@Override
	public void addTeamCreator(TeamVO teamVO) throws SQLException {
		session.insert(namespace + ".addTeamCreator", teamVO);
	}

}