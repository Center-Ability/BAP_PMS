package com.bap.service;

import java.util.List;

import javax.inject.Inject;

import com.bap.domain.SearchCriteria;
import com.bap.dto.RiskDTO;
import com.bap.dto.RiskProVO;
import com.bap.persistence.RiskDAO;

public class RiskServiceImpl implements RiskService{
	
	@Inject
	private RiskDAO riskDAO;
	
	public void setRiskDAO(RiskDAO riskDAO) {
		this.riskDAO = riskDAO;
	}
	
	@Override
	public List<RiskDTO> listSearch(SearchCriteria cri) throws Exception {
		return riskDAO.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return riskDAO.listSearchCount(cri);
	}
	
	@Override
	public RiskDTO detail(Integer risk_no) throws Exception {
		return riskDAO.detail(risk_no);
		
	}

	@Override
	public void modify(RiskDTO board) throws Exception {
		riskDAO.modify(board);
		
	}
	
	@Override
	public void remove(Integer notice_no) throws Exception {
		riskDAO.remove(notice_no);
		
	}
	
	@Override
	public void regist(RiskDTO board) throws Exception {
		riskDAO.regist(board);
	}
	
	@Override
	public List<RiskDTO> listAll(RiskDTO vo) throws Exception {
		return riskDAO.listAll(vo);
	}
	
	
	
	@Override
	public List<RiskProVO> listPro(RiskProVO vo) throws Exception {
		// TODO Auto-generated method stub
		return riskDAO.listPro(vo);
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
