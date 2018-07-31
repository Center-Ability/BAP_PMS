package com.bap.service;

import java.util.List;

import com.bap.domain.Criteria;
import com.bap.domain.NoticeVO;
import com.bap.domain.SearchCriteria;
import com.bap.dto.NoticeDTO;

public interface NoticeService {

	public List<NoticeDTO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public NoticeDTO detail(Integer notice_no) throws Exception;
	
	public void modify(NoticeVO board) throws Exception;
	
	public void remove(Integer notice_no) throws Exception;
	
	public void regist(NoticeVO board) throws Exception;
	
	public List<NoticeDTO> listAll(NoticeDTO vo) throws Exception;

//	public List<NoticeVO> listAll() throws Exception;
//	
//	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
//	
//	public int listCountCriteria(Criteria cri) throws Exception;

}
