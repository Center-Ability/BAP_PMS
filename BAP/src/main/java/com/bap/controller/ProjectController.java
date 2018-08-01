package com.bap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bap.domain.MemVO;
import com.bap.domain.ProVO;
import com.bap.domain.ProjectSearch;
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
		
		// 유저의 소속 프로젝트 번호 가져오기
		int pro_num = (int)session.getAttribute("nowProject");
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
	
	// 프로젝트 생성창 보여주기
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createGET() {
		return "/project/create";
	}
	
	// 프로젝트 생성하기
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPOST(CreateProDTO dto, HttpSession session) throws Exception {
		
		int pro_num = proService.createPro(dto);
		
		session.setAttribute("nowProject", pro_num);
		
		return "redirect:/project/detail";
	}
	
	// 프로젝트 상태에 따른 프로젝트들 반환하기
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public ProjectSearch search(String pro_status) throws Exception {
		
		// 받은 값을 int형으로 변환한다.
		int status = Integer.parseInt(pro_status);
		
		// ProVO의 pro_status를 세팅한다.
		ProVO proVO = new ProVO();
		proVO.setPro_status(status);
		
		//pro_status 값을 이용해서 프로젝트 정보를 가져온다.
		List<ProVO> infos = proService.searchProInfoByStatus(proVO);
		
		// ProjectSearch에 프로젝트 정보들을 세팅해주고 리턴한다.
		ProjectSearch projectSearch = new ProjectSearch();
		projectSearch.setProVO(infos);
		return projectSearch;
		
	}
	
	// 현재 선택된 프로젝트로 세션값 바꿔주기
	@RequestMapping(value = "/nowprochange", method = RequestMethod.GET)
	@ResponseBody
	public void nowProChange(int nowpro, HttpSession session) throws Exception {
		session.setAttribute("nowProject", nowpro);
	}
	
}
