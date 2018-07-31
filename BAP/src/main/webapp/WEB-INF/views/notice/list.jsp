<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<head>
<style>
div#wrap {
	width: 960px;
	margin: 0 auto;
}
</style>
</head>


<body>
<div id="wrap">
<div class="hold-transition sidebar-mini">
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper" style="margin-left: 20px;">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Notice <small>Lines</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i>_관리자들의
						공지사항이오니 읽어보시기 바랍니다.</a></li>
			</ol>
		</section>

		<!-- 검색창  -->
		<div>
			<select name="searchType">
				<option value="n"
					<c:out value="${cri.searchType == null?'selected':''}"/>>
					---</option>
				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
					제목</option>
				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
					내용</option>
				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
					작성자</option>
				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
					제목 or 내용</option>
				<option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
					내용 OR 작성자</option>

			</select> <input type="text" name="keyword" id="keywordInput"
				value="${cri.keyword}">
			<button id='searchBtn'>Search</button>
			<button id='newBtn'>new Board</button>

		</div>

		<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<div style="margin-top:20px;">
		<table class="table table-bordered">

			<tr>
				<th style="width: 5px;">글 번호</th>
				<th style="width: 100px;">제목</th>
				<th style="width: 20px;">작성자</th>
				<th style="width: 50px;">작성일</th>
			</tr>

			<c:forEach items="${noticeDTO}" var="dto">

				<tr>
					<td>${dto.notice_no}</td>
					<td><a href='/notice/detail${pageMaker.makeSearch(pageMaker.cri.page)}
					&notice_no=${dto.notice_no}'>${dto.notice_title}</a></td>
					<td>${dto.mem_name}&nbsp;&nbsp;&nbsp;
					<c:choose>
						<c:when test="${dto.mem_rank eq 'auth_mem'}">
							<div class="btn btn-block btn-primary btn-sm" style="display: inline; font-size: 12px;">
							${dto.mem_rank}</div>
						</c:when>
						<c:when test="${dto.mem_rank eq 'auth_pm'}">
							<div class="btn btn-block btn-success btn-sm" style="display: inline; font-size: 12px;">
							${dto.mem_rank}</div>
						</c:when>
						<c:when test="${dto.mem_rank eq 'auth_qm'}">
							<div class="btn btn-block btn-info btn-sm" style="display: inline; font-size: 12px;">
							${dto.mem_rank}</div>
						</c:when>
						<c:when test="${dto.mem_rank eq 'manager'}">
							<div class="btn btn-block btn-warning btn-sm" style="display: inline; font-size: 12px;">
							${dto.mem_rank}</div>
						</c:when>
					</c:choose>
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${dto.notice_date}" /></td>
				</tr>

			</c:forEach>

		</table>
</div>

		<div>
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<div class="box">
						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination link">

									<c:if test="${pageMaker.prev}">
										<li><a
											href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
										</li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage}" var="idx">
										<li
											<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
											<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
										<li><a
											href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
									</c:if>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<form id="jodForm">
			<input type='hidden' name="page" value="${pageMaker.cri.perPageNum}">
			<input type='hidden' name="pagePageNum"
				value="${pageMaker.cri.perPageNum}">
		</form>

	</div></div></div>
<!-- jQuery -->
	<script	src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
	 <!-- Bootstrap 3.3.2 JS -->
    <script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='<%=request.getContextPath()%>/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="<%=request.getContextPath()%>/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<%=request.getContextPath()%>/resources/dist/js/demo.js" type="text/javascript"></script>

<script>
	var result = '${param.msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	$(document).ready(function() {
		$('#searchBtn').on("click", function(event) {
			self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword="
						+ encodeURIComponent($('#keywordInput').val());
		});

		$('#newBtn').on("click", function(evt) {
			self.location = "regist";
		});
	});
</script>
</body>
</html>
