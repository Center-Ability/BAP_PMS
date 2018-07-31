package com.bap.service;

import java.util.List;

import com.bap.domain.SearchCriteria;
import com.bap.dto.RiskDTO;
import com.bap.dto.RiskProVO;

public interface RiskService {

	public List<RiskDTO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public RiskDTO detail(Integer risk_no) throws Exception;
	
	public void modify(RiskDTO board) throws Exception;
	
	public void remove(Integer risk_no) throws Exception;
	
	public void regist(RiskDTO board) throws Exception;
	
	public List<RiskDTO> listAll(RiskDTO vo) throws Exception;
	
	public List<RiskProVO> listPro(RiskProVO vo) throws Exception;

//	public List<NoticeVO> listAll() throws Exception;
//	
//	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
//	
//	public int listCountCriteria(Criteria cri) throws Exception;

}
