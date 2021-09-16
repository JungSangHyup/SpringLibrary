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
			<form action="/" class="input-group">
				<input type="text" class="input-field"
					placeholder="User name or Email" required> <input
					type="password" class="input-field" placeholder="Enter Password"
					required> <input type="checkbox" class="checkbox"><span>로그인
					유지</span>
				<button class="submit">Login</button>
				<div class="join">
					<a href="#!"> ID찾기</a> <a href="#!">| PW찾기 |</a> <a
						href="/member/join">회원가입</a><br />
					<br />
				</div>
			</form>
		</div>
	</div>
	<!-- JavaScript -->
   
    
    
</body>
</html>