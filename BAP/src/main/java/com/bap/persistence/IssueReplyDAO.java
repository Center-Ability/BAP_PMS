package com.bap.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bap.domain.IssueReplyVO;
import com.bap.domain.RiskReplyVO;

@Repository("com.bap.persistance.iCommentMapper")
public interface IssueReplyDAO {

	
	public List<IssueReplyVO> list(int issue_no) throws Exception;
	
    public void commentInsert(IssueReplyVO vo) throws Exception;
	
	public void commentUpdate(IssueReplyVO vo) throws Exception;
	
	public void commentDelete(int issue_reply_no) throws Exception;
	
	public int count() throws Exception;

	
	
	
	    
		
	
	
	
	
	
	
//	public List<RiskReplyVO> list(int risk_no) throws Exception;
//	
//	public void create(RiskReplyVO vo) throws Exception;
//	
//	public void update(RiskReplyVO vo) throws Exception;
//	
//	public void delete(int risk_reply_no) throws Exception;
//	
//	public int count(int risk_no) throws Exception;

}
