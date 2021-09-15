<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>

  <!-- Google Fonts and Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <!-- <link rel="stylesheet" href="/resources/css/bootstrap.css"> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<!-- include navbar -->
	
	<!-- include sidebar -->
	
	<!-- middle container -->
	<div class="container mt-4">
		
		
		<!-- Contents area -->
          <div class="border border-info p-4 rounded">
            <h5>회원 가입</h5>

            <hr class="featurette-divider">

            <form action="/member/join" method="POST">
              <div class="form-group row mb-2">
                <label for="id" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">account_box</i>
                  <span class="align-middle">아이디</span>
                </label>
                <div class="col-auto">
                  <input type="text" class="form-control" id="id" aria-describedby="idHelp" name="id" required autofocus>
                  <small id="idHelp" class="form-text text-muted">아이디는 필수 입력 요소입니다.</small>
                </div>
              </div>

              <div class="form-group row mb-2">
                <label for="password" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">lock</i>
                  <span class="align-middle">비밀번호</span>
                </label>
                <div class="col-auto">
                  <input type="password" class="form-control" id="password" aria-describedby="pwdHelp" name="passwd" required>
                  <small id="pwdHelp" class="form-text text-muted">비밀번호는 필수 입력 요소입니다.</small>
                </div>
              </div>
              <div class="form-group row mb-2">
                <label for="password2" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">check</i>
                  <span class="align-middle">비밀번호 재확인</span>
                </label>
                <div class="col-auto">
                  <input type="password" class="form-control" id="password2" aria-describedby="pwdHelp2" name="passwd2" required>
                  <small id="pwdHelp2" class="form-text text-muted">비밀번호 확인을 위해 다시 입력해주세요</small>
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="name" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">person</i>
                  <span class="align-middle">이름</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="text" class="form-control" id="name" name="name" required>
                </div>
              </div>
              
              <div class="form-group row">
                <label for="gender" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">wc</i>
                  <span class="align-middle">성별</span>
                </label>
                <div class="col-sm-10">
                  <div class="custom-control custom-radio custom-control-inline mt-2">
                    <input class="custom-control-input" type="radio" name="genderChoice" id="inlineRadio1" value="M" checked>
                    <label class="custom-control-label" for="inlineRadio1">남자</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input class="custom-control-input" type="radio" name="genderChoice" id="inlineRadio2" value="F">
                    <label class="custom-control-label" for="inlineRadio2">여자</label>
                  </div>
                </div>
              </div>

              <div class="form-group row">
                <label for="birthday" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">event</i>
                  <span class="align-middle">생년월일</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="date" class="form-control" id="birthday" name="birthday">
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="name" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">stay_current_portrait</i>
                  <span class="align-middle">연락처</span>
                </label>
                <div class="form-inline col-auto mt-1">
                  <select id="inputState" class="form-control" required>
                    <option selected disabled>선택</option>
                    <option>010</option>
                    <option>011</option>
                    <option>016</option>
                    <option>017</option>
                    <option>018</option>
                    <option>019</option>
                  </select>
                   - <input type="text" class="form-control col-2" id="phNum" name="phNum2" required>
                   - <input type="text" class="form-control col-2" id="phNum" name="phNum3" required>
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="name" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">home</i>
                  <span class="align-middle">주소</span>
                </label>
                <div class="col-sm-10 mt-1">
                  <input type="text" class="form-control mb-2" id="address" name="address">
                  <input type="text" class="form-control" id="addressDetail" name="addressDetail" placeholder="상세주소 입력">
                </div>
              </div>

              

              <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">mail</i>
                  <span class="align-middle">이메일 주소</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="email" class="form-control" id="email" name="email" required>
                </div>
              </div>

              <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">mark_as_unread</i>
                  <span class="align-middle">SMS 수신동의</span>
                </label>
                <div class="col-sm-10 mt-2">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="customRadioInline1" name="recvEmail" class="custom-control-input" value="Y" checked>
                    <label class="custom-control-label" for="customRadioInline1">동의함</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="customRadioInline2" name="recvEmail" class="custom-control-input" value="N">
                    <label class="custom-control-label" for="customRadioInline2">동의 안함</label>
                  </div>
                </div>
              </div>

              
              <div class="my-3 text-right">
                <button type="submit" class="btn btn-primary">회원가입</button>
                <button type="reset" class="btn btn-secondary ml-3">다시입력</button>
                <button type="reset" class="btn btn-secondary ml-3">취소</button>
              </div>
            </form>

          </div>
          <!-- end of Contents area -->
		
		
	</div>

</body>
</html>