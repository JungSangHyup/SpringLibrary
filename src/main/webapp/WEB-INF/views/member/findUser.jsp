<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="container">
				<h4>아이디 찾기</h4>
			</div>
			<form action="/member/findUser" class="input-group" method="post">
				 <label for="id" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  이름 -> ex) 홍길동
                 </label>
				 <input type="text" name="userid" id="userid" class="input-field" placeholder="User name" required autofocus>
				 <label for="id" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  이메일 -> ex) abc@abc.com
                 </label>
                 <input type="text" name="userphone" id="userphone" class="input-field" placeholder="User phonenumber" required>
				 <button class="submit" type="submit">Search ID</button>
				 <button class="toback" onclick="history.back()">뒤로 가기</button>
			</form>
		</div>
	</div>
	<!-- JavaScript -->
   	<script src="/resources/js/jquery-3.6.0.js"></script>
    <script src="/resources/js/bootstrap.js"></script>
</body>
</html>