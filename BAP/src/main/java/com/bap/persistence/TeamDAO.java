package com.bap.persistence;

import java.sql.SQLException;

import com.bap.domain.TeamVO;

public interface TeamDAO {
	
	public void modify(String modifyData, int pro_num) throws SQLException;
	
	public void addTeamCreator(TeamVO teamVO) throws SQLException;
	
}
