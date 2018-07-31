package com.bap.service;

import java.util.List;

import javax.annotation.Resource;

import com.bap.domain.IssueReplyVO;
import com.bap.domain.RiskReplyVO;
import com.bap.persistence.IssueReplyDAO;



public class IssueReplyServiceImpl implements IssueReplyService {

	@Resource(name="com.bap.persistence.IssueReplyDAO")
	private IssueReplyDAO dao;
	
	public void setDAO(IssueReplyDAO issuereplyDAO) {
		this.dao = issuereplyDAO;
	}
	
	@Override
	public void addReply(IssueReplyVO vo) throws Exception {
		dao.commentInsert(vo);
		
	}

	@Override
	public List<IssueReplyVO> listReply(int issue_no) throws Exception {
		return dao.list(issue_no);
	}

	@Override
	public void modifyReply(IssueReplyVO vo) throws Exception {
		dao.commentUpdate(vo);
		
	}

	@Override
	public void removeReply(int issue_reply_no) throws Exception {
		dao.commentDelete(issue_reply_no);
	}

	
}
