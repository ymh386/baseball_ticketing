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
		<h1>리뷰 수정</h1>
		
		<div id="EditorWrapper">
			<div id="idImageEditor" contenteditable="true" style="border: solid 1px; height: 300px;">
				${dto.boardContent}
			</div>			
		</div>
		<div class="mb-2">
			<!-- <p id="idImageInput" contenteditable="true" style="border: solid 1px; height: 50px;"></p> -->
			<button id="idAddImage" type="button" class="btn btn-outline-info">이미지 넣기</button>
			<input type="file" name="tempFile" id="idImageInput">	
			
		</div>
		
		<form id="idFormToUpdate" action="./updateReview" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="matchNum" value="${dto.matchNum}">
			<input type="hidden" name="reviewNum" value="${dto.reviewNum}">
			<input id="idBoardContent" type="hidden" name="boardContent">
			
			<button id="idSubmit" type="button" class="btn btn-outline-success">수정하기</button>
			
		</form>
			
		
		
				
	</div>
</div>


<script src="/resources/js/matches/review.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>