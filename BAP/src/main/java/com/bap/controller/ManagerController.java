package com.bap.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bap.domain.PageMaker;
import com.bap.domain.SearchCriteria;
import com.bap.domain.UserListModifyRequest;
import com.bap.domain.UserListRequest;
import com.bap.domain.UserListVO;
import com.bap.service.UserListService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Inject
	private UserListService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(UserListVO userlist,Model model) throws Exception{
		
		//logger.info("register get!!!!!!!!!!!!!!!");
		
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String registPOST(UserListRequest userlistReq,RedirectAttributes rttr) throws Exception {
		
		UserListVO userlist=userlistReq.toUserListVO();

		service.register(userlist);
		
		rttr.addAttribute("msg","SUCCESS");
		return "redirect:/manager/userlist";
	}
	
	@RequestMapping(value = "/userlist", method = RequestMethod.GET)
	public void userlist(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		//logger.info("userlist!!!!!!!!!!!");
		model.addAttribute("list",service.listSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("mem_id") String mem_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		model.addAttribute(service.read(mem_id)); 
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(String mem_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		
		model.addAttribute(service.read(mem_id));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(UserListModifyRequest userlistMoReq, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		
		//System.out.println(userlistMoReq);
		
		UserListVO userlist=userlistMoReq.toUserListVO();
		
		//System.out.println(userlist);
		service.modify(userlist);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("msg","SUCCESS");
		
		return "redirect:/manager/userlist";
	}
	
	@RequestMapping(value = "/check_id", method = RequestMethod.POST)
	public void check_id(@RequestParam("mem_id") String mem_id, HttpServletResponse response)throws Exception{
		service.check_id(mem_id, response);
	}
	
	 	

	
	
	

}
