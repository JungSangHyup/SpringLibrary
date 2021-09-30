<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LOGIN</title>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='../member/login';
		})
	})
</script>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="container">
				<h4>아이디 찾기검색결과</h4>
			</div>
			<form action="/member/" class="input-group" method="post">
				<!--  <label for="name" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  이름 -> ex) 홍길동
                 </label>
				 <input type="text" name="username" id="username" class="input-field" placeholder="User name" required autofocus> -->
				 <h3>
                  	${userid}
				 </h3>
                 
				 <button class="toback" id=loginBtn>돌아 가기</button>
			</form>
		</div>
	</div>
	<!-- JavaScript -->
    <script src="/resources/js/bootstrap.js"></script>
</body>
</html>