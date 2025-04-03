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
		
		<h1>로그인</h1>
		
		
		<form id="login_form" action="./login" method="post">
		  <div class="mb-3">
		   <label for="userId" class="form-label">아이디</label>
        <input type="text" name="userId" value="wlsdnjs888" placeholder="ID" class="form-control" id="userId">
        <c:if test="${not empty userIdError}">
            <p style="color: red; font-size: 0.9rem;">${userIdError}</p>
        </c:if>
    </div>

		  <div class="mb-3">
		   <label for="password" class="form-label">비밀번호</label>
        <input type="password" name="password" value="wlsdnjs888@" placeholder="PW" class="form-control" id="password">
        <c:if test="${not empty passwordError}">
            <p style="color: red; font-size: 0.9rem;">${passwordError}</p>
        </c:if>
		    <label for="userID" class="form-label">아이디</label>
		    <input type="text" value="ymh386" name="userId" placeholder="ID" class="form-control" id="userId">
		  </div>

		  <div class="mb-3">
		    <label for="password" class="form-label">비밀번호</label>
		    <input type="password" value="010602ymh!" name="password" placeholder="PW" class="form-control" id="password">
		  </div>	
			
			
			<a href="./findId">id찾기</a>	
			<a href="./findPassword">PW찾기</a>	
		  <button type="submit" class="btn btn-primary" id="loginButton">로그인</button>
	
		</form>	
		
		
		
	</div>
</div>





<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>