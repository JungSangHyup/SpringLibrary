<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
$(document).on('click','#findId',function(){
	var username = $('#username').val();
 	var useremail = $('#useremail').val();

 	var postData = {'username' : username , 'useremail' : useremail};

	$.ajax({
        url:'/user/findId',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",

        success:function(data){
        	var idLists = data.userid;
        	var idLength = idLists.length
        	var idfind = idLists.substring(1, emailLength-1)
       	 		 $("#emailList").append("<h1>"+"회원님의 정보로 등록된 아이디는 : "+idfind+" 입니다.</h1>")

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});

</script>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="container">
				<h4>비밀번호 찾기</h4>
			</div>
			<form action="/member/findUser" class="input-group" method="post">
				 <label for="username" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  이름 -> ex) 홍길동
                 </label>
				 <input type="text" name="username" id="username" class="input-field" placeholder="User name" required autofocus>
				 <label for="userpass" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  아이디 -> ex) abc123
                 </label>
				 <input type="text" name="userpass" id="username" class="input-field" placeholder="User name" required autofocus>
				 <label for="email" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  이메일 -> ex) abc@abc.com
                 </label>
                 <input type="text" name="useremail" id="useremail" class="input-field" placeholder="User phonenumber" required>
				 <button id="findId" class="submit" type="submit">Search Password</button>
				 <button class="toback" onclick="history.back()">뒤로 가기</button>
			</form>
		</div>
	</div>
	<!-- JavaScript -->
    <script src="/resources/js/bootstrap.js"></script>
</body>
</html>