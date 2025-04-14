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

<style>
	.row {
		display: flex;
		justify-content: center;
	}

	.board-wrapper{
		width:1000px;
	}
	
	.file-wrapper {
		display: flex;
		flex-direction: column;
	}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="content">
<div class="wrapper-main">
	<div class="container">
		<div class="row my-5">
			<!-- contents 내용 작성 -->
			<div class="board-wrapper">
			
					
			        
					
				<div class="board-present border" style="background-color: white; padding: 15px; border-radius: 8px; font-size: 14px;">
				  <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap;">
				    <!-- 왼쪽: 제목 -->
				    <div class="title" style="font-size: 32px; font-weight: bold; margin-bottom: 5px; margin-top:15px;">
				      ${dto.boardTitle}
				    </div>
				
				    <!-- 오른쪽: 작성자 + 날짜/조회수 -->
				    <div style="text-align: right;">
				      <div class="user" style="margin-bottom: 5px;">
				        <strong style="font-size: 16px;">${dto.userId}님</strong>
				      </div>
				      <div class="sub" style="color: #999; font-size: 13px;">
				        ${dto.boardDate} &nbsp; 조회 ${dto.boardHit}
				      </div>
				    </div>
				  </div>
				</div>
		
				<div class="alert border my-1" role="alert" style="min-height: 60vh">
				  
						<c:if test="${kind eq 'notice'}">
						 	   <div>
						        <c:forEach items="${dto.boardFileDTOs}" var="f">
						            <img src="/resources/images/notice/${f.fileName}" 
						                 alt="${f.originalName}" 
						               style="width: 200px; height: 200px; display: block; margin: 0 auto 10px;">
						        </c:forEach>
						    </div>
							</c:if>
		
				  ${dto.boardContent}
				  
				</div>
				
				<!-- 파일 첨부란 -->
				
				<div class="file-wrapper border" style="min-height: 100px; padding: 15px;">
				  <c:if test="${dto.boardFileDTOs.size() eq 0}">
					  <div style="display: flex; justify-content: center; align-items: center; height: 70px;">
					  	<span style="color: silver">첨부 파일이 비어있습니다</span>
					  </div>
				  </c:if>
				  
				  <div class="attaches my-1" style="display: flex; flex-wrap: wrap; gap: 10px;">
				    <c:forEach items="${dto.boardFileDTOs}" var="f">
				      <a href="./fileDown?fileNum=${f.fileNum}" style="text-decoration: underline; color: #007bff;">${f.originalName}</a>
				    </c:forEach>
				  </div>
				
				  <div class="attaches my-1" style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;">
				    <c:forEach items="${dto.boardFileDTOs}" var="f">
				      <a href="/resources/images/${kind}/${f.fileName}" style="text-decoration: underline; color: #28a745;">${f.originalName}</a>
				    </c:forEach>
				  </div>
				  
				</div>
				
					
				<div class="wrapper-btn" style="height: 100px; display: flex; align-items: center; justify-content: flex-end; padding-right: 50px;">
				  <c:choose>
				    <c:when test="${kind eq 'notice' and sessionScope.user != null and sessionScope.user.userId eq 'admin'}">
				      <a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success" style="margin-left: 10px; padding: 12px 24px; font-size: 1.1rem;">수정</a>
				      <a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger" style="margin-left: 10px; padding: 12px 24px; font-size: 1.1rem;">삭제</a>
				    </c:when>
				
				    <c:when test="${kind eq 'qna' and sessionScope.user != null and sessionScope.user.userId eq dto.userId}">
				      <a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success" style="margin-left: 10px; padding: 12px 24px; font-size: 1.1rem;">수정</a>
				      <a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger" style="margin-left: 10px; padding: 12px 24px; font-size: 1.1rem;">삭제</a>
				    </c:when>
				  </c:choose>
				</div>
			</div>
			
				
		
		
				
		</div>
		
<%-- 		<div>			
			<a href="./update?boardNum=${dto.boardNum}" class="btn btn-outline-success">수정</a>
			<a href="./delete?boardNum=${dto.boardNum}" class="btn btn-outline-danger">삭제</a>
			
			<c:if test="${kind eq 'qna'}">
			<a href="./reply?boardNum=${dto.boardNum}" class="btn btn-outline-primary">답글</a>
			</c:if>
		</div>	 --%>
				
	
	</div>
	<!-- 보드 container 끝 -->
	
	<!-- 댓글 container 시작 -->
	<c:if test="${kind ne 'notice'}">		
		
		<div class="container">
			<div class="row my-5">
			
			<div class="board-wrapper">
				
			<form action="./addComment?boardNum=${dto.boardNum}" method="post" enctype="multipart/form-data">
			  <div style="display: flex; gap: 10px; align-items: center; margin-bottom: 15px;">

			  <!-- 댓글 입력창 -->
			  <textarea class="tt form-control" id="boardContent" name="boardContent"
			    style="flex: 1; resize: none; height: 100px;" placeholder="댓글을 입력하세요"></textarea>
			
			  <!-- 댓글 등록 버튼 -->
			  <button class="bb btn btn-primary" type="submit" id="commentSubmit" name="commentSubmit"
			    style="width: 100px; height: 100px;">댓글 등록</button>
			
			</div>

			</form>
							
				
			<!-- contents 내용 작성 -->
			
			<div class="댓글창 window-comments border" id="id-window-comment">

  <c:if test="${dto.commentDTOs.size() ne 0}">
    <c:forEach items="${dto.commentDTOs}" var="v">
      <!-- 댓글 반복문 -->
      <div class="댓글래퍼 wrapper-comments border">

        <div class="댓글 comments border" data-ref="${v.commentRef}" data-cnum="${v.commentNum}" data-bnum="${v.boardNum}" style="display: flex; align-items: center; gap: 10px; padding: 10px;">
  
		  <!-- 댓글 번호 및 번호 정보 -->
		  <span>${v.boardNum}</span>
		  <span>${v.commentNum}</span>
		  <span style="background-color: white;">${v.userId}</span>
		  
		  <!-- 댓글 내용 -->
		  <span style="flex: 1; background-color: white;">${v.boardContent}</span>
		  
		  <!-- 댓글 작성 날짜 -->
		  <span style="color: #777; font-size: 12px;">${v.boardDate}</span>
		
		  <!-- 답글 보기 버튼 -->
		  <span>
		    <c:forEach items="${list}" var="l">
		      <c:if test="${l.commentRef eq v.commentRef}">
		        <button class="ctcs" id="ctc${v.commentNum}" data-num="${v.commentNum}" data-check="1">답글 보기</button>
		      </c:if>
		    </c:forEach>
		  </span>
		
		  <!-- 답글 버튼 -->
		  <span>
		    <button class="답글 subWindowMakers" data-check="0" data-rnum="${v.commentRef}">답글</button>
		  </span>
		
		  <!-- 삭제 버튼 -->
		  <span>
		    <button onclick="location.href='./deleteComment?commentRef=${v.commentRef}&boardNum=${v.boardNum}&commentNum=${v.commentNum}'">X</button>
		  </span>
		
		</div>

        <div class="답글래퍼 wrapper-subComments border" id="idSubComment${v.commentNum}" data-num="${v.commentNum}">
          <!-- 답글 반복문 -->
        </div>
      </div>
    </c:forEach>
  </c:if>
</div>

			<!-- 댓글창 끝 -->
				
			</div>	
					
			</div>
		</div>
	
	</c:if>
</div>
</div>

	
<script src="/resources/js/qna/comment.js"></script>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>