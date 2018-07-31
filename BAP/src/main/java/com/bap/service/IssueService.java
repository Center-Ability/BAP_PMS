package com.bap.service;

import java.util.List;

import com.bap.domain.SearchCriteria;
import com.bap.dto.IssueDTO;
import com.bap.dto.RiskDTO;
import com.bap.dto.RiskProVO;

public interface IssueService {

	public List<IssueDTO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public IssueDTO detail(Integer issue_no) throws Exception;
	
	public void modify(IssueDTO board) throws Exception;
	
	public void remove(Integer issue_no) throws Exception;
	
	public void regist(IssueDTO board) throws Exception;
	
	public List<IssueDTO> listAll(IssueDTO vo) throws Exception;
	
	public List<RiskProVO> listPro(RiskProVO vo) throws Exception;

//	public List<NoticeVO> listAll() throws Exception;
//	
//	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
//	
//	public int listCountCriteria(Criteria cri) throws Exception;

}
