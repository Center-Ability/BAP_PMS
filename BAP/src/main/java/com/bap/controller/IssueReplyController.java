package com.bap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bap.domain.IssueReplyVO;
import com.bap.domain.RiskReplyVO;
import com.bap.service.IssueReplyService;



@Controller
@RequestMapping("/icomment")
public class IssueReplyController {
 
    @Autowired
    private IssueReplyService issuereplyService;
    
    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    private List<IssueReplyVO> riskreplyServiceList(int issue_no,Model model) throws Exception{
       
      
        return issuereplyService.listReply(issue_no);
    }
    
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private void riskreplyServiceInsert(int issue_no, String mem_id, String issue_reply_content) throws Exception{
        
    	IssueReplyVO comment = new IssueReplyVO();
        comment.setIssue_no(issue_no);;
        comment.setIssue_reply_content(issue_reply_content);;
        comment.setMem_id(mem_id); 
        
        System.out.println(comment);
        
        issuereplyService.addReply(comment);
        
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private void riskreplyServiceUpdateProc(@RequestParam int issue_reply_no, @RequestParam String issue_reply_content) throws Exception{
        
    	IssueReplyVO comment = new IssueReplyVO();
        comment.setIssue_reply_no(issue_reply_no);
        comment.setIssue_reply_content(issue_reply_content);
        
        issuereplyService.modifyReply(comment);
    }
    
    @RequestMapping("/delete/{issue_reply_no}") //댓글 삭제  
    @ResponseBody
    private void riskreplyServiceDelete(@PathVariable int issue_reply_no) throws Exception{
        
    	issuereplyService.removeReply(issue_reply_no);
    }
    
}








//@RestController
//@RequestMapping("/riskreply")
//public class RiskReplyController {
//
//	@Inject
//	private RiskReplyService service;
//	
//	@RequestMapping(value="",method =RequestMethod.POST)
//	public ResponseEntity<String> register(@RequestBody RiskReplyVO vo){
//		
//		ResponseEntity<String> entity = null;
//		try {
//			service.addReply(vo);
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
//	
//	@RequestMapping(value="/all/{risk_no}",method =RequestMethod.GET)
//	public ResponseEntity<List<RiskReplyVO>> list(
//			@PathVariable("risk_no") Integer risk_no){
//		
//		ResponseEntity<List<RiskReplyVO>> entity = null;
//		try {
//			entity = new ResponseEntity<>(
//					service.listReply(risk_no),HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
//	
//	
//	@RequestMapping(value="/{risk_reply_no}",method = {RequestMethod.PUT, RequestMethod.PATCH})
//	public ResponseEntity<String> update(
//			@PathVariable("risk_reply_no") Integer risk_reply_no, @RequestBody RiskReplyVO vo){
//		
//		ResponseEntity<String> entity = null;
//		try {
//			vo.setRisk_reply_no(risk_reply_no);
//			service.modifyReply(vo);
//			
//			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
//	
//	
//	@RequestMapping(value="/{risk_reply_no}",method = RequestMethod.DELETE)
//	public ResponseEntity<String> remove(
//			@PathVariable("risk_reply_no") Integer risk_reply_no){
//		
//		ResponseEntity<String> entity = null;
//		try {
//			service.removeReply(risk_reply_no);			
//			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
//	
//	
//}
