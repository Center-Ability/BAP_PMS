package com.bap.service;

import java.util.List;

import javax.inject.Inject;

import com.bap.domain.SearchCriteria;
import com.bap.dto.IssueDTO;
import com.bap.dto.RiskDTO;
import com.bap.dto.RiskProVO;
import com.bap.persistence.IssueDAO;

public class IssueServiceImpl implements IssueService{
	
	@Inject
	private IssueDAO issueDAO;
	
	public void setRiskDAO(IssueDAO issueDAO) {
		this.issueDAO = issueDAO;
	}
	
	@Override
	public List<IssueDTO> listSearch(SearchCriteria cri) throws Exception {
		return issueDAO.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return issueDAO.listSearchCount(cri);
	}
	
	@Override
	public IssueDTO detail(Integer issue_no) throws Exception {
		return issueDAO.detail(issue_no);
		
	}

	@Override
	public void modify(IssueDTO board) throws Exception {
		issueDAO.modify(board);
		
	}
	
	@Override
	public void remove(Integer issue_no) throws Exception {
		issueDAO.remove(issue_no);
		
	}
	
	@Override
	public void regist(IssueDTO board) throws Exception {
		issueDAO.regist(board);
	}
	
	@Override
	public List<IssueDTO> listAll(IssueDTO vo) throws Exception {
		return issueDAO.listAll(vo);
	}
	
	
	
	@Override
	public List<RiskProVO> listPro(RiskProVO vo) throws Exception {
		// TODO Auto-generated method stub
		return issueDAO.listPro(vo);
	}
//
//
//
//	
//
//	@Override
//	public List<NoticeVO> listAll() throws Exception {
//		List<NoticeVO> list=dao.listAll();
//		return list;
//	}
//
//	@Override
//	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
//		return dao.listCriteria(cri);
//	}
//
//	
//	
//	@Override
//	public int listCountCriteria(Criteria cri) throws Exception {
//		return dao.countPaging(cri);
//	}
//
//	
//	
//	
//	

	

	

}
