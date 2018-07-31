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
				<label for="exampleInputEmail1">제목</label>
				<input type="text" name="notice_title" class="form-control"
					   value="${noticeDTO.notice_title}">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">내용</label>
				<textarea class="form-control" name="notice_content" rows="10">${noticeDTO.notice_content}</textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">작성자</label> <input type="text"
					name="mem_name" class="form-control" value="${noticeDTO.mem_name}"
					readonly="readonly">
				<input type="hidden" name="mem_id" value="${noticeDTO.mem_id}">
				<input type="hidden" name="notice_no" value="${noticeDTO.notice_no}">
			</div>
		</div>

		<!-- cri 정보 이동할 페이지로 전달 -->
		<input type='hidden' name="page" value="${cri.page}">
		<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
		<input type='hidden' name="searchType" value="${cri.searchType}">
		<input type='hidden' name="keyword" value="${cri.keyword}">

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">수정완료</button>
			<button type="submit" class="btn btn-warning">취소</button>
		</div>

	</form>
</div></div>
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
			$(".btn-primary").on("click", function() {
				formObj.submit();
			});
			
			//취소버튼
			$(".btn-warning").on("click",function() {
				self.location = "/notice/list?page=${cri.page}&perPageNum=${cri.perPageNum}";
			});
		});
	</script>
</body>
</html>
