<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<style>

	#div1{
		height: 110px;
	}

 .divTable{  	  
	overflow-y: auto;
	height: 150px;
}

 tr {
	height:100px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="content">
	<div id="wrapper-main">
		<div class="container">
			<div class="row justify-content-center my-5">
				<!-- contents 내용 작성 -->
				<div id="div1" class="d-flex justify-content-between align-items-center" style="gap: 2rem;">
					<div  class="d-flex justify-content-center align-items-center"
						style="height: 60%; margin-left: 30px;
						background-color: #e6f0fa;
						padding: 12px 30px;
						border-radius: 12px;
						box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);">
						<h1 style="font-size: 2.5rem; margin: 0; color: #2c3e50; font-weight: 600;" class="fw-bold">${matchNum} 경기 리뷰</h1>
					</div>
				</div>
				<h1></h1>
				
				<div id="EditorWrapper" class="mb-2">
					<div id="idImageEditor" contenteditable="true" data-user="${user}" style="border: solid 1px; height: 200px;"></div>			
				</div>
				<div class="mb-2">
					<!-- <p id="idImageInput" contenteditable="true" style="border: solid 1px; height: 50px;"></p> -->
					<button id="idAddImage" type="button" class="btn btn-outline-info">이미지 넣기</button>
					<input type="file" name="tempFile" id="idImageInput">
					
				</div>
				
				<form id="idForm" action="./addReview" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="matchNum" value="${matchNum}">
					<input id="idBoardContent" type="hidden" name="boardContent">
					
					<button id="idSubmit" type="button" class="btn btn-outline-success">리뷰 등록</button>
					
				</form>
				
				
				
				<div id="idDivTable" class="divTable">
				<table class="table table-striped">
					<!-- <thead>
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>내용</th>
							<th>작성일</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead> -->
					<tbody id="idReviewTbody">
						<c:forEach items="${list}" var="v">
						<tr>
							<td>${v.reviewNum}</td>
							<td>${v.userId}</td>
							<td>${v.boardContent}</td>
							<td>${v.boardDate}</td>
							<td><button onclick="location.href='./updateReview?reviewNum=${v.reviewNum}&matchNum=${v.matchNum}'">
							수정</button></td>
							<td><button onclick="location.href='./deleteReview?reviewNum=${v.reviewNum}&matchNum=${v.matchNum}'">
							X</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				
				<nav aria-label="Page navigation example">
				<ul class="pagination">
					
					<li class="page-item">
					<button id="idNextPage" class="page-link" data-matchNum="${matchNum}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</button>
					</li>
					
				</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
		

<script src="/resources/js/matches/reviewEditor.js"></script>
<script src="/resources/js/matches/reviewPage.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>