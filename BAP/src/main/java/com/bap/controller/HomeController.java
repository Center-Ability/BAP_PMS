package com.bap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bap.domain.UserListVO;
import com.bap.dto.NoticeDTO;
import com.bap.service.NoticeService;
import com.bap.service.UserListService;

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private NoticeService noticeService;
	

	@Autowired
	private UserListService userlistService; 
	
	

	@RequestMapping(value = "/pm", method = RequestMethod.GET)
	public String pmIndex(Model model, NoticeDTO vo) throws Exception {
		
		List<NoticeDTO> noticeList = noticeService.listAll(vo);
		
		model.addAttribute("noticeList", noticeList);
		
		return "home/pmHome";
	}
	

	@RequestMapping(value = "/mem", method = RequestMethod.GET)
	public String memIndex(Model model, NoticeDTO vo) throws Exception {
		
		List<NoticeDTO> noticeList = noticeService.listAll(vo);
		
		model.addAttribute("noticeList", noticeList);

		
		return "home/memHome";
	}
	
	@RequestMapping(value = "/manager", method = RequestMethod.GET)
	public String managerIndex(Model model, NoticeDTO vo) throws Exception {
		
		List<NoticeDTO> noticeList = noticeService.listAll(vo);
		List<UserListVO> userList = userlistService.listAll();

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("userList", userList);

		return "home/manaHome";
	}
	
	
	@RequestMapping(value = "/qm", method = RequestMethod.GET)
	public String qmIndex(Model model, NoticeDTO vo) throws Exception {
		
		List<NoticeDTO> noticeList = noticeService.listAll(vo);
		
		model.addAttribute("noticeList", noticeList);
		
		return "home/qmHome";
	}
		
	

}