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

	.row {
		display: flex;
		justify-content: center;
	}

	.board-wrapper{
		width:1000px;
	}
	
	#files {
		height: 100px;
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
				
			
			
			<form action="" method="post" enctype="multipart/form-data">
			  <input type="hidden" name="boardNum" value="${dto.boardNum}">
			  		  
			  <div class="mb-3">
			    <input type="text" value="${dto.boardTitle}" name="boardTitle" placeholder="글제목" class="form-control" id="boardTitle">
			  </div>
			  
			  <div class="mb-3">
				<textarea class="form-control" name="boardContent" id="boardContent" rows="20">${dto.boardContent}</textarea>
			   </div>
			   
			   <!-- dto 안에 있는 boardFileDTO들을 뿌려줌 -->
			   <div class="mb-3" id="attached-wrapper">
			   	<c:forEach items="${dto.boardFileDTOs}" var="f">
			   		<div class="alert alert-success" role="alert">
	  					${f.originalName} <button type="button" data-file-num="${f.fileNum}" data-kind="${kind}" class="btn btn-outline-light badge text-bg-secondary file-delete">X</button>
					</div>
			   	</c:forEach>
			   </div>
			   
			   <div id="files" class="mb-3" data-files-size="${dto.boardFileDTOs.size()}">
				  <div style="display: flex; justify-content: flex-end; gap: 10px;">
				    <button class="btn btn-success" type="button" id="add_file" style="padding: 12px 24px; font-size: 1.1rem;">파일 추가</button>
				    <button type="submit" class="btn btn-primary" style="padding: 12px 24px; font-size: 1.1rem;">수정 완료</button>
				  </div>
				</div>
				  
			</form>
				
			</div>
			
			
			
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