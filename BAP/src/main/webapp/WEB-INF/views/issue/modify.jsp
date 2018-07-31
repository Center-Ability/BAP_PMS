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
	<form role="form" action="modify" method="post">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">제목</label> <input type="text"
					name="issue_title" class="form-control"
					value="${issueDTO.issue_title}">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">내용</label>
				<textarea class="form-control" name="issue_content" rows="10">${issueDTO.issue_content}</textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">프로젝트 번호</label> <input type="text"
					name="pro_num" class="form-control" value="${issueDTO.pro_num}"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">작성자</label> <input type="text"
					name="mem_name" class="form-control" value="${issueDTO.mem_name}"
					readonly="readonly"> <input type="hidden" name="mem_id"
					value="${issueDTO.mem_id}"> <input type="hidden"
					name="issue_no" value="${issueDTO.issue_no}">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">승인여부</label> <select
					id='issue_status' name='issue_status'>
					<option value=0
						<c:if test="${issueDTO.issue_status=='0'}">selected</c:if>>미해결</option>
					<option value=1
						<c:if test="${issueDTO.issue_status=='1'}">selected</c:if>>해결</option>
				</select>
			</div>
		</div>

		<!-- cri 정보 이동할 페이지로 전달 -->
		<input type='hidden' name="page" value="${cri.page}"> <input
			type='hidden' name="perPageNum" value="${cri.perPageNum}"> <input
			type='hidden' name="searchType" value="${cri.searchType}"> <input
			type='hidden' name="keyword" value="${cri.keyword}">

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">수정완료</button>
			<button type="button" class="btn btn-warning" onclick="back()">취소</button>
		</div>

	</form>

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
							var formObj = $("form[role='form']");
							console.log(formObj);
							$(".btn-primary").on("click", function() {
								formObj.submit();
							});

						
						});
		
		function back(){
			self.location = "/issue/list";
		};
	</script>
	</div>
	</div>
</body>
</html>
