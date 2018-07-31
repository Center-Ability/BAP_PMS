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
			<div class="content-wrapper"
				style="margin-left: 10px; margin-right: 10px">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h1>Issue_게시글 작성</h1>
				</section>

				<form role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								name='issue_title' class="form-control"
								placeholder="제목을 입력하세요...">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">내용</label>
							<textarea class="form-control" name="issue_content" rows="10"
								placeholder="내용을 입력하세요..."></textarea>
						</div>
						<%-- <div class="form-group">
							<label for="exampleInputEmail1"style="margin-left:10px;">담당 프로젝트</label>
							<label for="exampleInputEmail1" style="margin-left:15px;">:</label>
							
							
							<c:if test="${!empty listPro}">
								<div   id="selectBox"
									style="width: 200px; height: 40px; margin-left:150px;  margin-top:-32px; readonly" class="select_02">
									<c:forEach var="listPro" items="${listPro}" varStatus="i">
										<option value="${listPro.pro_num}">${listPro.pro_name}</option>
									</c:forEach>
								</div>
							</c:if>
						</div> 
					 --%>
						<c:if test="${!empty listPro}">
							
								<c:forEach var="listPro" items="${listPro}" varStatus="i">
									
									<input type="hidden" name='pro_num' class="form-control" readonly	value="${listPro.pro_num}">
									<label for="exampleInputEmail1">담당프로젝트</label>
									<input type="text"	style="width:200px;" class="form-control" readonly	value="${listPro.pro_name}">
									
								</c:forEach>
							
						</c:if>
					
						<div class="form-group" style="margin-top:10px;">
							<label for="exampleInputEmail1">작성자</label> <input type="text"
								name='mem_name' class="form-control" readonly
								value="${loginUser.mem_name}" style="width:200px;">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">해결여부</label> <input type="text"
								class="form-control" readonly value="해결요청바람" style="width:200px;"> <input
								type="hidden" name="issue_status" value="0">
						</div>
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">등록</button>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>
