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

		<input type="hidden" name="risk_no" value="${riskDTO.risk_no}">

	</form>

	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> <input type="text"
				name="risk_title" class="form-control"
				value="${riskDTO.risk_title}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea class="form-control" name="risk_content" rows="10"
				readonly="readonly">${riskDTO.risk_content}</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">프로젝트 번호</label> <input type="text"
				name="pro_num" class="form-control"
				value="${riskDTO.pro_num}" readonly="readonly" style="width:150px;">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label> <input type="text"
				name="mem_id" class="form-control" value="${riskDTO.mem_name}"
				readonly="readonly" style="width:150px;">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">승인여부</label> <input type="text"
				name="risk_status" class="form-control"
				value=
				<c:if test="${riskDTO.risk_status == 0}">대기중</c:if> 
				<c:if test="${riskDTO.risk_status == 1}">승인됨</c:if> 
				
				readonly="readonly" style="width:150px;">
		</div>
	</div>

	<div class="box-footer">
		<c:if test="${loginUser.mem_id eq 'ccc'}">	
			<button type="submit" class="btn btn-warning">수정</button>
		</c:if>	
		<button type="submit" class="btn btn-danger">삭제</button>
		<button type="submit" class="btn btn-primary">뒤로</button>
	</div>
	
	<hr>
	<hr>
	
	<div>
		<div class="row">
			<div class="col-md-12">
				<div class="box-box-success">
					<div  style="width:700px; margin-left:120px;">
					<div class="info-box mb-3 bg-info" >
             			 <span class="info-box-icon"><i class="fa fa-comment-o"></i></span>
              			<div class="info-box-content"  >
                		<span class="info-box-text"><Strong>ADD_the_Reply</Strong></span>
                		<span class="info-box-text"><Strong>승인여부와 반려사유가 있다면 추가적으로 적어주세요.</Strong></span>
                		
             		</div></div>
             		 <!-- /.info-box-content -->
            		</div>
					<div class="box-body">
						<label for="newReplyWriter">Reply_작성자</label>
						<input class="form-control" type="text" placeholder="${loginUser.mem_name}"
						id="mem_name" style="width:500px;" readonly>
						<label for="newReplyText" style="margin-top:10px;" >Reply_내용</label>
						<input class="form-control" type="text"
						placeholder="내용을 적으세요." id="risk_reply_content" style="width:800px;">
						<input type="hidden" id="mem_id2" name="mem_id" value="${loginUser.mem_id}">

					</div>
	<hr>
	
					<div class="box-footer">
						<button type="button" onclick="commentInsert()" class="btn btn-primary2" id="replyAddbtn">ADD REPLY</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="commentList"></div>
	    
   
   
</section>
<!-- /.content -->
	


	<!-- cri 정보 이동할 페이지로 전달 -->
	<form role="form">
		<input type='hidden' name="page" value="${cri.page}">
		<input type='hidden' name="perPageNum" value="${cri.perPageNum}">
		<input type='hidden' name="searchType" value="${cri.searchType}">
		<input type='hidden' name="keyword" value="${cri.keyword}">
		<input type='hidden' name="risk_no" value="${riskDTO.risk_no}">
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
				formObj.attr("action", "/task/list");
				formObj.attr("method", "get");
				formObj.submit();
			});
		});
	</script>
	
	<script>
	var risk_no = '${riskDTO.risk_no}'; //게시글 번호
 
	$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
   	 var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
   	 commentInsert(insertData); //Insert 함수호출(아래)
	});
 
 
 
	//댓글 목록 
	function commentList(){
		
	    $.ajax({
	        url : '/comment/list',
	        type : 'get',
	        data : {'risk_no':'${riskDTO.risk_no}'},
	        success : function(data){
	            var a =''; 
	            $(".commentList").html("");
	            $.each(data, function(key, value){ 
	            	
	                a += '<div class="commentArea" >';
	                a += '<div style="width:600px;border-bottom:1px solid darkgray; margin-top: 10px; background-color:#f8f9fa;'

	                a += '<div class "="commentInfo'+value.risk_reply_no+'">'+'작성자 : '+value.mem_name+"";
	                a += '<button type="button" style="margin-left:50px; margin-top:10px;" class="btn btn-danger" onclick="commentDelete('+value.risk_reply_no+');"> 삭제 </a> </div>';
	                a += '<div class ="commentContent'+value.risk_reply_no+'" style="margin-left:0px; margin-top:10px;"> <p> 내용 : '+value.risk_reply_content +'</p>';
	               
	                a += '</div></div></div>';
	            	});
	            
	        	    $(".commentList").append(a);
	    	   		 }
	    		});
        	
	}
 
	//댓글 등록
	function commentInsert(){
		var mem_id=$('#mem_id2').val();
		var content=$('#risk_reply_content').val();
		var reply={
				"risk_no":risk_no,
				"mem_id":mem_id,
				"risk_reply_content":content
				};
	
    	$.ajax({
        	url : '/comment/insert',
        	type : 'post',
        	data :reply,        	
        	success : function(data){            	           
        			    alert("댓글이 등록되었습니다.");
            			commentList(); //댓글 작성 후 댓글 목록 reload                		
            		 
        	}
    	});
	}
 
	
 
	
 
	//댓글 삭제 
	function commentDelete(risk_reply_no){
    	$.ajax({
        	url : '/comment/delete/'+risk_reply_no,
        	type : 'post',
        	success : function(data){
        		alert("댓글이 삭제되었습니다.");
    			commentList(); //댓글 작성 후 댓글 목록 reload  
        	}
    		});
		}
 
 
 
 
	$(document).ready(function(){
 	   commentList(); //페이지 로딩시 댓글 목록 출력 
	});
 
 
 
</script>


</div>
</div>
</body>

</html>
