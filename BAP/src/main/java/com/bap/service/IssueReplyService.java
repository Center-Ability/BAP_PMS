package com.bap.service;

import java.util.List;

import com.bap.domain.IssueReplyVO;
import com.bap.domain.RiskReplyVO;

public interface IssueReplyService {
	
	public void addReply(IssueReplyVO vo) throws Exception;
	
	public List<IssueReplyVO> listReply(int issue_no) throws Exception;
	
	public void modifyReply(IssueReplyVO vo) throws Exception;
	
	public void removeReply(int issue_reply_no) throws Exception;

}
