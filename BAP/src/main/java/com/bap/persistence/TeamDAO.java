package com.bap.persistence;

import java.sql.SQLException;

public interface TeamDAO {
	
	public void modify(String modifyData, String mem_id) throws SQLException;
	
}
