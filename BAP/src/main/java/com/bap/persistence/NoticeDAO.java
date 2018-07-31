package com.bap.persistence;

import java.util.List;

import com.bap.domain.Criteria;
import com.bap.domain.NoticeVO;
import com.bap.domain.SearchCriteria;
import com.bap.dto.NoticeDTO;

public interface NoticeDAO {
	
	public List<NoticeDTO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public NoticeDTO detail(int notice_no) throws Exception;
	
	public void modify(NoticeVO vo) throws Exception;
	
	public void remove(int notice_no) throws Exception;
	
	public void regist(NoticeVO vo) throws Exception;

	List<NoticeDTO> listAll(NoticeDTO vo) throws Exception;
	
//	
//	
//	
//	
//	public List<NoticeVO> listAll() throws Exception;
//	
//	public List<NoticeVO> listPage(int page) throws Exception;
//
//	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
//	
//	public int countPaging(Criteria cri) throws Exception;
//	
//	
//	


}
