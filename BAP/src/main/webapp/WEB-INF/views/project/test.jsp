<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
 response.setHeader("Cache-Control","no-cache"); 
 response.setHeader("Pragma","no-cache"); 
 response.setDateHeader("Expires",0); 
%>
<button id="groupButton" type="button" class="btn btn-info btn-sm">그룹 관리</button>
<div id="wrap"
	style="height: 830px; width: 1100px; background: red; margin: 0px auto;">
	
	<button data-target="#createModal" type="button" class="btn btn-info btn-sm"
		data-toggle="modal">프로젝트 생성</button>
	
	
		
	<!-- CreateModal -->
	<div id="createModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog modal-lg">
    		<!-- Modal content-->
    		<div class="modal-content">
    			<div class="modal-header">
        			<h4 class="modal-title">프로젝트 생성</h4>
      			</div>
      			<div id="createBody" class="modal-body">
       				<form action="/pro/create" method="POST" role="form">
        				<label>프로젝트명</label>
        				<input class="form-control" type="text" name="pro_name" />
        				<label>담당자</label>
        				<input class="form-control" type="text" value="${loginUser.mem_name}" name="mem_name" readonly/>
						<input id="mem_id" class="form-control" type="hidden" name="mem_id" value="${loginUser.mem_id}">
						<label>시작일</label>
						<input class="form-control" type="date" name="pro_start" />
						<label>종료일</label>
						<input class="form-control" type="date" name="pro_end" />
						<label>프로젝트 설명</label>
						<textarea name="pro_contents" class="form-control" style="resize: none;" cols="40" rows="8"></textarea>
	  				</form>
     			</div>
      			<div class="modal-footer">
        			<button type="submit" class="btn btn-info" id="createPro">등록</button>
        			<button id="createCancel" type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	<!-- ModifyModal -->
	<div id="groupModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog modal-lg">
    		<!-- Modal content-->
    		<div class="modal-content">
    			<div class="modal-header">
        			<h4 class="modal-title">그룹 관리</h4>
      			</div>
      			<div class="modal-body" style="paddin: 20px;">
       					<!-- 사원 목록 -->
        				<div style="width: 40%; height: 600px; border: 2px solid black; float: left;">
        					<label>사원 목록</label>
        					<div id="noGroupMember" style="width: 307px; height: 565px;">
								
        					</div>
        				</div>
        				<!-- 버튼 div -->
        				<div style="width: 20%; height: 600px; float: left; position: relative;">
        					<div style="position: absolute; top: 250px; left: 27px; height: 100px; width: 100px;">
        						<button id="rightMoveButton" type="button" class="btn btn-block btn-primary">>></button>
        						<button id="leftMoveButton" type="button" class="btn btn-block btn-danger"><<</button>
        					</div>
        				</div>
        				<!-- 팀원 목록 -->
        				
        				<div style="width: 40%; height: 600px; border:2px solid black; float: right;">
        					<label>나의 Team</label>
        					<div id="myTeamMember" style="width: 307px; height: 565px;">
        					
        					</div>
        				</div>
     			</div>
      			<div class="modal-footer">
        			<button type="submit" class="btn btn-info" id="modifyGroup">저장</button>
        			<button type="button" class="btn btn-default" id="modifyCancel"data-dismiss="modal">취소</button>
      			</div>
    		</div>
  		</div>
	</div>
</div>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
var noButtonNum = -1;
var myButtonNum = -1;
var noTotal = 0;
var myTotal = 0;
var mem_id = document.getElementById('mem_id').getAttribute('value');

function noReplace(id) {
	noButtonNum = id.replace("noButton","");
}
function myReplace(id) {
	myButtonNum = id.replace("myButton","");
}

$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	$("#createPro").on("click", function() {
		formObj.submit();
	});
	
	$("#groupButton").click(function() {
		var data = {"mem_id" : mem_id};		
		
		$.ajax({
			url : "/group/groupView",
			type : "get",			
			data : data, 
			contentType : 'application/json; charset=UTF-8', 
			dataType : "json",
			success : function(responseData) {
				
				var noGroupDiv = $("#groupModal div#noGroupMember");
				var noGroupList = responseData.noGroupList;
				noTotal = noGroupList.length;
				
				for(var member in noGroupList){
					
					var div = $('<div>');
					var button = $('<button id="noButton'+member+'" onclick="noReplace(this.id);" class="btn btn-block btn-primary" style="width: 98.5%; margin-bottom: 5px;">');
					button.append(noGroupList[member].mem_name + "[" + noGroupList[member].mem_rank + "]");
					div.append(button);
					noGroupDiv.append(div);
				}
				
				var myTeamDiv = $("#groupModal div#myTeamMember");
				var myTeamList = responseData.myTeamList;
				myTotal = myTeamList.length;
				
				for(var member in myTeamList){
					
					var div = $('<div>');
					var button = $('<button id="myButton'+member+'" onclick="myReplace(this.id);" class="btn btn-block btn-primary" style="width: 98.5%; margin-bottom: 5px;">');
					button.append(myTeamList[member].mem_name + "[" + myTeamList[member].mem_rank + "]");
					div.append(button);
					myTeamDiv.append(div);
				}

				$("#groupModal").modal('show');
			},
			error : function(error){
			}
		});
	});
	
	$("#modifyCancel").on("click", function(event) {
		$('#groupModal').click();
	});
	
	$("#createCancel").on("click", function(event) {
		$('#createModal').click();
	});
	
	$("#groupModal").on("click", function() {		
		$("#noGroupMember").empty();
		$("#myTeamMember").empty();
	});
	
	$('.modal-dialog').on("click",function(e){
		 if (!e)
		      e = window.event;
		    //IE9 & Other Browsers
		    if (e.stopPropagation) {
		      e.stopPropagation();
		    }
		    //IE8 and Lower
		    else {
		      e.cancelBubble = true;
		    }
	});
	
	
	
	$("#rightMoveButton").on("click", function() {
		var div = $('<div>');
		var button = document.getElementById('noButton'+noButtonNum);
		button.parentNode.remove();
		div.append(button);
		$("#groupModal div#myTeamMember").append(div);
		button.setAttribute('id', 'myButton' + myTotal);
		button.setAttribute('onclick','myReplace(this.id);');
		myTotal = myTotal + 1;
	});
	
	$("#leftMoveButton").on("click", function() {
		var div = $('<div>');
		var button = document.getElementById('myButton'+myButtonNum);
		button.parentNode.remove();
		div.append(button);
		$("#groupModal div#noGroupMember").append(div);
		button.setAttribute('id', 'noButton' + noTotal);
		button.setAttribute('onclick','noReplace(this.id);');
		noTotal = noTotal + 1;
	});
	
	$("#modifyGroup").on("click", function() {

		var str = "";
		for(var i = 0; i < 50; i++) {
			try{
				str += document.getElementById('myButton'+i).innerHTML;
				str += ",";
			} catch(e){
			}
		}
//		alert(str);
		var data = {"modifyData" : str,
					"mem_id" : mem_id};
		
		$.ajax({
			url : "/group/groupSave",
			type : "post",
			data : data,
			success : function(result) {
				alert(result);
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});
</script>
