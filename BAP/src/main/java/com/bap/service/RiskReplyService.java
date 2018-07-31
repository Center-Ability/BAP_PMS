package com.bap.service;

import java.util.List;

import com.bap.domain.RiskReplyVO;

public interface RiskReplyService {
	
	public void addReply(RiskReplyVO vo) throws Exception;
	
	public List<RiskReplyVO> listReply(int risk_no) throws Exception;
	
	public void modifyReply(RiskReplyVO vo) throws Exception;
	
	public void removeReply(int risk_reply_no) throws Exception;

}
