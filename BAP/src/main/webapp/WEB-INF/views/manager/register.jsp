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
							<a href="/home/mem" class="nav-link" style="color: #343a40; margin-left: 0px;"><strong>PROJECT</strong></a></li>
						</c:when>
						<c:when test="${loginUser.mem_rank eq '팀장'}">
							<li class="nav-item d-none d-sm-inline-block">
							<a href="/home/pm" class="nav-link" style="color: #343a40; margin-left: 0px;"><strong>PROJECT</strong></a></li>
						</c:when>
						<c:when test="${loginUser.mem_rank eq '품질관리팀'}">
							<li class="nav-item d-none d-sm-inline-block">
							<a href="/home/qm" class="nav-link" style="color: #343a40; margin-left: 0px;"><strong>PROJECT</strong></a></li>
						</c:when>
						<c:when test="${loginUser.mem_rank eq '관리자'}">
							<li class="nav-item d-none d-sm-inline-block">
							<a href="/home/manager" class="nav-link" style="color: #343a40; margin-left: 0px;"><strong>PROJECT</strong></a></li>
						</c:when>
					</c:choose>
					<li class="nav-item d-none d-sm-inline-block"><a
						href="/task/list" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>TASK</strong></a></li>
					<li class="nav-item d-none d-sm-inline-block"><a
						href="/notice/list" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>NOTICE</strong></a></li>
					<li class="nav-item d-none d-sm-inline-block"><a
						href="/sns/list" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>SNS</strong></a></li>
					<li class="nav-item d-none d-sm-inline-block"><a
						href="/project/unit" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>CALENDAR</strong></a></li>
					<li class="nav-item d-none d-sm-inline-block"><a
						href="index3.html" class="nav-link"
						style="color: #343a40; margin-left: 0px;"><strong>REFERENCE</strong></a></li>

					<li class="nav-item d-none d-sm-inline-block"
						style="color: #343a40; margin-left: 70px;"><a href="#"
						class="nav-link"><strong>${loginUser.mem_name}[${loginUser.mem_rank}]</strong></a></li>

					<li class="nav-item d-none d-sm-inline-block"
						style="color: #343a40; margin-left: 0px"><a
						href="/login/logout" class="nav-link"><strong>logout</strong></a></li>
					<li class="nav-item d-none d-sm-inline-block"
						style="color: #343a40; margin-left: 0px"><a href="#"
						class="nav-link"><strong>myInfo</strong></a></li>

				</ul>

			</nav>
		</div>
	

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->


		<div id="content2" style="height: 1100px;  width:900px; margin-left:100px;">
		
		<h2>사원등록</h2>
		
			<form name="userForm" role="form" method="post" >
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">*사번</label>
						<input type="text" name='mem_id' id='mem_id' class="form-control" placeholder="ID를 입력해주세요"/>
						<span id="id_check"></span>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">*비밀번호</label>
						<input type="password" id='mem_pass' name='mem_pass' class="form-control" placeholder="비밀번호를 입력해주세요" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">*이름</label>
						<input type="text" id='mem_name' name='mem_name' class="form-control" placeholder="이름을 입력해주세요" />
					</div>
					 <div class="form-group">
						<label for="exampleInputEmail1">생년월일</label>
						<input type="date" name='mem_bir' class="form-control"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">주소</label>
						<input type="text" name='mem_addr' class="form-control" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">우편번호</label>
						<input type="text" name='mem_zipcode' class="form-control"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">*직책</label><br/>
						<!-- <input type="text" name='mem_rank' class="form-control" /> -->
						<select id='mem_rank' name='mem_rank'>
								<option value="">직책선택</option>
								<option value="관리자">관리자</option>
								<option value="팀장">팀장</option>
								<option value="팀원">팀원</option>
								<option value="품질관리팀">품질관리팀</option>
						</select>		 
							
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">*HP</label>
						<input type="text" id='mem_hp' name='mem_hp' class="form-control"/>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">*Email</label>
						<input type="email" id='mem_mail' name='mem_mail' class="form-control"/>
					</div>
					 <!-- <div class="form-group">
						<label for="exampleInputEmail">재직여부</label><br/>
						<input type="radio" name='mem_enabled' value=0 checked> 재직
						<input type="radio" name='mem_enabled' value=1> 퇴사
						<input type="radio" name='mem_enabled' value=2> 정직
					</div> -->
					<div class="form-group">
						<label for="exampleInputEmail">사원이미지</label>
						<input type="file" name='mem_img' />
					</div>
					
					<div class="form-group">
						<label for="exampleInputEmail">*권한 부여</label>
						<select id='auth' name='auth'>
								<option value="">권한선택</option>
								<option value="manager">manager</option>
								<option value="auth_pm">PM</option>
								<option value="auth_mem">member</option>
								<option value="auth_qm">QM</option>
						</select>	
					</div>
					
				</div>
				
				<div class="box-footer">
					<button onclick = "joinBtn()" type="button" class="btn btn-primary">사원등록</button>
					<button type='button' class="btn tbn-warning" onclick="cancel_go()">등록취소</button>
				</div>
				</form>	
		
		
		</div>
		<!--빨간색 content바탕 -->



		
		<!-- Main Footer -->
		
	
		<!-- Main Footer -->
		<footer style="margin-left: 0px;" class="main-footer">
			<!-- To the right -->
			<div class="float-right d-none d-sm-inline">Anything you want</div>
			<!-- Default to the left -->
			<strong style="text-align: center">Copyright &copy; 2014-2018
				<a href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

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

	
	
	<script type="text/javascript">
	
		function joinBtn(){
			var form = document.userForm;
			var hpVal = $("#mem_hp").val();
			var hpExp =  /^[0-9]+$/;
			var emailVal = $("#mem_mail").val();
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if(!form.mem_id.value){
				alert("아이디를 입력해주세요.");
				form.mem_id.focus();
				return;
			}else if(!form.mem_pass.value){
				alert("비밀번호를 입력해주세요.");
				form.mem_pass.focus();
				return;
			}else if(!form.mem_name.value){
				alert("이름은 필수 입력란 입니다.");
				form.mem_name.focus();
				return;
			}else if(form.mem_name.value.length < 2){
				alert("이름은 두 글자 이상 적어주세요.");
				form.mem_name.focus();
				return;
			}else if(!form.mem_bir.value){
				alert("생년월일을 입력해주세요.");
				form.mem_name.focus();
				return;
			}else if(!form.mem_addr.value){
				alert("주소를 입력해주세요.");
				form.mem_addr.focus();
				return;
			}else if(!form.mem_zipcode.value){
				alert("우편번호를 입력해주세요.");
				form.mem_zipcode.focus();
				return;
			}else if(form.mem_rank.value == ""){
				alert("직급은 필수 선택란 입니다.");
				form.mem_rank.focus();
				return;
			}else if(!form.mem_hp.value){
				alert("전화번호는 필수 입력란 입니다.");
				form.mem_hp.focus();
				return;
			}else if(hpVal.match(hpExp) == null){
				alert("전화번호는 숫자만 입력해주세요.");
				form.mem_hp.focus();
				return;
			}else if(form.mem_hp.value.length < 10){
				alert("지역번호 혹은 010을 포함한 10자 이상 적어주세요.")
				form.mem_hp.focus();
				return;
			}else if(!form.mem_mail.value){
				alert("메일주소는 필수 입력란 입니다.");
				form.mem_mail.focus();
				return;
			}else if(emailVal.match(regExp) == null){
				alert("메일 형식을 지켜주세요.");
				form.mem_mail.focus();
				return;		
			}else if(form.auth.value == ""){
				alert("권한은 필수 선택란 입니다.");
				form.auth.focus();
				return;
			}
			
			form.submit();
		}  
		</script>
		<script>
		$(function (){
		$("#mem_id").keyup(function(){
			$.ajax({
				url : "/manager/check_id",
				type : "POST",
				data : {
					mem_id : $("#mem_id").val()
				},
				success : function(result){
					if (result == 1){
						$("#id_check").html("중복된 아이디입니다.");
						$("#joinBtn").attr("disabled","disabled");
					}else{
						$("#id_check").html("가능한 아이디입니다.");
						$("#joinBtn").removeAttr("disabled");
					}
					
				},
			})
		});
	});

	function cancel_go(){
		self.location="/manager/userlist?page=${cri.page}&perPageNum=${cri.perPageNum}";
		//?page=1&perPageNum=10&searchType=id&keyword=aaa
	};
	
	
	</script> 
</body>
</html>
