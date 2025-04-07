<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<style>
    .login-box {
        max-width: 400px;
        width: 100%;
    }
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="container my-5">
		<div class="d-flex justify-content-center">
			<div class="login-box border rounded p-4 shadow-sm bg-light">
				<div class="text-center mb-4">
					<img src="${pageContext.request.contextPath}/resources/images/teams/kbo.jpg" alt="KBO 로고" style="width: 150px;">
			 	</div>

				<h5 class="text-center mb-4">KBO에 오신 것을 환영합니다.</h5>

				<form id="login_form" action="./login" method="post">
					<div class="mb-3">
						<label for="userId" class="form-label">아이디</label>
						<input type="text" name="userId" 
						       value="${cookie.userId.value}" 
						       placeholder="아이디" class="form-control" id="userId">
						<c:if test="${not empty userIdError}">
							<p class="text-danger small">${userIdError}</p>
						</c:if>
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">비밀번호</label>
						<input type="password" name="password" value="" placeholder="비밀번호" class="form-control" id="password">
						<c:if test="${not empty passwordError}">
							<p class="text-danger small">${passwordError}</p>
						</c:if>
					</div>
					
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="saveId" id="saveId"
							<c:if test="${not empty cookie.userId}">checked</c:if>>
						<label class="form-check-label" for="saveId">아이디 저장</label>
					</div>
					
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="autoLogin" id="autoLogin">
						<label class="form-check-label" for="autoLogin">로그인 상태 유지</label>
					</div>

					<button type="submit" class="btn btn-dark w-100 mt-3">로그인</button>
					
					<div class="mb-3 mt-2">
						<a href="./findId" class="me-2">ID 찾기</a>
						<a href="./findPassword">PW 찾기</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
