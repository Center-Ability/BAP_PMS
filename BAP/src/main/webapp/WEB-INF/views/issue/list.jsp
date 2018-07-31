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
				<strong>Issue_Page</strong>
			</h1>
			<hr>
			<button id="button" class="btn btn-block btn-danger" style="width:100px;"><strong>Risk</strong></button>
			<button id="button" class="btn btn-block btn-info" style="width:100px; margin-left:120px; margin-top:-38px;"><strong>Issue</strong></button>
			<button id="button" class="btn btn-block btn-secondary" style="width:100px; margin-left:240px; margin-top:-38px;">Unit</button>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i>페이지 이동을 원할 시 해당하는 버튼을 누르세요.</a></li>
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
			<input type="hidden" name="mem_id" value="${loginUser.mem_name}">
		</div>

		<!--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


		<div style="margin-top:20px;">
		<table class="table table-bordered" >

			<tr>
				<th style="width: 5px;">번호</th>
				<th style="width: 80px;">※프로젝트_이름</th>
				<th style="width: 150px;">제목</th>
				<th style="width: 2px;">작성자</th>
				<th style="width: 100px;">작성일</th>
				<th style="width: 2px;">진행상태</th>
			</tr>

			<c:forEach items="${issueDTO}" var="dto">

				<tr>
					<td>${dto.issue_no}</td>
					<td>${dto.pro_name}</td>
					<td><a href='/issue/detail${pageMaker.makeSearch(pageMaker.cri.page)}
					&issue_no=${dto.issue_no}'>${dto.issue_title}</a></td>
					<td>${dto.mem_name}&nbsp;&nbsp;&nbsp;
					
					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"	value="${dto.issue_date}" /></td>
					<td>
						<c:choose>
							<c:when test="${dto.issue_status == '0'}">
								<div class="btn btn-block btn-secondary btn-sm" style="display: inline; font-size: 20px;">
								미해결</div>
							</c:when>
							
							<c:when test="${dto.issue_status == '1'}">
								<div class="btn btn-block btn-danger btn-sm" style="display: inline; font-size: 20px;">
								해결</div>
							</c:when>
						</c:choose>
						
					</td>
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

	</div>

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
			self.location = "/issue/regist?mem_id=${loginUser.mem_id}";
		});
	});
</script>

<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);

			/* //수정버튼
			$(".btn-warning").on("click", function() {
				formObj.attr("action", "modify");
				formObj.attr("method", "get");
				formObj.submit();
			}); */

			//삭제버튼
			$(".btn-danger").on("click", function() {
				self.location = "/task/list";
			});

			/* //뒤로버튼
			$(".btn-primary").on("click", function() {
				formObj.attr("action", "list");
				formObj.attr("method", "get");
				formObj.submit();
			}); */
		});
	</script>
</div></div>
</body>
</html>
