package com.bap.persistence;

import java.util.List;

import com.bap.domain.SearchCriteria;
import com.bap.dto.RiskDTO;
import com.bap.dto.RiskProVO;

public interface RiskDAO {
	
	public List<RiskDTO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public RiskDTO detail(int risk_no) throws Exception;
	
	public void modify(RiskDTO vo) throws Exception;
	
	public void remove(int risk_no) throws Exception;
	
	public void regist(RiskDTO vo) throws Exception;

	List<RiskDTO> listAll(RiskDTO vo) throws Exception;
	
	public List<RiskProVO> listPro(RiskProVO vo) throws Exception;
	
//	
//	
//	
//	
//	public List<NoticeVO> listAll() throws Exception;
//	
//	public List<NoticeVO> listPage(int page) throws Exception;
//
//	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
//	
//	public int countPaging(Criteria cri) throws Exception;
//	
//	
//	


}
