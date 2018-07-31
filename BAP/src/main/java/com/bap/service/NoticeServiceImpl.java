package com.bap.service;

import java.util.List;

import com.bap.domain.NoticeVO;
import com.bap.domain.SearchCriteria;
import com.bap.dto.NoticeDTO;
import com.bap.persistence.MemDAO;
import com.bap.persistence.NoticeDAO;

public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDAO noticeDAO;
	
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	@Override
	public List<NoticeDTO> listSearch(SearchCriteria cri) throws Exception {
		return noticeDAO.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return noticeDAO.listSearchCount(cri);
	}
	
	@Override
	public NoticeDTO detail(Integer notice_no) throws Exception {
		return noticeDAO.detail(notice_no);
		
	}

	@Override
	public void modify(NoticeVO board) throws Exception {
		noticeDAO.modify(board);
		
	}
	
	@Override
	public void remove(Integer notice_no) throws Exception {
		noticeDAO.remove(notice_no);
		
	}
	
	@Override
	public void regist(NoticeVO board) throws Exception {
		noticeDAO.regist(board);
	}
	
	@Override
	public List<NoticeDTO> listAll(NoticeDTO vo) throws Exception {
		return noticeDAO.listAll(vo);
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
