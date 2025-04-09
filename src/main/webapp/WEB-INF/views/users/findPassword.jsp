<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<script>
	function showMessage(message) {
		if (message) {
			alert(message);
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="container py-5 d-flex justify-content-center align-items-center" style="min-height: 80vh;">
		<div class="col-md-5">
			<h2 class="text-center mb-4">비밀번호 찾기</h2>

			<form method="post" class="border rounded p-4 shadow bg-light" action="findPassword" name="findform">
				<div class="form-label-group mb-3">
					<label for="userId" class="text-secondary">아이디</label> 
					<input type="text" id="userId" name="userId" class="form-control" required />
				</div>

				<div class="form-label-group mb-3">
					<label for="name" class="text-secondary">이름</label> 
					<input type="text" id="name" name="name" class="form-control" required />
				</div>

				<div class="form-label-group mb-4">
					<label for="email" class="text-secondary">이메일</label> 
					<input type="email" id="email" name="email" class="form-control" required />
				</div>

				<div class="form-label-group mb-3">
					<input class="btn btn-dark w-100 text-uppercase" type="submit" value="비밀번호 찾기" />
				</div>
			</form>

			<!-- check 값에 따라 메시지 표시 -->
			<c:if test="${check == 1}">
				<script>
					showMessage("일치하는 정보가 존재하지 않습니다.");
				</script>
			</c:if>

			<c:if test="${check == 0}">
				<script>
					showMessage("임시 비밀번호가 이메일로 전송되었습니다.");
				</script>
			</c:if>
		</div>
	</div>

	<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
