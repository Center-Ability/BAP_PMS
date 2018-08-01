package com.bap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bap.domain.MemVO;
import com.bap.service.GroupService;

@RestController
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService groupService;

	@RequestMapping(value = "/groupView", method = RequestMethod.GET)	
	public NoGroupList Group(HttpSession session) throws Exception {
		
		// 그룹에 속해있지 않은 유저 목록 가져오기
		List<MemVO> noGroup = groupService.noGroupMember();
		
		// 현재 선택된 프로젝트 번호 가져오기
		int pro_num = (int)session.getAttribute("nowProject");
		
		// 프로젝트 번호에 속해있는 유저 목록 가져오기
		List<MemVO> myTeamList = groupService.myTeamList(pro_num);
		
		//패키징해서 리턴해주기
		NoGroupList GroupList = new NoGroupList();
		GroupList.setNoGroupList(noGroup);
		GroupList.setMyTeamList(myTeamList);
		return GroupList;
	}
	
	@RequestMapping(value = "/groupSave", method = RequestMethod.POST,
			produces = "application/text; charset=utf8")
	public String groupSave(String modifyData, HttpSession session) throws Exception {
		
		int pro_num = (int)session.getAttribute("nowProject");
		
		// 그룹 내용 저장하기
		groupService.groupSave(modifyData, pro_num);
		
		return "저장되었습니다.";
	}
}

