<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- JSTL functions 선언 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="continer-fluid my-5">
		<div class="row col-md-8 offset-md-2">
			<!-- contents 내용 작성 -->
			<h2>아이디 찾기</h2>

			<form method="post" class="form-signin" action="./findId"
				name="findform">
				<div class="form-label-group">
					<label for="name">이름</label> <input type="text" id="name"
						name="name" class="form-control" />
					<c:if test="${not empty nameError}">
						<p style="color: red; font-size: 0.9rem;">${nameError}</p>
					</c:if>
				</div>

				<div class="form-label-group">
					<label for="email">이메일</label> <input type="text" id="email"
						name="email" class="form-control" />
					<c:if test="${not empty emailError}">
						<p style="color: red; font-size: 0.9rem;">${emailError}</p>
					</c:if>
				</div>

				<div class="form-label-group">
					<input class="btn btn-lg btn-secondary btn-block text-uppercase"
						type="submit" value="아이디 찾기">
				</div>

				<!-- 이름과 이메일이 일치하지 않을 때 -->
				<c:if test="${check == 1}">
					<label style="color: red;">일치하는 정보가 존재하지 않습니다.</label>
				</c:if>

				<!-- 찾은 아이디를 표시 -->
				<c:if test="${check == 0}">
					<label>찾으시는 아이디는 <c:choose>
							<c:when test="${fn:length(id) > 3}">
			                    ${fn:substring(id, 0, fn:length(id) - 3)}***
			                </c:when>
							<c:otherwise>
			                    ${id}
			                </c:otherwise>
						</c:choose>
					</label>
				</c:if>
			</form>

		</div>
	</div>

	<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
