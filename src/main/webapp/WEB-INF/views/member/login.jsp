<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="container">
				<h3>LOGIN</h3>
			</div>
			<form action="/member/login" class="input-group" method="post">
				 <input type="text" name="userid" id="userid" class="input-field" placeholder="User name or Email" required autofocus> 
                 <input type="password" name="userpass" id="userpass" class="input-field" placeholder="Enter Password" required>
                 <input type="checkbox" class="checkbox" id="customCheck1" name="rememberMe" value="remember-me"><span>로그인	유지</span>
				<button class="submit" type="submit">Login</button>
				<div class="join">
					<a href="/member/findUser"> ID찾기</a>
					<a href="#!">| PW찾기 |</a>
					<a href="/member/join">회원가입</a><br />
					<br />
				</div>
			</form>
		</div>
	</div>
	<!-- JavaScript -->
   	<script src="/resources/js/jquery-3.6.0.js"></script>
    <script src="/resources/js/bootstrap.js"></script>
</body>
</html>