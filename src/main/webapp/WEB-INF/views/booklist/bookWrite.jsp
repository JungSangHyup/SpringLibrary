<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html lang="en">
  <head>
	<jsp:include page="/WEB-INF/views/include/head.jsp"/>
    <title>Document</title>
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
          <label for="content">설명</label>
          <textarea class="form-control" rows="5" name="bookDes" id="des" placeholder="내용을 입력해 주세요"></textarea>
        </div>
        <div class="mb-3">
          <label for="content">상세설명</label>
          <textarea class="form-control" rows="5" name="bookDetail" id="detail" placeholder="내용을 입력해 주세요"></textarea>
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
		<div class="my-2 attachPic">
          <h5>이미지 추가하기</h5>
          <button type="button" class="btn btn-primary" id="btnAddFile">파일 추가</button>
          <div id="fileBox"></div>
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
	const MAX_FILE_COUNT = 5;
    let fileCount = 0;


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