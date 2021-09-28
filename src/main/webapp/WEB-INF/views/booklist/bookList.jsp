<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
   
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
      <div class="col-9 bg_color">
        <div class="row">
          <div class="custom-control custom-switch col-3">
            <input type="checkbox" class="custom-control-input rental_btn" id="rental_btn" data-value="all">
            <label class="custom-control-label m-2 " for="rental_btn">대여</label>
          </div>
          <!-- // 관리자만 보임 -->
          <button class="btn-primary text-right mt-3 mb-3 rounded" onclick="location.href='/book/write'">책 추가</button>


			<!-- Page Content -->
          <div id="book_content" class="container">

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
                  let content = document.querySelector('#book_content');
                  let newcon = document.createElement('div');



                  if(data.length != 0){
                      data.forEach((value) => {
                          newcon.innerHTML +=
                              `
						  <div class="card mb-3">
			               <div class="row no-gutters">
			                 <div class="col-md-4">
			                   <a href="/book/content?num=${ value.bookId }&page=${ result["page"] }">
			                     <img src="/display?sign=${ value.bookImg }" alt="..." style="max-width: 180px;">
			                   </a>
			                 </div>
			                 <div class="col-md-8">
			                   <div class="card-body">
			                     <h5 class="card-title">${ value.bookName }</h5>
								 <p class="card-text">${value.bookDes}</p>

						`;
                          if(value.bookIsbn === 'N'){
                              newcon.innerHTML += `
									<a class="btn btn-danger disabled">
			                     		대여 불가능
			                   		</a>
				                 </div>
				               </div>
				             </div>
							</div>`
                          }else {
                              newcon.innerHTML += `
									<a href="/book/content?num=${ value.bookId}" class="btn btn-primary">
		                     			대여 가능
		                   			</a>
									</div>
								  </div>
							    </div>
						      </div>`
                          }
                      })
                  }else {
                      newcon.innerHTML = `
					    <div class="card mb-3">
	                     <div class="row no-gutters">
	                       <div class="col-md-4">
	                           <img src="/resources/images/default_book.jpg" alt="..." style="max-width: 180px;">
	                       </div>
	                       <div class="col-md-8">
	                         <div class="card-body">
	                           <h5 class="card-title">책이 없습니다.</h5>
	                           <p class="card-text"></p>
	                         </div>
	                       </div>
	                     </div>
	                   </div>
					`;
                  }
                  content.innerHTML = newcon.innerHTML;
              })
      }


      // 첫 페이지 불러올 때 뿌려질 데이터
      document.addEventListener('DOMContentLoaded', fetching('new', is_rental));


      // 버튼을 누를 때 마다 불러옴
      document.querySelector('.rental_btn').addEventListener('change', (e) => {


          if(e.target.checked){
              e.target.dataset.value = 'rental'
          }else {
              e.target.dataset.value = 'all'
          }
          is_rental = e.target.dataset.value;
          fetching(category, is_rental);
      })


      // 탭을 누를 때 마다 바뀜
  	document.querySelectorAll('#v-pills-tab a').forEach((e) => {
  		e.addEventListener('click', (a) => {
  			category = a.target.dataset.value;
            fetching(category, is_rental);
  		})
  	})

  </script>
</body>
</html>