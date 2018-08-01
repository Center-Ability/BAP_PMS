<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<body>
	<div id="wrap" style="height: 830px; width: 960px; margin: 0px auto;">
		<div class="btn-group" style="margin: 15px; display: block;">
			<button type="button" class="btn btn-info">프로젝트 상세보기</button>
			<button data-target="#createModal" data-toggle="modal" type="button" class="btn btn-info">프로젝트 생성</button>
			<button id="groupButton" type="button" class="btn btn-info">그룹 관리</button>
			<button type="button" class="btn btn-info">단위 업무 생성</button>
		</div>
		<div class="btn-group" style="margin: 15px; margin-top: 0px; padding: 0px; width: 100%;">
		
			<button type="button" class="btn btn-info" style="margin-right: 4px;">프로젝트 조건설정</button>
			
			<div class="btn-group">
				<button type="button" class="btn btn-info">프로젝트 상태</button>
				<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
					<span class="caret"></span>
					<!-- <span class="sr-only">Toggle Dropdown</span> -->
				</button>
				<div class="dropdown-menu" role="menu">
					<a id="status3" class="dropdown-item" onclick="statusSelect(this)">전체</a>
					<a id="status0" class="dropdown-item" onclick="statusSelect(this)">대기</a>
					<a id="status1" class="dropdown-item" onclick="statusSelect(this)">진행</a>
					<a id="status2" class="dropdown-item" onclick="statusSelect(this)">완료</a>
				</div>
			</div>
			
			<div class="btn-group">
				<button type="button" class="btn btn-info">프로젝트 이름</button>
				<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
					<span class="caret"></span>
					<!-- <span class="sr-only">Toggle Dropdown</span> -->
				</button>
				<div id="projectMenu" class="dropdown-menu" role="menu">
				</div>
			</div>
		</div>
		
		<div style="height: 370px;">
		<div class="card" style="margin: 15px; margin-top: 0px; width: 40%; float: left; display: inline;">
			<div class="card-header" style="background: #17a2b8; color: white;">
				<h3 class="card-title">프로젝트 정보</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body p-0">
				<table class="table">
				<tbody>
					<tr>
						<td>프로젝트명</td>
						<td>${proVO.pro_name}</td>
					</tr>
					<tr>
						<td>담당 PM</td>
						<td>${mem_name}</td>
					</tr>
					<tr>
						<td>시작일</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${proVO.pro_start}" /></td>
					</tr>
					<tr>
						<td>종료일</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${proVO.pro_end}" /></td>
					</tr>
					<tr>
						<td>프로젝트 설명</td>
						<td>${proVO.pro_contents}</td>
					</tr>
					<tr>
						<td>프로젝트 상태</td>
						<td>${pro_status_string}</td>
					</tr>
				</tbody>
				</table>
			</div>
			<!-- /.card-body -->
		</div>
		
		<div class="card" style="margin: 15px; margin-top: 0px; width: 40%; float: left; display: inline;">
			<div class="card-header" style="background: #17a2b8; color: white;">
				<h3 class="card-title">프로젝트 그룹 정보</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body p-0">
				<table class="table">
				<tbody>
					<tr id="groupInfoTitle">
						<th>이름</th>
						<th>사번</th>
						<th>직책</th>
					</tr>
					<c:forEach var="dto" items="${groupInfo}">
						<tr>
							<td>${dto.mem_name}</td>
							<td>${dto.mem_id}</td>
							<td>${dto.mem_rank}</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
			<!-- /.card-body -->
		</div>
		</div>
		
		<div class="card" style="margin: 15px; margin-top: 0px; width: 40%; float: left; display: inline;">
			<div class="card-header" style="background: #17a2b8; color: white;">
				<h3 class="card-title">프로젝트 진행률</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body p-0">
				<canvas id="projectPer" style="margin: 20px 0px 20px 0px; height: 200px; width: 400px;" width="800" height="400"></canvas>
			</div>
			<!-- /.card-body -->
		</div>
		
		<div class="card" style="margin: 15px; margin-top: 0px; width: 40%; float: left; display: inline;">
			<div class="card-header" style="background: #17a2b8; color: white;">
				<h3 class="card-title">이슈 진행률</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body p-0">
				<canvas id="issuePer" style="margin: 20px 0px 20px 0px; height: 200px; width: 400px;" width="800" height="400"></canvas>
			</div>
			<!-- /.card-body -->
		</div>
		
	</div>
	
	<!-- CreateModal -->
	<div id="createModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog modal-lg">
    		<!-- Modal content-->
    		<div class="modal-content">
    			<div class="modal-header">
        			<h4 class="modal-title">프로젝트 생성</h4>
      			</div>
      			<div id="createBody" class="modal-body">
       				<form action="/project/create" method="POST" role="form">
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
        			<button type="submit" class="btn btn-info" id="createPro" onclick="createProSubmit()">등록</button>
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
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="<%=request.getContextPath()%>/resources/plugins/chartjs-old/Chart.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
	
	<script>
	
	// 프로젝트 파이차트
	function projectPer() {
		var pieChartCanvas = $('#projectPer').get(0).getContext('2d')
		var pieChart = new Chart(pieChartCanvas)
		var PieData = [ {
			value : 700,
			color : '#3c8dbc',
			highlight : '#3c8dbc',
			label : 'Opera'
		},
		{
			value : 300,
			color : '#f56954',
			highlight : '#f56954',
			label : 'Chrome'
		}]
		var pieOptions = {
			//Boolean - Whether we should show a stroke on each segment
			segmentShowStroke : true,
			//String - The colour of each segment stroke
			segmentStrokeColor : '#fff',
			//Number - The width of each segment stroke
			segmentStrokeWidth : 2,
			//Number - The percentage of the chart that we cut out of the middle
			percentageInnerCutout : 50, // This is 0 for Pie charts
			//Number - Amount of animation steps
			animationSteps : 100,
			//String - Animation easing effect
			animationEasing : 'easeOutBounce',
			//Boolean - Whether we animate the rotation of the Doughnut
			animateRotate : true,
			//Boolean - Whether we animate scaling the Doughnut from the centre
			animateScale : false,
			//Boolean - whether to make the chart responsive to window resizing
			responsive : true,
			// Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
			maintainAspectRatio : true,
		//String - A legend template
		}
		//Create pie or douhnut chart
		// You can switch between pie and douhnut using the method below.
		pieChart.Doughnut(PieData, pieOptions)
	}
	projectPer();
	
	// 프로젝트 파이차트
	function issuePer() {
		var pieChartCanvas = $('#issuePer').get(0).getContext('2d')
		var pieChart = new Chart(pieChartCanvas)
		var PieData = [ {
			value : 400,
			color : '#3c8dbc',
			highlight : '#3c8dbc',
			label : 'Opera'
		},
		{
			value : 600,
			color : '#f56954',
			highlight : '#f56954',
			label : 'Chrome'
		}]
		var pieOptions = {
			//Boolean - Whether we should show a stroke on each segment
			segmentShowStroke : true,
			//String - The colour of each segment stroke
			segmentStrokeColor : '#fff',
			//Number - The width of each segment stroke
			segmentStrokeWidth : 2,
			//Number - The percentage of the chart that we cut out of the middle
			percentageInnerCutout : 50, // This is 0 for Pie charts
			//Number - Amount of animation steps
			animationSteps : 100,
			//String - Animation easing effect
			animationEasing : 'easeOutBounce',
			//Boolean - Whether we animate the rotation of the Doughnut
			animateRotate : true,
			//Boolean - Whether we animate scaling the Doughnut from the centre
			animateScale : false,
			//Boolean - whether to make the chart responsive to window resizing
			responsive : true,
			// Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
			maintainAspectRatio : true,
		//String - A legend template
		}
		//Create pie or douhnut chart
		// You can switch between pie and douhnut using the method below.
		pieChart.Doughnut(PieData, pieOptions)
	}
	
	issuePer();
	
	$(document).ready(function(){
	    $(".dropdown-toggle").dropdown();
	    ajaxProMenu(3);
	});
	
	
	
	function statusSelect(e) {
		
		var id = document.getElementById(e.getAttribute('id')).getAttribute('id');
		var pro_status = id.substring(6);
		
		ajaxProMenu(pro_status);
	}
	
	function ajaxProMenu(pro_status) {
		
		var data = {"pro_status" : pro_status};
		
		$.ajax({
			url : "/project/search",
			type : "get",
			data : data,
			success : function(result) {
				var list = result.proVO;
				var target = $('#projectMenu');
				target.empty();
				
				for(var index in list) {
					var atag = $('<a id="pronum'+list[index].pro_num+'" class="dropdown-item" onclick="projectMove(this)">')
					atag.append(list[index].pro_name);
					target.append(atag);
				}
				
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function projectMove(e) {
		var id = document.getElementById(e.getAttribute('id')).getAttribute('id');
		var pro_num = id.substring(6);
		
		var data = {"nowpro" : pro_num};
		
		$.ajax({
			url : "/project/nowprochange",
			type : "get",
			data : data
		});
		
		window.location.reload(true);
	}
	
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

	function createProSubmit(e) {
		var formObj = $("form[role='form']");
		
		formObj.submit();
	}
	
	$(document).ready(function() {
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
//			alert(str);
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
	
</body>