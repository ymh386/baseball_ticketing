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

<div class="content">
	<div class="wrapper-main">
		<div class="container">
		    <div class="row justify-content-center">
		        <div id="div1" class="d-flex justify-content-between align-items-center" style="gap: 2rem;">
					<!-- 제목 영역 -->
					<div  class="d-flex justify-content-center align-items-center"
					style="height: 60%; margin-left: 30px;
						background-color: #e6f0fa;
						padding: 12px 30px;
						border-radius: 12px;
						box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);">
				
						<h1 style="font-size: 2.5rem; margin: 0; color: #2c3e50; font-weight: 600;">

						</h1>
					</div>
					<!-- 검색 폼 영역 -->
					<div class="d-flex justify-content-center align-items-end" 
					style="height: 100%; margin-right: 30px; margin-bottom: 30px;" >
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>