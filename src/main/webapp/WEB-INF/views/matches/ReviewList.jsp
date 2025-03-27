<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="container-fluid my-5">
	<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
		<!-- contents 내용 작성 -->
		<h1>리뷰 리스트</h1>
		
		<div id="EditorWrapper">
			<P id="idImageEditor" contenteditable="true" style="border: solid 1px; height: 300px;"><img src="/resources/images/qna/d338deb8-c682-4eaa-8ecc-9ee1f95f5aff_img1.jpg"></P>			
		</div>
		<div>
			<p id="idImageInput" contenteditable="true" style="border: solid 1px; height: 50px;"></p>
		</div>
		
		<form id="idForm" action="./addReview" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="matchNum" value="${matchNum}">
			<input id="idBoardContent" type="hidden" name="boardContent">
			
			<button id="idSubmit" type="button" class="btn btn-outline-success">리뷰 등록</button>
			<button id="idAddImage" type="button" class="btn btn-outline-info">이미지 넣기</button>
		</form>
			
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="v">
				<tr>
					<td>${v.reviewNum}</td>					
					<td>${v.userId}</td>
					<td>${v.boardContent}</td>
					<td>${v.boardDate}</td>
					<td><button onclick="location.href='./deleteReview?reviewNum=${v.reviewNum}&matchNum=${v.matchNum}'">
					X</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
				
	</div>
</div>


<script src="/resources/js/matches/review.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>