<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="/resources/css/bootstrap.css">

	

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
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
          <a class="nav-link  dropdown-toggle" href="#" data-bs-toggle="dropdown"> 도서목록 </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/book/list">책장</a></li>
            <li><a class="dropdown-item" href="/book/gallery">갤러리</a></li>
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="/qnaboard/list">게시판</a>
        </li>

        <li class="nav-item"><a class="nav-link" href="/">문의사항</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
  integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script>
  document.addEventListener("DOMContentLoaded", function(){
	// make it as accordion for smaller screens
	  if (window.innerWidth > 992) {

	  	document.querySelectorAll('.navbar .nav-item').forEach(function(everyitem){

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

	  }
	  // end if innerWidth
	  }); 
	  // DOMContentLoaded  end
</script>