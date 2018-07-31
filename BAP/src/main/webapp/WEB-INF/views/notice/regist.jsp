<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body class="hold-transition sidebar-mini">

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper"
		style="margin-left: 10px; margin-right: 10px">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>게시글 작성</h1>
		</section>

		<form role="form" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="exampleInputEmail1">제목</label> <input type="text"
						name='notice_title' class="form-control"
						placeholder="제목을 입력하세요...">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">내용</label>
					<textarea class="form-control" name="notice_content" rows="10"
						placeholder="내용을 입력하세요..."></textarea>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">작성자</label> <input type="text"
						name='mem_name' class="form-control" readonly value="${loginUser.mem_name}">
					<input type="hidden" name="mem_id" value="${loginUser.mem_id}">
				</div>
			</div>

			<div class="box-footer">
				<button type="submit" class="btn btn-primary">등록</button>
			</div>

		</form>
	</div>
</body>
</html>
