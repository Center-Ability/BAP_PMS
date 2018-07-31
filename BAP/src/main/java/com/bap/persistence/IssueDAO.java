package com.bap.persistence;

import java.util.List;

import com.bap.domain.SearchCriteria;
import com.bap.dto.IssueDTO;
import com.bap.dto.RiskDTO;
import com.bap.dto.RiskProVO;

public interface IssueDAO {
	
	public List<IssueDTO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public IssueDTO detail(int issue_no) throws Exception;
	
	public void modify(IssueDTO vo) throws Exception;
	
	public void remove(int issue_no) throws Exception;
	
	public void regist(IssueDTO vo) throws Exception;

	List<IssueDTO> listAll(IssueDTO vo) throws Exception;
	
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
