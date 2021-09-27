<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>

  <!-- Google Fonts and Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <!-- <link rel="stylesheet" href="/resources/css/bootstrap.css"> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/resources/css/join.css">
</head>
<body class="wrap">
	<!-- navbar  -->
    <jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	
	<!-- include sidebar -->
	
	<!-- middle container -->
	<div class="container mt-4">
		
		
		<!-- Contents area -->
          <div class="border border p-4" style="background: #ECE6CC;">
            <h5>회원 가입</h5>

            <hr class="featurette-divider">

            <form action="/member/join" method="POST" enctype="multipart/form-data">
              <div class="form-group row mb-2">
                <label for="id" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">account_box</i>
                  <span class="align-middle">아이디</span>
                </label>
                <div class="col-auto">
                  <input type="text" class="form-control" id="userid" aria-describedby="idHelp" name="userid" required autofocus>
                  <small id="idHelp" class="form-text text-muted">아이디는 필수 입력 요소입니다.</small>
                </div>
              </div>

              <div class="form-group row mb-2">
                <label for="password" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">lock</i>
                  <span class="align-middle">비밀번호</span>
                </label>
                <div class="col-auto">
                  <input type="password" class="form-control" id="userpass" aria-describedby="pwdHelp" name="userpass" required>
                  <small id="pwdHelp" class="form-text text-muted">비밀번호는 필수 입력 요소입니다.</small>
                </div>
              </div>
              <div class="form-group row mb-2">
                <label for="password2" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">check</i>
                  <span class="align-middle">비밀번호 재확인</span>
                </label>
                <div class="col-auto">
                  <input type="password" class="form-control" id="password2" aria-describedby="pwdHelp2" name="passwd2" required>
                  <small id="pwdHelp2" class="form-text text-muted">비밀번호 확인을 위해 다시 입력해주세요</small>
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="name" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">person</i>
                  <span class="align-middle">이름</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="text" class="form-control" id="username" name="username" required>
                </div>
              </div>
              
              <div class="form-group row">
                <label for="gender" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">wc</i>
                  <span class="align-middle">성별</span>
                </label>
                <div class="col-sm-9">
                  <div class="custom-control custom-radio custom-control-inline mt-2">
                    <input class="custom-control-input" type="radio" name="gender" id="genderRadio1" value="M" checked>
                    <label class="custom-control-label" for="genderRadio1">남자</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input class="custom-control-input" type="radio" name="gender" id="genderRadio2" value="F">
                    <label class="custom-control-label" for="genderRadio2">여자</label>
                  </div>
                </div>
              </div>

              <div class="form-group row">
                <label for="birthday" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">event</i>
                  <span class="align-middle">생년월일</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="date" class="form-control" id="birthday" name="birthday" required>
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="phNum" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">stay_current_portrait</i>
                  <span class="align-middle">연락처</span>
                </label>
                <div class="form-inline col-9 mt-1" id="phNum">
                  <select id="phNum1" class="form-control" name="userphone1" required>
                    <option selected disabled>선택</option>
                    <option>010</option>
                    <option>011</option>
                    <option>016</option>
                    <option>017</option>
                    <option>018</option>
                    <option>019</option>
                  </select>
                   - <input type="text" class="form-control col-2" id="phNum2" name="userphone2" required>
                   - <input type="text" class="form-control col-2" id="phNum3" name="userphone3" required>
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="address" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">home</i>
                  <span class="align-middle">주소</span>
                </label>
                <div class="col-sm-7 mt-1">
                  <input type="text" class="form-control mb-2" id="useraddr1" name="useraddr1">
                  <input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="상세주소 입력">
                </div>
              </div>

              

              <div class="form-group row">
                <label for="email" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">mail</i>
                  <span class="align-middle">이메일 주소</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="email" class="form-control" id="useremail" name="useremail">
                </div>
              </div>

              <div class="form-group row">
                <label for="email" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">mark_as_unread</i>
                  <span class="align-middle">SMS 수신동의</span>
                </label>
                <div class="col-sm-9 mt-2">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="recvRadio1" name="recvemail" class="custom-control-input" value="Y" checked>
                    <label class="custom-control-label" for="recvRadio1">동의함</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="recvRadio2" name="recvemail" class="custom-control-input" value="N">
                    <label class="custom-control-label" for="recvRadio2">동의 안함</label>
                  </div>
                </div>
              </div>

              <!--프로필등록-->
              <div class="form-group row">
                <label for="profile" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">account_circle</i>
                  <span class="align-middle">프로필 사진</span>
                </label>
                <div class="col-auto mt-2">
                  <div class="img_wrap">
                  	<img id="img" style="max-width: 200px; max-height: 200px;" />
                  </div>
                  <input type="file" name="profileimg" id="profileimg" accept="image/*">
                </div>
              </div>

              
              <div class="my-3 text-right">
                <button type="submit" class="btn btn-secondary">회원가입</button>
                <button type="reset" class="btn btn-secondary ml-3">다시입력</button>
                <button type="reset" class="btn btn-secondary ml-3" onclick="history.back()">취소</button>
              </div>
            </form>

          </div>
          <!-- end of Contents area -->
		
		
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />
<script>
	$('input#userid').on('focusout', function () {
		
		let userid = $(this).val();
		if (userid.length == 0) {
			return;
		}
		
		// ajax 함수 호출
		$.ajax({
			url: '/api/users/' + userid + '.json',
			method: 'GET',
			success: function (data) {
				console.log(typeof data);  // object
				console.log(data);  // {}
				
				if (data.count == 0) {
					$('small#idHelp').html('사용가능한 아이디 입니다.')
						.removeClass('text-muted').removeClass('text-danger')
						.addClass('text-success');
				} else { // data.count == 1
					$('small#idHelp').html('이미 사용중인 아이디 입니다.')
						.removeClass('text-muted').removeClass('text-success')
						.addClass('text-danger');
				}
			},
			error: function (request, status, error) {
				alert('code: ' + request.status + '\n message: ' + request.responseText + '\n error: ' + error);
			}
		});
		
		
	});
	
	//이미지 업로드 미리보기
	var sel_file;
	
	$(document).ready(function(){
		$("#profileimg").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("프로필은 이미피 파일만 가능합니다.");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	
	
	
	


</script>
</body>
</html>