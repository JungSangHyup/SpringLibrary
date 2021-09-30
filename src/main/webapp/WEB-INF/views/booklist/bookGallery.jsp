<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="/WEB-INF/views/include/head.jsp"/>
  <title>Document</title>

</head>
<body class="wrap">
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
<div class="container">
  <div class="row">

    <div class="col-3 nav flex-column nav-pills bg_color" id="v-pills-tab" role="tablist" aria-orientation="vertical" >
	    <a class="nav-link" id="tab_new" data-toggle="pill"  role="tab" data-value="new"
	      aria-controls="v-pills-messages" aria-selected="false">신간</a>
	    <a class="nav-link" id="tab_health" data-toggle="pill"  role="tab" data-value="health"
	      aria-controls="v-pills-messages" aria-selected="false">건강/취미</a>
	    <a class="nav-link" id="tab_eco" data-toggle="pill"  role="tab" data-value="eco"
	      aria-controls="v-pills-messages" aria-selected="false" >경제/경영</a>
	    <a class="nav-link" id="tab_social" data-toggle="pill"  role="tab" data-value="social"
	      aria-controls="v-pills-settings" aria-selected="false" >사회/정치</a>
	    <a class="nav-link" id="tab_novel" data-toggle="pill"  role="tab" data-value="novel"
	      aria-controls="v-pills-settings" aria-selected="false" >소설/시</a>
	    <a class="nav-link" id="tab_art" data-toggle="pill"  role="tab" data-value="art"
	      aria-controls="v-pills-messages" aria-selected="false" >여행/예술</a>
	    <a class="nav-link" id="tab_it" data-toggle="pill" role="tab" data-value="it"
	      aria-controls="v-pills-settings" aria-selected="false" >IT모바일</a>
	    <a class="nav-link" id="tab_kids" data-toggle="pill" role="tab" data-value="kids"
	      aria-controls="v-pills-settings" aria-selected="false">유아</a>
    </div>


    <div class="col-9 bg_color" >
      <div class="row">
          <div class="custom-control custom-switch col-3">
              <input type="checkbox" class="custom-control-input rental_btn" id="rental_btn" data-value="all">
              <label class="custom-control-label m-2 " for="rental_btn">대여</label>
          </div>
        <!-- // 관리자만 보임 -->
          <button class="btn-primary text-right mt-3 mb-3 rounded" onclick="location.href='/book/write'">책 추가</button>
      </div>
      <!-- Page Content -->
      <div class="container">
		<div class="gallery row text-center text-lg-start">
        </div>
      </div>
	

		<!-- pagination -->
		<nav aria-label="..." class="row" style="float: none; margin:100 auto;">
          <div class="col-md-6" style="margin:0 auto;">
              <ul class="pagination">
                <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item" aria-current="page">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item">
                  <a class="page-link" href="#">다음</a>
                </li>
              </ul>
          </div>
        </nav>


    </div>
  </div>
</div>
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp"/>
	<script>
        let category = 'new';
        let is_rental = document.querySelector('.rental_btn').dataset.value;
        function get_query(){
            var url = document.location.href;
            var qs = url.substring(url.indexOf('?') + 1).split('&');
            for(var i = 0, result = {}; i < qs.length; i++)
            {
                qs[i] = qs[i].split('='); result[qs[i][0]] = decodeURIComponent(qs[i][1]);
            }
            return result;
        }
        function fetching(category, is_rental){
            var result = get_query();
            fetch('/api/book/list/' + category + '/' + is_rental + '/' + result["page"])
                .then((response) => {
                    return response.json();
                })
                .then((data) => {
                    let content = document.querySelector('.gallery');
                    let newcon = document.createElement('div');
                    data.forEach((value) => {
                        newcon.innerHTML += `
					  <div class="col-lg-3 col-md-4 col-6">
			            <a href="/book/content?num=${ value.bookId }">
						  <img class="img-fluid img-thumbnail" src="/display?sign=${ value.bookImg }" alt="">
			            </a>
			          </div>
					`;
                    })
                    content.innerHTML = newcon.innerHTML;
                })
        }

        // 첫 페이지 불러올 때 뿌려질 데이터
        document.addEventListener('DOMContentLoaded', fetching('new'));

        document.querySelector('.rental_btn').addEventListener('change', (e) => {
            is_rental = e.target.dataset.value;

            if(e.target.checked){
                e.target.dataset.value = 'rental'
            }else {
                e.target.dataset.value = 'all'
            }
            fetching(category, is_rental);
        })
	  
	  	document.querySelectorAll('#v-pills-tab a').forEach((e) => {
	  		e.addEventListener('click', (a) => {
	  			category = a.target.dataset.value;
	  			
	  			fetching(category);
	
	  		})
	  	})
	  </script>
</body>
</html>