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

<div class="continer-fluid my-5">
	<div class="row col-md-8 offset-md-2">
		<!-- contents 내용 작성 -->
		
		
		<h1>회원가입</h1>
		
		<form action="./join" method="post" enctype="multipart/form-data" id="signupForm">
		  <div class="mb-3">
		    <label for="userId" class="form-label">아이디</label>
		    <input type="text" name="userId" placeholder="아이디를 입력해주세요" class="form-control" id="userId">
			<div class="error" id="userIdError"></div>
		  </div>

		  <div class="mb-3">
		    <label for="password" class="form-label">비밀번호</label>
		    <input type="password" name="password" placeholder="비밀번호를 입력해주세요" class="form-control" id="password">
			<div class="error" id="passwordError"></div>
		</div>	

		  <div class="mb-3">
		    <label for="name" class="form-label">이름</label>
		    <input type="text" name="name" placeholder="이름을 입력해주세요" class="form-control" id="name">
		  </div>	
		  
		  <div class="mb-3">
			<label for="phone" class="form-label">전화번호</label>
			<input type="text" class="form-control" placeholder="전화번호를 입력해주세요" name="phone" id="phone">
		   </div>		  	  	  
		   
		  <div class="mb-3">
			<label for="email" class="form-label">이메일</label>
			<input type="text" class="form-control" placeholder="이메일을 입력해주세요" name="email" id="email">
			<div class="error" id="emailError"></div>
		</div>
		   
		   
		   	  <div class="mb-3">
			<label for="address" class="form-label">주소</label>
			<input type="text" class="form-control" name="address" id="address">
		   </div>
		   
		
		  <button type="submit" class="btn btn-primary">회원가입</button>
		</form>	
	</div>
</div>





<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
<script src="/resources/js/users/join.js"></script>
</body>
</html>