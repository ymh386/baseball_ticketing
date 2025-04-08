<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/comments.css" />
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="continer-fluid my-5">
	<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
		<!-- contents 내용 작성 -->
		<h1>${kind} Detail Page</h1>
		
		<table class="table table-dark ">
			<thead>
				<tr >
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>${dto.boardTitle}</td>
					<td>${dto.userId}</td>
					<td>${dto.boardDate}</td>
					<td>${dto.boardHit}</td>
				</tr>
		
		</table>
		
		
		<div class="alert alert-primary" role="alert" style="min-height: 60vh">
		  
				<c:if test="${kind eq 'notice'}">
				 	   <div>
				        <c:forEach items="${dto.boardFileDTOs}" var="f">
				            <img src="/resources/images/notice/${f.fileName}" 
				                 alt="${f.originalName}" 
				               style="max-width: 1000px; height: auto; display: block; margin: 0 auto 10px;">
				        </c:forEach>
				    </div>
					</c:if>

		  ${dto.boardContent}
		  <img src="/resources/images/qna/dffaa971-caff-4e64-aeed-dac7b9f566da_img3.jpg">
		</div>
		
					
	
		<div>
			<c:forEach items="${dto.boardFileDTOs}" var="f">
				<a href="./fileDown?fileNum=${f.fileNum}">${f.originalName}</a>
			</c:forEach>
		</div>
		
		<div>
			<c:forEach items="${dto.boardFileDTOs}" var="f">
				<a href="/resources/images/${kind}/${f.fileName}">${f.originalName}</a>
			</c:forEach>
		</div>
		
		
		
				<div>
					<c:choose>
			  <c:when test="${kind eq 'notice' and sessionScope.user != null and sessionScope.user.userId eq 'wlsdnjs888'}">
			    <a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success">수정</a>
			    <a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger">삭제</a>
			  </c:when>
			
			  <c:when test="${kind eq 'qna' and sessionScope.user != null and sessionScope.user.userId eq dto.userId}">
			    <a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success">수정</a>
			    <a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger">삭제</a>
			  </c:when>
			</c:choose>
		</div>
		
		
	
		
<%-- 		<div>			
			<a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success">수정</a>
			<a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger">삭제</a>
			
			<c:if test="${kind eq 'qna'}">
			<a href="./reply?boardNum=${dto.boardNum}" class="btn btn-outline-primary">답글</a>
			</c:if>
		</div>	 --%>
				
	</div>
</div>


	
	<c:if test="${kind ne 'notice'}">
	
	
		<div class="container-fluid my-5">
			<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
			
		<form action="./addComment?boardNum=${dto.boardNum}" method="post" enctype="multipart/form-data">
			<label for="commentLabel" class="comment-label">내용</label>
			<span><textarea class="row col-md-12" id="boardContent" name="boardContent"></textarea></span>
			<span><button class="row col-md-12 mb-3" type="submit" id="commentSubmit" name="commentSubmit">댓글 등록</button></span>
		</form>
			
		<button id="testButton">테스트</button>	
		<!-- contents 내용 작성 -->
		
		<div class="댓글창 window-comments">
			<h1>댓글 리스트</h1>
		
			<c:forEach items="${dto.commentDTOs}" var="v">
			<!-- 댓글 반복문 -->
			<div class="댓글래퍼 wrapper-comments">
			
				<div class="댓글 comments" data-ref="${v.commentRef}">
					<span>${v.boardNum}</span>
					<span>${v.commentNum}</span>
					<span>${v.userId}</span>
					<span>${v.boardContent}</span>
					<span>${v.boardDate}</span>
					<span><button onclick="location.href='./deleteComment?commentNum=${v.commentNum}&boardNum=${v.boardNum}'">
						X</button></span>
					<span><button class="답글 addSubComments" data-rnum="${v.commentRef}" data-cnum="${v.commentNum}" data-bnum="${v.boardNum}">					
						답글</button></span>
					<span>
						<c:forEach items="${list}" var="l">
							<c:if test="${l.commentRef eq v.commentRef}">
								<button class='ctcs' id='ctc${v.commentNum}' data-num='${v.commentNum}' data-check='1'>답글 보기</button>	
							</c:if>
						</c:forEach>
					</span>
				</div>
				
				<div class="답글래퍼 wrapper-subComments" id="idSubComment${v.commentNum}" data-num="${v.commentNum}">
					<!-- 답글 반복문 -->
					
					
				</div>
			</div>
			</c:forEach>
		</div>
		
		
			
	</div>
</div>

</c:if>

<script src="/resources/js/qna/comment.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>