package com.bap.controller;

import java.util.List;

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

import com.bap.domain.SearchCriteria;
import com.bap.dto.NoticeDTO;
import com.bap.dto.RiskDTO;
import com.bap.dto.RiskProVO;
import com.bap.service.RiskService;

@Controller
@RequestMapping("/risk")
public class RiskController {

	private static final Logger logger = LoggerFactory.getLogger(RiskController.class);

	@Autowired
	private RiskService service;

	
	// 리스트 상세 페이지 ( 상세페이지 종료 후 이전에 보던 페이지로 가는 처리 안되어있음 )
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void read(@RequestParam("risk_no") int risk_no, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		model.addAttribute(service.detail(risk_no));
	}
//
	// 수정페이지 보여주기
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int risk_no, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		model.addAttribute(service.detail(risk_no));
	}
//
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(RiskDTO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/task/list";
	}
//
	// 게시글 삭제 후 리스트로 이동
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("risk_no") int risk_no, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.remove(risk_no);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/task/list";
	}
//	
	// 신규 공지글 작성
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public void registerGET(RiskDTO board, RiskProVO vo, Model model) throws Exception {
		
		
		 List<RiskProVO> List = service.listPro(vo);
		 
		 model.addAttribute("listPro", List);
		 System.out.println(List);
		 
	}
//	
	// 신규 공지글 등록 후 리스트로 이동
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registPOST(RiskDTO board, RedirectAttributes rttr) throws Exception {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!이거다!!!!!!!"+board);
		service.regist(board);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/task/list";
	}

}
