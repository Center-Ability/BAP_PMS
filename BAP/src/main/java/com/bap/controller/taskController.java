package com.bap.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bap.domain.NoticeVO;
import com.bap.domain.Criteria;
import com.bap.domain.PageMaker;
import com.bap.domain.SearchCriteria;
import com.bap.service.NoticeService;
import com.bap.service.RiskService;

@Controller
@RequestMapping("/task")
public class taskController {

	private static final Logger logger = LoggerFactory.getLogger(taskController.class);

	@Autowired
	private RiskService service;

	// notice 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		model.addAttribute("riskDTO", service.listSearch(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		
	}

//	// 리스트 상세 페이지 ( 상세페이지 종료 후 이전에 보던 페이지로 가는 처리 안되어있음 )
//	@RequestMapping(value = "/detail", method = RequestMethod.GET)
//	public void read(@RequestParam("risk_no") int risk_no, @ModelAttribute("cri") SearchCriteria cri, Model model)
//			throws Exception {
//
//		model.addAttribute(service.detail(risk_no));
//	}
//
//	// 수정페이지 보여주기
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public void modifyGET(int notice_no, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
//
//		model.addAttribute(service.detail(notice_no));
//	}
//
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String modifyPOST(NoticeVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
//		
//		service.modify(board);
//		
//		rttr.addAttribute("page", cri.getPage());
//		rttr.addAttribute("perPageNum", cri.getPerPageNum());
//		rttr.addAttribute("searchType", cri.getSearchType());
//		rttr.addAttribute("keyword",cri.getKeyword());
//		rttr.addFlashAttribute("msg", "SUCCESS");
//		
//		return "redirect:/notice/list";
//	}
//
//	// 게시글 삭제 후 리스트로 이동
//	@RequestMapping(value = "/remove", method = RequestMethod.POST)
//	public String remove(@RequestParam("notice_no") int notice_no, SearchCriteria cri, RedirectAttributes rttr)
//			throws Exception {
//
//		service.remove(notice_no);
//
//		rttr.addAttribute("page", cri.getPage());
//		rttr.addAttribute("perPageNum", cri.getPerPageNum());
//		rttr.addFlashAttribute("msg", "SUCCESS");
//
//		return "redirect:/notice/list";
//	}
//	
//	// 신규 공지글 작성
//	@RequestMapping(value = "/regist", method = RequestMethod.GET)
//	public void registerGET(NoticeVO board, Model model) throws Exception {
//	}
//	
//	// 신규 공지글 등록 후 리스트로 이동
//	@RequestMapping(value = "/regist", method = RequestMethod.POST)
//	public String regist(NoticeVO board, RedirectAttributes rttr) throws Exception {
//		
//		service.regist(board);
//		
//		rttr.addFlashAttribute("msg", "success");
//		return "redirect:/notice/list";
//	}

}
