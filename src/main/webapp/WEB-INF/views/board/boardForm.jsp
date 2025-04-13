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
	#div1 {
		height: 110px;
	}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="content">
	<div class="wrapper-main">
		<div class="container my-5">
		<div class="row">
			<!-- contents 내용 작성 -->
			
			<div id="div1" class="d-flex justify-content-between align-items-center" style="gap: 2rem;">
			    <!-- 제목 영역 -->
			    <div  class="d-flex justify-content-center align-items-center"
				     style="height: 60%; margin-left: 30px;
				            background-color: #e6f0fa;
				            padding: 12px 30px;
				            border-radius: 12px;
				            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);">
				    
				    <h1 style="font-size: 2.5rem; margin: 0; color: #2c3e50; font-weight: 600;">
				        <c:if test="${kind == 'notice'}">
				        	공지사항
				        </c:if>
				        <c:if test="${kind == 'qna'}">
				        	QnA
				        </c:if>
				    </h1>
				</div>
			</div>
			
			<form action="" method="post" enctype="multipart/form-data">
			  <input type="hidden" name="boardNum" value="${dto.boardNum}">
			  		  
			  <div class="mb-3">
			    <label for="boardTitle" class="form-label">제목</label>
			    <input type="text" value="${dto.boardTitle}" name="boardTitle" placeholder="글제목" class="form-control" id="boardTitle">
			  </div>
			  
			  <div class="mb-3">
				<label for="boardContents" class="form-label">내용</label>
				<textarea class="form-control" name="boardContent" id="boardContent" rows="10">${dto.boardContent}</textarea>
			   </div>
			   
			   <!-- dto 안에 있는 boardFileDTO들을 뿌려줌 -->
			   <div class="mb-3">
			   	<c:forEach items="${dto.boardFileDTOs}" var="f">
			   		<div class="alert alert-success" role="alert">
	  					${f.originalName} <button type="button" data-file-num="${f.fileNum}" data-kind="${kind}" class="btn btn-outline-light badge text-bg-secondary file-delete">X</button>
					</div>
			   	</c:forEach>
			   </div>
			   
			   <div id="files" class="mb-3" data-files-size="${dto.boardFileDTOs.size()}">
					<div class="mb-3">
						<button class="btn btn-success" type="button" id="add_file">파일추가</button>
					</div>
			   </div>
	
			  <button type="submit" class="btn btn-primary">글 작성</button>
			</form>
			
		</div>
		</div>
	</div>
</div>

	

<script src="/resources/js/files/fileManager.js"></script>
<script src="/resources/js/files/fileDelete.js"></script>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>