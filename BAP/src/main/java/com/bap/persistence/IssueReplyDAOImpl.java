package com.bap.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bap.domain.IssueReplyVO;
import com.bap.domain.RiskReplyVO;

@Repository
public class IssueReplyDAOImpl implements IssueReplyDAO {

	private static final String namespace = "com.bap.mappers.issuereply-Mapper";

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<IssueReplyVO> list(int issue_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list",issue_no);
	}

	@Override
	public void commentInsert(IssueReplyVO vo) throws Exception {
		 session.insert(namespace+".create", vo);
	}

	@Override
	public void commentUpdate(IssueReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update", vo);
	}

	@Override
	public void commentDelete(int issue_reply_no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", issue_reply_no);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return (int) session.selectOne(namespace+".count");
	}

	
	
	
//
//	private static final String namespace = "com.bap.mappers.riskreply-Mapper";
//
//	@Override
//	public List<RiskReplyVO> list(int risk_no) throws Exception {
//		
//		return session.selectList(namespace+".list", risk_no);
//	}
//
//	@Override
//	public void create(RiskReplyVO vo) throws Exception {
//		session.insert(namespace+".create", vo);
//
//	}
//
//	@Override
//	public void update(RiskReplyVO vo) throws Exception {
//		session.update(namespace+"update", vo);
//
//	}
//
//	@Override
//	public void delete(int risk_reply_no) throws Exception {
//		session.delete(namespace+".delete", risk_reply_no);
//
//	}
//
//	
//
//	@Override
//	public int count(int risk_no) throws Exception {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
