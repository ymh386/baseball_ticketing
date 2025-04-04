<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="container d-flex justify-content-center align-items-center"
		style="min-height: 80vh;">
		<div class="card shadow p-4 col-md-6 text-center">
			<h4 class="mb-3">
				그 동안 <strong>Baseball Ticketing</strong> 서비스를 이용해주셔서 감사합니다.
			</h4>
			<p class="mb-4">회원님의 정보는 탈퇴 후 복구되지 않습니다.</p>

			<form action="./userDelete" method="post"
				onsubmit="return confirmDelete();">
				<p>
					<strong>아이디:</strong> ${user.userId}
				</p>
				<button type="submit" class="btn btn-danger w-100 mt-3">회원
					탈퇴</button>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>

	<script>
		function confirmDelete() {
			return confirm("정말로 탈퇴하시겠습니까?\n탈퇴 후 아이디는 복구할 수 없습니다.");
		}
	</script>
</body>
</html>
