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

		<div class="content-header"  style="margin-left: 30px">
			<div class="container-fluid">
				<div class="row mb-2">
					<div >
						<h1 class="m-0 text-dark">회원리스트</h1>
					</div>
					
							<div>
								<button class="btn btn-primary" type="button" id="registerBtn" style="margin-left:30px;">회원등록</button>
							</div>
						
					<!-- /.col -->
				</div>
			</div>
		</div>
		<br />

		<!-- 검색창  -->
		<div style="margin-left: 30px">
			<select name="searchType">

				<option value="all"
					<c:out value="${cri.searchType == 'null'?'selected':''}"/>>
					전체보기</option>
				<option value="id"
					<c:out value="${cri.searchType eq 'id'?'selected':''}"/>>
					아이디</option>
				<option value="name"
					<c:out value="${cri.searchType eq 'name'?'selected':''}"/>>
					이름</option>


			</select> <input type="text" name="keyword" id="keywordInput"
				value="${cri.keyword}">
			<button id='searchBtn'>Search</button>


		</div>
		<!-- 검색끝 -->

		<div id="content"
			style="width: 900px; padding-top: 20px; margin-left: 30px">
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-body">
							<table class="table table-bordered">
								<tr>
									<th style="width: 20px">ID</th>
									<th>NAME</th>
									<th>RANK</th>
									<th>REGDATE</th>
								</tr>

								<c:forEach items="${list}" var="userListVO">

									<tr>
										<td><a
											href='/manager/read${pageMaker.makeSearch(pageMaker.cri.page)}&mem_id=${userListVO.mem_id}'>${userListVO.mem_id}</a></td>
										<td>${userListVO.mem_name}</td>
										<td>${userListVO.mem_rank}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${userListVO.mem_regdate}" /></td>
									</tr>
								</c:forEach>
							</table>


							<div class="row">
								<!-- left column -->
								<div class="col-md-12">
									<div class="box">
										<div class="box-footer">
											<div class="text-center">
												<ul class="pagination link">

													<c:if test="${pageMaker.prev}">
														<li><a
															href="userlist${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
														</li>
													</c:if>

													<c:forEach begin="${pageMaker.startPage }"
														end="${pageMaker.endPage}" var="idx">
														<li
															<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
															<a href="userlist${pageMaker.makeSearch(idx)}">${idx}</a>
														</li>
													</c:forEach>

													<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
														<li><a
															href="userlist${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
													</c:if>

												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<form id="jodForm">
							<input type='hidden' name="page"
								value="${pageMaker.cri.perPageNum}"> <input
								type='hidden' name="pagePageNum"
								value="${pageMaker.cri.perPageNum}">

						</form>

					</div>

				</div>
			</div>
		</div>







	</div>
	<!-- ./wrapper -->



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
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("등록되었습니다.");
		}

		$(document).ready(function() {

			//등록페이지로 이동버튼
			$(".btn-primary").on("click", function() {
				self.location = "/manager/register"
			});

		});

		$(document).ready(
				function() {
					$('#searchBtn').on(
							"click",
							function(event) {
								self.location = "userlist"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});

				});
	</script>

</body>
</html>
