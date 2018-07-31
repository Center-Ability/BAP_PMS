<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<div class="wrapper">

			<!-- 상단바 -->
			<nav style="margin-left: 0px; margin-right: 0px;"
				class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
				<!-- Left navbar links -->
				<ul class="navbar-nav">
					
					<c:choose>
						<c:when test="${loginUser.mem_rank eq '팀원'}">
							<li class="nav-item d-none d-sm-inline-block">
							<a href="/home/mem" class="nav-link" style="color: #343a40; margin-left: 0px;"><strong>HOME_PMS</strong></a></li>
						</c:when>
						<c:when test="${loginUser.mem_rank eq '팀장'}">
							<li class="nav-item d-none d-sm-inline-block">
							<a href="/home/pm" class="nav-link" style="color: #343a40; margin-left: 0px;"><strong>HOME_PMS</strong></a></li>
						</c:when>
						<c:when test="${loginUser.mem_rank eq '품질관리팀'}">
							<li class="nav-item d-none d-sm-inline-block">
							<a href="/home/qm" class="nav-link" style="color: #343a40; margin-left: 0px;"><strong>HOME_PMS</strong></a></li>
						</c:when>
						<c:when test="${loginUser.mem_rank eq '관리자'}">
							<li class="nav-item d-none d-sm-inline-block">
							<a href="/home/manager" class="nav-link" style="color: #343a40; margin-left: 0px;"><strong>HOME_PMS</strong></a></li>
						</c:when>
					</c:choose>
					
					<li class="nav-item d-none d-sm-inline-block"><a
						href="/project/detail" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>PROJECT</strong></a></li>
					
					<c:if test ='${loginUser.mem_rank eq "팀원"}'>
						<li class="nav-item d-none d-sm-inline-block"><a
						href="/task/list" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>TASK</strong></a></li>
					</c:if>
					
					<c:if test ='${loginUser.mem_rank eq "팀장"}'>
						<li class="nav-item d-none d-sm-inline-block"><a
						href="/task/list" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>TASK</strong></a></li>
					</c:if>
					
					<li class="nav-item d-none d-sm-inline-block"><a
						href="/notice/list" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>NOTICE</strong></a></li>
					
					<c:if test ='${loginUser.mem_rank eq "팀원" }'>
						<li class="nav-item d-none d-sm-inline-block"><a
							href="/sns/list" class="nav-link"
							style="color: #343a40; margin-left: 0px;"><strong>SNS</strong></a></li>
					</c:if>
					
					<c:if test ='${loginUser.mem_rank eq "팀장" }'>
						<li class="nav-item d-none d-sm-inline-block"><a
							href="/sns/list" class="nav-link"
							style="color: #343a40; margin-left: 0px;"><strong>SNS</strong></a></li>
					</c:if>
					
					<c:if test ='${loginUser.mem_rank eq "팀원" }'>
						<li class="nav-item d-none d-sm-inline-block"><a
						href="Calendar.jsp" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>CALENDAR</strong></a></li>
					</c:if>
					
					<c:if test ='${loginUser.mem_rank eq "팀장" }'>
						<li class="nav-item d-none d-sm-inline-block"><a
						href="Calendar.jsp" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>CALENDAR</strong></a></li>
					</c:if>
						
					<c:if test ='${loginUser.mem_rank eq "팀원"}'>
						<li class="nav-item d-none d-sm-inline-block"><a
						href="index3.html" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>REFERENCE</strong></a></li>
					</c:if>
					
					<c:if test ='${loginUser.mem_rank eq "팀장"}'>
						<li class="nav-item d-none d-sm-inline-block"><a
						href="index3.html" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>REFERENCE</strong></a></li>
					</c:if>
					
					<c:if test ="${loginUser.mem_rank == '관리자'}">
						<li class="nav-item d-none d-sm-inline-block">
						<a href="/manager/userlist" class="nav-link" style="color: #343a40; margin-left: 0px;">
						<strong>USER</strong></a></li>
					</c:if>
						
					<li class="nav-item d-none d-sm-inline-block"
						style="color: #343a40; margin-left: 50px; width:140px;"><a href="#"
						class="nav-link"><strong>${loginUser.mem_name}[${loginUser.mem_rank}]</strong></a></li>

					<li class="nav-item d-none d-sm-inline-block"
						style="color: #343a40; margin-left: 0px"><a
						href="/login/logout" class="nav-link"><strong>logout</strong></a></li>
					
				</ul>

			</nav>
		</div>
	</div>
</body>