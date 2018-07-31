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

	<form role="form" method="post">

		<input type="hidden" name="notice_no" value="${noticeDTO.notice_no}">

	</form>

	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				name="notice_title" class="form-control"
				value="${noticeDTO.notice_title}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea class="form-control" name="notice_content" rows="10"
				readonly="readonly">${noticeDTO.notice_content}</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label> <input type="text"
				name="mem_id" class="form-control" value="${noticeDTO.mem_name}"
				readonly="readonly">
		</div>
	</div>

	<div class="box-footer">
		<button type="submit" class="btn btn-warning">수정</button>
		<button type="submit" class="btn btn-danger">삭제</button>
		<button type="submit" class="btn btn-primary">뒤로</button>
	</div>

</div></div>
	<!-- cri 정보 이동할 페이지로 전달 -->
	<form role="form">
		<input type='hidden' name="page" value="${cri.page}">
		<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
		<input type='hidden' name="searchType" value="${cri.searchType}">
		<input type='hidden' name="keyword" value="${cri.keyword}">
		<input type='hidden' name="notice_no" value="${noticeDTO.notice_no}">
	</form>

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
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);

			//수정버튼
			$(".btn-warning").on("click", function() {
				formObj.attr("action", "modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			//삭제버튼
			$(".btn-danger").on("click", function() {
				formObj.attr("action", "remove");
				formObj.attr("method", "post");
				formObj.submit();
			});

			//뒤로버튼
			$(".btn-primary").on("click", function() {
				formObj.attr("action", "list");
				formObj.attr("method", "get");
				formObj.submit();
			});
		});
	</script>
</body>
</html>
