<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/liststyle.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- navbar  -->
    
    
<div class="container">
    <h1>Book Search</h1>
    <form action="#">
     <div class="search_box">
         
	<select name="keyword" id="keyword-select">
        <option value="subject">제목</option>
        <option value="user">글쓴이</option>
        <option value="content">내용</option>
    </select>
         <i class="fa fa-search"></i>
    <input class="search" type="text" id="search" name="search">
    <button class="search_btn" type="button" name="search_btn">검색</button>
    </div>
    </form>
</div>
    
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">First</th>
				<th scope="col">Last</th>
				<th scope="col">Handle</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
			</tr>
		</tbody>
	</table>
    
    <button class="write_btn" type="button" name="write_btn">글쓰기</button>

    
    <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
<!-- footer -->

</body>
</html>

