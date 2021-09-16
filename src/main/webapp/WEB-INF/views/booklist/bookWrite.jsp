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
      <form name="form" id="book_form" role="form" method="post" action="/book/write">
        <div class="mb-3">
          <label for="name">이름</label>
          <input type="text" class="form-control" name="name" id="name" placeholder="제목을 입력해 주세요">
        </div>
        <div class="mb-3">
          <label for="writer">저작자</label>
          <input type="text" class="form-control" name="writer" id="writer" placeholder="이름을 입력해 주세요">
        </div>
        <div class="mb-3">
          <label for="price">가격</label>
          <input type="number" class="form-control" name="price" id="price" placeholder="0">
        </div>
        <div class="mb-3">
          <label for="content">내용</label>
          <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요"></textarea>
        </div>
        <div class="mb-3">
          <label for="page">페이지 수</label>
          <input type="number" class="form-control" name="page" id="page" placeholder="0">
        </div>
        <div class="mb-3">
          <label for="category">카테고리</label>
          <input type="text" class="form-control" name="category" id="category" placeholder="카테고리 코드를 입력하세요">
        </div>
        <button type="button" class="btn btn-primary m-2" id="btnAddFile">이미지 추가</button>
        <div id="fileBox"></div>
      </form>
      <div>
        <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
        <button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
      </div>
    </div>
  </article>
  	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp"/>

</body>
<script src="/resources/js/bootstrap.js"></script>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
  const MAX_FILE_COUNT = 5;
  let fileCount = 0;


  document.querySelector('#btnAddFile').addEventListener('click',
    () => {
      if (fileCount >= MAX_FILE_COUNT) {
        alert('첨부 파일은 최대 5개 까지만 가능합니다.')
        return;
      }

      document.querySelector('#fileBox').innerHTML += `
                    <div class="my-2">
                        <input type="file" class="form-control-file" id="exampleFormControlFile1" name="files">
                        <button type="button" class="btn btn-primary btn-sm delete-file">
                            <i class="material-icons-outlined">삭제</i>
                        </button>
                    </div>
                `;

      document.querySelectorAll('.delete-file').forEach(
        (e) => {
          e.addEventListener('click',
            () => {
              e.parentElement.remove();
              e.remove();
              fileCount--;
            })
        }
      )
      fileCount++;
    })
</script>
</html>