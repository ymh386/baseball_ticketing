<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="content">
	<div class="wrapper-main">
	
		<div class="container">
		    <div class="row justify-content-center my-5">
				<!-- contents 내용 작성 -->
				 <c:if test="${kind eq 'add'}">
					<h1>경기 등록</h1>
				 </c:if>
				 <c:if test="${kind eq 'delete'}">
					<h1>경기 삭제</h1>
				 </c:if>		
				<div>
					<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data"
					method="post" action= "./${kind}">
					<div class="contents">
					<div>첨부파일은 한개만 등록 가능합니다.</div>
					<dl class="vm_name">
					<dt class="down w90">첨부 파일</dt>
						<dd><input id="excelFile" type="file" name="excelFile" /></dd>
					</dl>        
					</div>
					<div class="bottom">
					<button type="button" id="addExcelImpoartBtn" class="btn btn-primary" onclick="check()" >
						<span>추가</span></button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/resources/js/matches/add.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>