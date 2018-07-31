package com.bap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bap.domain.MemVO;
import com.bap.domain.ProVO;
import com.bap.dto.CreateProDTO;
import com.bap.dto.GroupInfoDTO;
import com.bap.service.ProService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	ProService proService;
	
	// 디테일 페이지 보여주기
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, HttpSession session) throws Exception {
		
		// 세션에서 로그인 유저 정보 가져오기
		MemVO memVO = (MemVO)session.getAttribute("loginUser");
		// 로그인한 유저가 소속되어 있는 프로젝트 번호 가져오기
		int pro_num = proService.searchPro_numById(memVO.getMem_id());
		// 프로젝트 정보 가져오기
		ProVO proVO = proService.readProjectOne(pro_num);
		// 해당 프로젝트 담당 PM ID로 이름 가져오기
		String mem_name = proService.searchMem_nameById(proVO.getMem_id());
		// 프로젝트 상태정보 변수에 대입하기
		int pro_status = proVO.getPro_status();
		
		// 상태정보에 따라 모델에 값 넣어주기
		if(pro_status == 0)
			model.addAttribute("pro_status_string", "대기");
		else if(pro_status == 1)
			model.addAttribute("pro_status_string", "진행");
		else
			model.addAttribute("pro_status_string", "완료");
		
		// 프로젝트 번호를 이용하여 그룹정보DTO 가져오기
		List<GroupInfoDTO> groupInfoDTO = proService.searchGroupInfoByPro_num(pro_num);
		
		// 담당PM 이름 모델에 넣어주기
		model.addAttribute("mem_name", mem_name);
		// 프로젝트 정보 모델에 넣어주기
		model.addAttribute(proVO);
		// 그룹정보 DTO 모델에 넣어주기
		model.addAttribute("groupInfo", groupInfoDTO);
		
		return "/project/detail";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createGET() {
		return "/project/create";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPOST(CreateProDTO dto) throws Exception {
		
		proService.createPro(dto);
		
		return "/project/detail";
	}
	
}
