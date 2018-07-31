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


		<div id="content2"
			style="height: 1200px; width: 900px; margin-left: 100px;">

			<h2>사원수정</h2>

			<form role="form" action="modify" method="post">
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">사번</label> <input type="text"
							name='mem_id' class="form-control" value="${userListVO.mem_id}"
							disabled />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">비밀번호</label> <input
							type="password" name='mem_pass' class="form-control"
							value="${userListVO.mem_pass}" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">이름</label> <input type="text"
							name='mem_name' class="form-control"
							value="${userListVO.mem_name}" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">생년월일</label><br /> <input
							type="date" name='mem_bir' class="form-control"
							value=<fmt:formatDate pattern="yyyy-MM-dd" value="${userListVO.mem_bir}"/>>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">주소</label> <input type="text"
							name='mem_addr' class="form-control"
							value="${userListVO.mem_addr}" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">우편번호</label> <input type="text"
							name='mem_zipcode' class="form-control"
							value="${userListVO.mem_zipcode}" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">*직급</label><br /> <select
							name='mem_rank'>
							<option value=""
								<c:if test="${userListVO.mem_rank==''}">selected</c:if>>직급선택</option>
							<option value="관리자"
								<c:if test="${userListVO.mem_rank=='관리자'}">selected</c:if>>관리자</option>
							<option value="팀장"
								<c:if test="${userListVO.mem_rank=='팀장'}">selected</c:if>>팀장</option>
							<option value="팀원"
								<c:if test="${userListVO.mem_rank=='팀원'}">selected</c:if>>팀원</option>
							<option value="품질관리팀"
								<c:if test="${userListVO.mem_rank=='품질관리팀'}">selected</c:if>>품질관리팀</option>
						</select>

					</div>
					<div class="form-group">
						<label for="exampleInputEmail">HP</label> <input type="text"
							name='mem_hp' class="form-control" value="${userListVO.mem_hp}" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">Email</label> <input type="email"
							name='mem_mail' class="form-control"
							value="${userListVO.mem_mail}" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">*재직여부</label><br /> <input
							type="radio" name='mem_enabled' value=1
							<c:if test="${userListVO.mem_enabled == 1}">checked</c:if>>
						재직 <input type="radio" name='mem_enabled' value=0
							<c:if test="${userListVO.mem_enabled == 0}">checked</c:if>>
						퇴사 <input type="radio" name='mem_enabled' value=2
							<c:if test="${userListVO.mem_enabled == 2}">checked</c:if>>
						정직
					</div>
					<div class="form-group">
						<label for="exampleInputEmail">사원이미지</label> <input type="text"
							name='mem_img' class="form-control" value="${userListVO.mem_img}" />
					</div>

					<div class="form-group">
						<label for="exampleInputEmail">*권한 부여</label> <select name='auth'>
							<option value="">권한선택</option>
							<option value="manager"
								<c:if test="${userListVO.auth == 'manager'}">selected</c:if>>manager</option>
							<option value="auth_pm"
								<c:if test="${userListVO.auth == 'auth_pm'}">selected</c:if>>PM</option>
							<option value="auth_mem"
								<c:if test="${userListVO.auth == 'auth_mem'}">selected</c:if>>member</option>
							<option value="auth_qm"
								<c:if test="${userListVO.auth == 'auth_qm'}">selected</c:if>>QM</option>
						</select>
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">입사일</label><br /> <input
							type="date" name='mem_regdate' class="form-control"
							value=<fmt:formatDate pattern="yyyy-MM-dd" value="${userListVO.mem_regdate}"/>>
					</div>


					<div class="form-group" id="enddate" style="display: none;">
						<label for="exampleInputEmail1">*퇴사일</label> <input type="date"
							name='mem_enddate' class="form-control" /> <input type="hidden"
							name="mem_id" value="${userListVO.mem_id}">
					</div>


				</div>

				<input type='hidden' name="page" value="${cri.page}"> <input
					type='hidden' name="perPageNum" value="${cri.perPageNum}">
				<input type='hidden' name="searchType" value="${cri.searchType}">
				<input type='hidden' name="keyword" value="${cri.keyword}">
				<input type='hidden' name="mem_id" value="${userListVO.mem_id}">


				<div class="box-footer">
					<button type="submit" class="btn btn-primary">수정완료</button>
					<button type='button' class="btn tbn-warning" onclick="cancel_go()">수정취소</button>
				</div>
			</form>


		</div>
		<!--빨간색 content바탕 -->




		<!-- Main Footer -->



	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>

	<!-- ChartJS 1.0.1 -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/chartjs-old/Chart.min.js"></script>

	<!-- FastClick -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>

	<script>
		$(document)
				.ready(
						function() {

							$('input[type=radio][name=mem_enabled]')
									.on(
											'click',
											function() {

												var chkValue = $(
														'input[type=radio][name=mem_enabled]:checked')
														.val();

												if (chkValue == 0) {

													$('#enddate').css(
															'display', 'block');

												} else if (chkValue != 0) {

													$('#enddate').css(
															'display', 'none');

												}
												;

											});

							var formObj = $("form[role='form']");
							console.log(formObj);

							$(".btn-primary").on("click", function() {
								formObj.submit();
							});
						});

		function cancel_go() {
			self.location = "/manager/read?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&mem_id=${userListVO.mem_id}"

		};
	</script>
</body>
</html>
