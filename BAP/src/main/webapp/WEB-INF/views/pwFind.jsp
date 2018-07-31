<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
<head>


<style>
div#wrap {
	width: 960px;
	margin: 0 auto;
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>B.A.P P_M_S</title>
 <!--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/sap/resources/css/searchPw.css"> -->
</head>
 
<body>
<div id="wrap">
    <div >
        <form action="/login/pwFind" method="post">
            <h2 class="text-center">비밀번호 찾기</h2>
            <p class="text-center">
                아래 이메일주소를 입력하시면,<br> 입력하신 이메일로 새암호를 보내드립니다<br>
                <br>
          
                <input type="text" name="mem_id" placeholder="id" class="form-control" value="${param.id}"/>
           
                <input type="email" name="mem_mail" placeholder="email" class="form-control" value="${param.mail}" />
                <p class="help-block">'@'포함한 이메일주소를 정확히 입력해주세요.</p>
          
 
            <div class="form-group">
                <button  class="btn btn-primary" type="submit" style="display: inline;">발송하기</button>
                <a href="/login" class="btn btn-primary" style="display: inline;">뒤로가기</a>
            </div>  
        </form>
    </div>
    </div>
   
<script>
	var result = '${param.msg}';
	if(result != '') {
		alert('${param.msg}');
	}
	
	history.replaceState({}, null, location.pathname);
</script>

</body>
</html>