<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchID</title>
<script src="/resources/js/jquery-3.6.0.js"></script>

<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="container">
				<h4>아이디 찾기</h4>
			</div>
			<form action="/member/find_Id" class="input-group" method="post">
				<!--  <label for="name" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  이름 -> ex) 홍길동
                 </label>
				 <input type="text" name="username" id="username" class="input-field" placeholder="User name" required autofocus> -->
				 <label for="email" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  이메일 -> ex) abc@abc.com
                 </label>
                 <input type="text" name="useremail" id="useremail" class="input-field" placeholder="User phonenumber" required>
				 <button id="findId" class="submit" type="submit">Search ID</button>
				 <button class="toback" onclick="history.back()">뒤로 가기</button>
			</form>
		</div>
	</div>
	<!-- JavaScript -->
    <script src="/resources/js/bootstrap.js"></script>
</body>
</html>