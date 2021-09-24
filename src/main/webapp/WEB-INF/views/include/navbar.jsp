<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/mainstyle.css">	

<nav class="navbar navbar-expand-lg navbar-light ">
  <div class="container bg_color" >
    <a class="navbar-brand" href="/"> <i class="material-icons"></i>
      LIBRARY
    </a>

    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active"><a class="nav-link" href="/">Home</a>
        </li>
        


        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           도서목록 </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/book/list?category=new">책장</a>
            <a class="dropdown-item" href="/book/gallery">갤러리</a>
          </div>
        </li>

        <li class="nav-item"><a class="nav-link" href="/qnaboard/list">게시판</a>
        </li>
        
        <c:if test="${ not empty sessionScope.userid }"><%-- 로그인 했을때 --%>
				<li class="nav-item dropdown">
	              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                마이페이지
	              </a>
	              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	                <a class="dropdown-item" href="/member/myRental">대여도서관리</a>
	                <a class="dropdown-item" href="/member/myWish">찜목록</a>
	                <div class="dropdown-divider"></div>
	                <a class="dropdown-item" href="/member/beforeModify">내정보수정</a>
	                <a class="dropdown-item" href="/member/changePw">비밀번호 변경</a>
	                <a class="dropdown-item" href="/member/remove" style="color: red;">회원탈퇴</a>
	              </div>
	            </li>
			</c:if>

        <li class="nav-item"><a class="nav-link" href="/">문의사항</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      // make it as accordion for smaller screens

        document.querySelectorAll('.navbar .nav-item').forEach(function (everyitem) {

          everyitem.addEventListener('mouseover', function(e){

			let el_link = this.querySelector('a[data-bs-toggle]');

			if(el_link != null){
				let nextEl = el_link.nextElementSibling;
				el_link.classList.add('show');
				nextEl.classList.add('show');
			}

			});
			everyitem.addEventListener('mouseleave', function(e){
				let el_link = this.querySelector('a[data-bs-toggle]');
	
				if(el_link != null){
					let nextEl = el_link.nextElementSibling;
					el_link.classList.remove('show');
					nextEl.classList.remove('show');
				}
	
	
			})
        });

      // end if innerWidth
    });
	  // DOMContentLoaded  end
  </script>