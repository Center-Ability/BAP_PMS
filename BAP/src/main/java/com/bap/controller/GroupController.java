package com.bap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bap.service.GroupService;

@RestController
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService service;

	@RequestMapping(value = "/noGroup", method = RequestMethod.GET)	
	public NoGroupList noGroup(Model model) throws Exception {
		
		NoGroupList noGroupList=new NoGroupList();
		noGroupList.setNoGroupList(service.noGroupMember());
				
		return noGroupList;
	}
	
}
