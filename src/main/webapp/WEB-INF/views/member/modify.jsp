<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원정보 수정</title>

  <!-- Google Fonts and Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <!-- <link rel="stylesheet" href="/resources/css/bootstrap.css"> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/resources/css/modify.css">
</head>
<body class="wrap">
    <!-- navbar  -->
    <jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	
	<!-- include sidebar -->


    <!-- middle container -->
    <div class="container mt-4">
        <div class="row">
        <!-- left area -->
        <div class="col-sm-3">
            <!-- Vertical Nav -->
            <nav class="navbar" style="background: #ECE6CC;">
              <span class="navbar-brand mb-0 h1" style="white-space:nowrap; margin: auto;">마이페이지</span>
            </nav>
            <ul class="nav flex-column nav-pills" style="background: #ECE6CC; white-space:nowrap;">
              <li class="nav-item">
                <a class="nav-link" href="/member/rental" style="color: black;">
                  <i class="material-icons align-middle">menu_book</i> 대여도서관리</a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/myWish" style="color: black;">
                <i class="material-icons align-middle">bookmarks</i> 찜목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="background-color: #2f3542;">
                <i class="material-icons align-middle">build_circle</i> 회원정보수정</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/changePw" style="color: black;">
                <i class="material-icons align-middle">vpn_key</i> 비밀번호 변경</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/remove" style="color: black;">
                <i class="material-icons align-middle">clear</i> 회원탈퇴</a>
            </li>
          </ul>
          <!-- end of Vertical Nav -->

        </div>
        <!-- left area end -->


        <!-- right area -->
        <div class="col-sm-9">
            <!-- Contents area -->
          <div class="border border p-4" style="background: #ECE6CC;">
            <form action="/member/modify" method="POST" enctype="multipart/form-data">
            <h3>회원정보수정</h3>
              <hr>
              <div class="form-group row mb-2">
                <label for="id" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">account_box</i>
                  <span class="align-middle">아이디</span>
                </label>
                <div class="col-auto">
                  <input type="text" class="form-control" id="id" aria-describedby="idHelp" name="id" value="${sessionScope.userid}" disabled>
                  <small id="idHelp" class="form-text text-muted">아이디는 변경할 수 없습니다.</small>
                </div>
              </div>


              <div class="form-group row mb-3">
                <label for="name" class="col-sm-3 col-form-label"style="white-space:nowrap;">
                  <i class="material-icons align-middle">person</i>
                  <span class="align-middle">이름</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="text" class="form-control" id="username" name="username" value="${sessionScope.username}" required>
                </div>
              </div>
              
              <div class="form-group row">
                <label for="gender" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">wc</i>
                  <span class="align-middle">성별</span>
                </label>
                <div class="col-sm-9">
                  <c:if test="${sessionScope.gender eq 'M'}">
                  <div class="custom-control custom-radio custom-control-inline mt-2">
                    <input class="custom-control-input" type="radio" name="gender" id="genderRadio1" value="M" checked>
                    <label class="custom-control-label" for="genderRadio1">남자</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input class="custom-control-input" type="radio" name="gender" id="genderRadio2" value="F">
                    <label class="custom-control-label" for="genderRadio2">여자</label>
                  </div>
                  </c:if>
                  <c:if test="${sessionScope.gender eq 'F'}">
                  <div class="custom-control custom-radio custom-control-inline mt-2">
                    <input class="custom-control-input" type="radio" name="gender" id="genderRadio1" value="M">
                    <label class="custom-control-label" for="genderRadio1">남자</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input class="custom-control-input" type="radio" name="gender" id="genderRadio2" value="F" checked>
                    <label class="custom-control-label" for="genderRadio2">여자</label>
                  </div>
                  </c:if>
                </div>
              </div>

              <div class="form-group row">
                <label for="birthday" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">event</i>
                  <span class="align-middle">생년월일</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="date" class="form-control" id="birthday" name="birthday" value="${sessionScope.birthday}" required>
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="userphone" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">stay_current_portrait</i>
                  <span class="align-middle">연락처</span>
                </label>
                <div class="form-inline col-sm-9 mt-1" id="userphone">
                  <select id="userphone1" class="form-control" name="userphone1">
                  <c:choose>
                  	<c:when test="${sessionScope.userphone1 eq '010'}">
                  		<option selected>010</option>
	                    <option>011</option>
	                    <option>016</option>
	                    <option>017</option>
	                    <option>018</option>
	                    <option>019</option>
                  	</c:when>
                  	<c:when test="${sessionScope.userphone1 eq '011'}">
                  		<option>010</option>
	                    <option selected>011</option>
	                    <option>016</option>
	                    <option>017</option>
	                    <option>018</option>
	                    <option>019</option>
                  	</c:when>
                  	<c:when test="${sessionScope.userphone1 eq '016'}">
                  		<option>010</option>
	                    <option>011</option>
	                    <option selected>016</option>
	                    <option>017</option>
	                    <option>018</option>
	                    <option>019</option>
                  	</c:when>
                  	<c:when test="${sessionScope.userphone1 eq '017'}">
                  		<option>010</option>
	                    <option>011</option>
	                    <option>016</option>
	                    <option selected>017</option>
	                    <option>018</option>
	                    <option>019</option>
                  	</c:when>
                  	<c:when test="${sessionScope.userphone1 eq '018'}">
                  		<option>010</option>
	                    <option>011</option>
	                    <option>016</option>
	                    <option>017</option>
	                    <option selected>018</option>
	                    <option>019</option>
                  	</c:when>
                  	<c:when test="${sessionScope.userphone1 eq '019'}">
                  		<option>010</option>
	                    <option>011</option>
	                    <option>016</option>
	                    <option>017</option>
	                    <option>018</option>
	                    <option selected>019</option>
                  	</c:when>
                  	<c:otherwise>
                  		<option selected disabled>선택</option>
	                    <option>010</option>
	                    <option>011</option>
	                    <option>016</option>
	                    <option>017</option>
	                    <option>018</option>
	                    <option>019</option>
                  	</c:otherwise>
                  </c:choose>
                  </select>
                   - <input type="text" class="form-control col-2" id="userphone2" name="userphone2" value="${sessionScope.userphone2}">
                   - <input type="text" class="form-control col-2" id="userphone3" name="userphone3" value="${sessionScope.userphone3}">
                </div>
              </div>

              <div class="form-group row mb-3">
                <label for="address" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">home</i>
                  <span class="align-middle">주소</span>
                </label>
                <div class="col-sm-7 mt-1">
                  <input type="text" class="form-control mb-2" id="useraddr1" name="useraddr1" value="${sessionScope.useraddr1}">
                  <input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="상세주소 입력" value="${sessionScope.useraddr2}">
                </div>
              </div>

              

              <div class="form-group row">
                <label for="email" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">mail</i>
                  <span class="align-middle">이메일 주소</span>
                </label>
                <div class="col-auto mt-1">
                  <input type="email" class="form-control" id="useremail" name="useremail" value="${sessionScope.useremail}">
                </div>
              </div>

              <div class="form-group row">
                <label for="email" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">mark_as_unread</i>
                  <span class="align-middle">SMS 수신동의</span>
                </label>
                <div class="col-sm-9 mt-2">
                  <c:if test="${sessionScope.recvemail eq 'Y'}">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="recvRadio1" name="recvemail" class="custom-control-input" value="Y" checked>
                    <label class="custom-control-label" for="recvRadio1">동의함</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="recvRadio2" name="recvemail" class="custom-control-input" value="N">
                    <label class="custom-control-label" for="recvRadio2">동의 안함</label>
                  </div>
                  </c:if>
                  <c:if test="${sessionScope.recvemail eq 'N'}">
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="recvRadio1" name="recvemail" class="custom-control-input" value="Y">
                    <label class="custom-control-label" for="recvRadio1">동의함</label>
                  </div>
                  <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="recvRadio2" name="recvemail" class="custom-control-input" value="N" checked>
                    <label class="custom-control-label" for="recvRadio2">동의 안함</label>
                  </div>
                  </c:if>
                </div>
              </div>

              

			<c:choose>
			<c:when test="${sessionScope.profile eq 'default'}">
			<!--프로필변경-->
              <div class="form-group row">
                <label for="profile" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">account_circle</i>
                  <span class="align-middle">프로필 사진</span>
                </label>
                <div class="col-auto mt-2" id="imgGroup">
                <input type="hidden" id="hdn" name="oldProfile" value="${sessionScope.profile}">
                  <div class="img_wrap" id="imgBox">
                  	<img id="img" src="/resources/images/default_profile.jpg" style="max-width: 200px; max-height: 200px;" />
                  	<button type="button" class="btn btn-danger delete-oldprofile">삭제</button>
                  </div>
                  <div id="newProfileBox"></div>
                  <input type="file" name="profileimg" id="profileimg" accept="image/*" value="${sessionScope.profile}">
                </div>
              </div>
			</c:when>
			<c:otherwise>
			<!--프로필변경-->
              <div class="form-group row">
                <label for="profile" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">account_circle</i>
                  <span class="align-middle">프로필 사진</span>
                </label>
                <div class="col-auto mt-2" id="imgGroup">
                <input type="hidden" id="hdn" name="oldProfile" value="${sessionScope.profile}">
                  <div class="img_wrap" id="imgBox">
                  	<img id="img" src="/view?sign=${sessionScope.profile}" style="max-width: 200px; max-height: 200px;" />
                  	<button type="button" class="btn btn-danger delete-oldprofile">삭제</button>
                  </div>
                  <div id="newProfileBox"></div>
                  <input type="file" name="profileimg" id="profileimg" accept="image/*" value="${sessionScope.profile}">
                </div>
              </div>
			</c:otherwise>
			</c:choose>
              
              <div class="my-3 text-right">
                <button type="submit" class="btn btn-secondary">변경하기</button>
                <button type="reset" class="btn btn-secondary ml-3">취소</button>
              </div>
            </form>

          </div>
          <!-- end of Contents area -->
        </div>
        <!-- right area end -->
    </div>
    </div>
    <!-- middle container end -->
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />

    
<script>
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
				$('#hdn').attr('name', 'nonedel');
			}
			reader.readAsDataURL(f);
		});
	}
	
	//프로필 삭제 (현재 프로필을 default_profile로 변경)
	$('button.delete-oldprofile').on('click', function(event){
		$(this).parent().prev().prop('name', 'delfile');
		var str = '/resources/images/default_profile.jpg';
		
		$('#img').attr("src", str);
	});
	
</script>
    

</body>
</html>