<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>B.A.P P_M_S</title>
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Bootstrap 3.3.4 -->
<link
	href="<%=request.getContextPath()%>/resources/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- ADD pagination  -->
<link href="<%=request.getContextPath()%>/resources/css/pagination.css"
	rel="stylesheet" type="text/css" />
<!-- ADD calendar  -->
<link href="<%=request.getContextPath()%>/resources/css/calendar.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link
	href="<%=request.getContextPath()%>/resources/dist/css/adminlte.min.css"
	rel="stylesheet" type="text/css" />

<!-- fullCalendar 2.2.5-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/fullcalendar/fullcalendar.print.css"
	media="print">



<style>
div#wrapp {
	width: 960px;
	margin: 0 auto;
}
</style>

</head>


<body class="hold-transition sidebar-mini">

	<div id="wrapp">
		
	
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">회원조회</h1>
			</div>

			<form role="form" method="post" >
			<input type='hidden' name='mem_id' value="${userListVO.mem_id}">
			</form>
			
	<div id="content" style="width: 1000px; padding-top: 20px; margin-left: 100px">
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th scope="col" >속성</th>
							<th scope="col" >정보</th>
							
						</tr>
						<tr>
							<th scope="row">사번</th>
							<td>${userListVO.mem_id}</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td>${userListVO.mem_pass}</td>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>${userListVO.mem_name}</td>
						</tr>
						<tr>
							<th scope="row">생년월일</th>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${userListVO.mem_bir}"/></td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>${userListVO.mem_addr}</td>
						</tr>
						<tr>
							<th scope="row">우편번호</th>
							<td>${userListVO.mem_zipcode}</td>
						</tr>
						<tr>
							<th scope="row">직급</th>
							<td>${userListVO.mem_rank}</td>
						</tr>
						<tr>
							<th scope="row">HP</th>
							<td>${userListVO.mem_hp}</td>
						</tr>
						<tr>
							<th scope="row">Email</th>
							<td>${userListVO.mem_mail}</td>
						</tr>
						<tr>
							<th scope="row">재직여부</th>
							<td>${userListVO.mem_enabled} (1:재직중 0:퇴사 2:정직)</td>
						</tr>
						
						<tr>
							<th scope="row">사원이미지</th>
							<td>${userListVO.mem_img}</td>
						</tr>
						<tr>
							<th scope="row">입사일</th>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${userListVO.mem_regdate}"/></td>
						</tr>
						<tr>
							<th scope="row">퇴사일</th>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${userListVO.mem_enddate}"/></td>
						</tr>
						<tr>
							<th scope="row">권한</th>
							<td>${userListVO.auth}</td>
						</tr>
							</table>
		
					</div>
					<!-- box-body -->
				
					<div class="box-footer">
						<button type="submit" class="btn btn-warning">정보수정</button>
						<button type='submit' class="btn btn-primary">목록보기</button>
						
					</div>
					<!-- box-footer -->
				<form role="form">
					<input type='hidden' name="page" value="${cri.page}">
					<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
					<input type='hidden' name="searchType" value="${cri.searchType}">
					<input type='hidden' name="keyword" value="${cri.keyword}">
					<input type='hidden' name="mem_id" value="${userListVO.mem_id}">
				</form>
				
				</div>
				<!-- box -->
			</div>
			<!-- col-md-12 -->
		</div>
		<!-- row -->
	</div>
	<!-- content -->
	</div>
	<!-- row-md-2 -->
</div>
<!-- container-fluid -->
</div>
<!-- content-header -->
			

		<!-- Main Footer -->
	
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>

	<!-- ChartJS 1.0.1 -->
	<script src="<%=request.getContextPath()%>/resources/plugins/chartjs-old/Chart.min.js"></script>

	<!-- FastClick -->
	<script src="<%=request.getContextPath()%>/resources/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>

	<script>
	
	
	
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-warning").on("click",function(){
			formObj.attr("action","modify");
			formObj.attr("method","get");
			formObj.submit();
		});
		
		$(".btn-primary").on("click", function() {
			formObj.attr("action", "userlist");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		
	});
	</script> 
</body>
</html>
