<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="container py-5 d-flex justify-content-center align-items-center" style="min-height: 80vh;">
		<div class="col-md-5">
			<h2 class="text-center mb-4">아이디 찾기</h2>

			<form method="post" class="border rounded p-4 shadow bg-light" action="./findId" name="findform">
				<div class="form-label-group mb-3">
					<label for="name" class="text-secondary">이름</label> 
					<input type="text" id="name" name="name" class="form-control" />
					<c:if test="${not empty nameError}">
						<p style="color: red; font-size: 0.9rem;">${nameError}</p>
					</c:if>
				</div>

				<div class="form-label-group mb-3">
					<label for="email" class="text-secondary">이메일</label> 
					<input type="text" id="email" name="email" class="form-control" />
					<c:if test="${not empty emailError}">
						<p style="color: red; font-size: 0.9rem;">${emailError}</p>
					</c:if>
				</div>

				<div class="form-label-group mb-4">
					<input class="btn btn-dark w-100 text-uppercase" type="submit" value="아이디 찾기">
				</div>

				<!-- 이름과 이메일이 일치하지 않을 때 -->
				<c:if test="${check == 1}">
					<p class="text-danger text-center">일치하는 정보가 존재하지 않습니다.</p>
				</c:if>

				<!-- 찾은 아이디를 표시 -->
				<c:if test="${check == 0}">
					<p class="text-success text-center">
						찾으시는 아이디는
						<c:choose>
							<c:when test="${fn:length(id) > 3}">
			                    ${fn:substring(id, 0, fn:length(id) - 3)}***
			                </c:when>
							<c:otherwise>
			                    ${id}
			                </c:otherwise>
						</c:choose>
					</p>
				</c:if>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
