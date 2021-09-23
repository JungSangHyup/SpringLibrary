<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/mainstyle.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
  </head>
<body>
<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
  <article>
    <div class="container" role="main" style="background: #ECE6CC;">
      <h2>책 올리기</h2>
      <hr>
      <form name="form" id="book_form" method="post" action="/book/write" enctype="multipart/form-data">
        <div class="mb-3">
          <label for="name">이름</label>
          <input type="text" class="form-control" name="bookName" id="name" placeholder="제목을 입력해 주세요">
        </div>
        <div class="mb-3">
          <label for="writer">저작자</label>
          <input type="text" class="form-control" name="bookWriter" id="writer" placeholder="이름을 입력해 주세요">
        </div>
        <div class="mb-3">
          <label for="price">가격</label>
          <input type="number" class="form-control" name="bookPrice" id="price" placeholder="0">
        </div>
        <div class="mb-3">
          <label for="content">내용</label>
          <textarea class="form-control" rows="5" name="bookDes" id="des" placeholder="내용을 입력해 주세요"></textarea>
        </div>
        <div class="mb-3">
          <label for="page">페이지 수</label>
          <input type="number" class="form-control" name="bookPage" id="page" placeholder="0">
        </div>
        <div class="mb-3">
          <label for="category">카테고리</label>
          <input type="text" class="form-control" name="categoryCode" id="category" placeholder="카테고리 코드를 입력하세요">
        </div>
        <div class="my-2 profilePic">
          <h5>표지 이미지</h5>
          <input type="file" class="form-control-file" id="book_file" name="book_file">
        </div>

        <button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
        <button type="reset" class="btn btn-sm btn-primary">초기화</button>
        <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="history.back();">목록</button>
      </form>
    </div>
  </article>
  	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp"/>
</body>
<script src="/resources/js/bootstrap.js"></script>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
    document.getElementById('book_file').addEventListener('change', (e) => {
        let file = e.target.files[0]; //선택된 파일
        console.log(file);
        let reader = new FileReader();
        reader.readAsDataURL(file); //파일을 읽는 메서드

        reader.onload = function () {
            let photoFrame = document.createElement("div");
            let profileFrame = document.querySelector('.photoFrame');

            if (profileFrame) {
                profileFrame.style = 'background : url(' + reader.result + '); background-size : cover; width: 250px; height: 250px;';
            } else {
                photoFrame.style = 'background : url(' + reader.result + '); background-size : cover; width: 250px; height: 250px;';
                photoFrame.className = "photoFrame";
                document.querySelector('.profilePic').appendChild(photoFrame);
            }
        }
    });
</script>
</html>