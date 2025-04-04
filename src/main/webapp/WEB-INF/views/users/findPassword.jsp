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
	// 메시지를 알림으로 띄우는 함수
	function showMessage(message) {
		if (message) {
			alert(message);
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="container-fluid my-5">
		<div class="row col-md-8 offset-md-2">
			<h2>비밀번호 찾기</h2>
			<form method="post" class="form-signin" action="findPassword"
				name="findform">
				<div class="form-label-group">
					<label for="userId">아이디</label> <input type="text" id="userId"
						name="userId" class="form-control" required />
				</div>

				<div class="form-label-group">
					<label for="name">이름</label> <input type="text" id="name"
						name="name" class="form-control" required />
				</div>

				<div class="form-label-group">
					<label for="email">이메일</label> <input type="email" id="email"
						name="email" class="form-control" required />
				</div>

				<div class="form-label-group">
					<input class="btn btn-lg btn-secondary btn-block text-uppercase"
						type="submit" value="비밀번호 찾기" />
				</div>
			</form>

			<!-- check 값에 따라 메시지 표시 -->
			<c:if test="${check == 1}">
				<script>
					// check가 1일 때는 오류 메시지 표시
					showMessage("일치하는 정보가 존재하지 않거나 비밀번호 변경에 실패했습니다.");
				</script>
			</c:if>

			<c:if test="${check == 0}">
				<script>
					// check가 0일 때는 성공 메시지 표시
					showMessage("임시 비밀번호가 이메일로 전송되었습니다.");
				</script>
			</c:if>

		</div>
	</div>

	<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
	<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>
