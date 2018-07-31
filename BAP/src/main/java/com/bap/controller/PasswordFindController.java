package com.bap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bap.domain.Email;
import com.bap.domain.MemVO;
import com.bap.dto.PasswordFindDTO;
import com.bap.service.EmailSender;
import com.bap.service.LoginService;

@Controller
@RequestMapping("/login")
public class PasswordFindController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private Email email;
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value = "/pwFind", method = RequestMethod.GET)
	public String pwFind() {
		return "/pwFind";
	}
	
	@RequestMapping(value = "/pwFind", method = RequestMethod.POST)
	public String sendEmailAction(PasswordFindDTO findReq, Model model) throws Exception {

		String id = findReq.getMem_id();
		String mail = findReq.getMem_mail();
		String view = "";
		
		MemVO memVO = loginService.loginData(id);
		System.out.println(memVO);

		if (memVO != null && memVO.getMem_mail().equals(mail)) {
			email.setContent("비밀번호는 " + memVO.getMem_pass() + " 입니다.");
			email.setReceiver(memVO.getMem_mail());
			email.setSubject(memVO.getMem_id() + "님 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email);
			
			model.addAttribute("msg","성공하셨습니다.");
			
			view = "redirect:/login";
		} else {
			model.addAttribute("msg", "아이디와 이메일을 확인해주세요.");
			model.addAttribute("id", id);
			model.addAttribute("mail", mail);
			view = "redirect:/login/pwFind";
		}

		return view;

	}

}
