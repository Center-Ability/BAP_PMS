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
			<button type="button" class="btn btn-info">프로젝트 생성</button>
			<button type="button" class="btn btn-info">그룹 관리</button>
			<button type="button" class="btn btn-info">단위 업무 생성</button>
		</div>
		<div class="btn-group" style="margin: 15px; margin-top: 0px; padding: 0px; width: 100%;">
		
			<button type="button" class="btn btn-info" style="margin-right: 10px;">프로젝트 조건설정</button>
			
			<div class="btn-group">
				<button type="button" class="btn btn-info">프로젝트 상태</button>
				<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
					<span class="caret"></span>
					<!-- <span class="sr-only">Toggle Dropdown</span> -->
				</button>
				<div class="dropdown-menu" role="menu">
					<a class="dropdown-item" href="#">전체</a>
					<a class="dropdown-item" href="#">대기</a>
					<a class="dropdown-item" href="#">진행</a>
					<a class="dropdown-item" href="#">완료</a>
				</div>
			</div>
			
			<div class="btn-group">
				<button type="button" class="btn btn-info">프로젝트 이름</button>
				<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
					<span class="caret"></span>
					<!-- <span class="sr-only">Toggle Dropdown</span> -->
				</button>
				<div class="dropdown-menu" role="menu">
					<a class="dropdown-item" href="#">Action</a>
					<a class="dropdown-item" href="#">Another action</a>
					<a class="dropdown-item" href="#">Something else here</a>
					<a class="dropdown-item" href="#">Separated link</a>
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
	});
	
	</script>
	
</body>