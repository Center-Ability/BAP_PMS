package com.bap.service;

import java.util.List;

import javax.annotation.Resource;

import com.bap.domain.RiskReplyVO;
import com.bap.persistence.RiskReplyDAO;



public class RiskReplyServiceImpl implements RiskReplyService {

	@Resource(name="com.bap.persistence.RiskReplyDAO")
	private RiskReplyDAO dao;
	
	public void setDAO(RiskReplyDAO riskreplyDAO) {
		this.dao = riskreplyDAO;
	}
	
	@Override
	public void addReply(RiskReplyVO vo) throws Exception {
		dao.commentInsert(vo);
		
	}

	@Override
	public List<RiskReplyVO> listReply(int risk_no) throws Exception {
		return dao.list(risk_no);
	}

	@Override
	public void modifyReply(RiskReplyVO vo) throws Exception {
		dao.commentUpdate(vo);
		
	}

	@Override
	public void removeReply(int risk_reply_no) throws Exception {
		dao.commentDelete(risk_reply_no);
	}

	
}
