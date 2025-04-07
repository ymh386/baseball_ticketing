<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="container d-flex justify-content-center align-items-center"
		style="min-height: 80vh;">
		<div class="card shadow p-4 col-md-6">
			<h3 class="text-center mb-4">비밀번호 변경</h3>

			<c:if test="${not empty message}">
				<script>
					alert("${message}");
				</script>
			</c:if>

			<form action="./pwUpdate" method="post"
				onsubmit="return validatePassword()">
				<div class="form-group mb-3">
					<label for="currentPassword">현재 비밀번호</label> <input type="password"
						class="form-control" id="currentPassword" name="currentPassword"
						required />
				</div>

				<div class="form-group mb-3">
					<label for="newPassword">변경할 비밀번호</label> <input type="password"
						class="form-control" id="newPassword" name="newPassword" required />
				</div>

				<div class="form-group mb-4">
					<label for="confirmPassword">변경할 비밀번호 재입력</label> <input
						type="password" class="form-control" id="confirmPassword"
						name="confirmPassword" required />
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-dark w-100">비밀번호
						변경</button>
				</div>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
	<script src="/resources/js/users/pwUpdate.js"></script>
</body>
</html>
