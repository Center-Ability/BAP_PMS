package com.bap.controller;

import java.util.List;

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
	private GroupService service;

	@RequestMapping(value = "/groupView", method = RequestMethod.GET)	
	public NoGroupList noGroup(String mem_id) throws Exception {
		
		List<MemVO> noGroup = service.noGroupMember();
		List<MemVO> myTeamList = service.myTeamList(mem_id);
		NoGroupList GroupList = new NoGroupList();
		GroupList.setNoGroupList(noGroup);
		GroupList.setMyTeamList(myTeamList);
		
		return GroupList;
	}
	
	@RequestMapping(value = "/groupSave", method = RequestMethod.POST,
			produces = "application/text; charset=utf8")
	public String groupSave(String modifyData, String mem_id) throws Exception {
		System.out.println(mem_id);
		System.out.println(modifyData);
		service.groupSave(modifyData, mem_id);
		
		return "저장되었습니다.";
	}
}