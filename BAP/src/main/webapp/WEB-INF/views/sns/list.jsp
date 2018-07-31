<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body class="hold-transition sidebar-mini">
	<div id="content"
		style="height: 700px; width: 900px; margin: 0px auto; margin-top: 50px; margin-bottom: 50px; background: #E0E0E0">

		<div id="SnsScroll"
			style="height: 600px; padding: 10px; overflow-x: hidden; overflow-y: auto;">
			<c:forEach var="sns" items="${snsList}">
				<div style="width: 900px; padding-bottom: 10px;">
					<div>
						<strong class="btn btn-block btn-primary"
							style="display: inline; font-size: 12px;">${sns.mem_rank}</strong>
						&nbsp; <strong>${sns.mem_name}</strong> &nbsp;&nbsp;&nbsp;&nbsp;
						<fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss"
							value="${sns.sns_date}" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${loginUser.mem_name == sns.mem_name}">
							<button type="button" class="btn btn-block btn-danger deleteBtn"
								value="${sns.sns_no }"
								style="display: inline; font-size: 12px; width: 50px; height: 30px;">삭제</button>
						</c:if>
					</div>
					<div>${sns.sns_content}</div>
				</div>
			</c:forEach>
		</div>
		<div style="height: 100px; position: relative;">
			<form action="list" method="post">
				<textarea name="sns_content"
					style="height: 80px; width: 750px; resize: none; margin: 10px;"></textarea>
				<input type="submit" value="보내기"
					class="btn btn-block btn-default btn-lg"
					style="width: 120px; height: 80px; position: absolute; margin: 10px; margin-left: 0px; display: inline;" />
			</form>

		</div>

	</div>

	<form role="form" action="delete" method="post"></form>

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>

	<script>
		var objDiv = document.getElementById("SnsScroll");
		objDiv.scrollTop = objDiv.scrollHeight;

		var form = $('form[role="form"]');
		var input = $('<input>').attr({
			"name" : "sns_no",
			"type" : "hidden"
		});

		$('.deleteBtn').on('click', function(event) {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				input.attr("value", $(this).attr('value'));
				form.append(input);
				form.submit();
			} else {
				return;
			}
		});
	</script>

</body>