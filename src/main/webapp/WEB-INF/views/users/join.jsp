<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>

<!-- Daum 주소 API 추가 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				let fullAddress = data.zonecode + " " + data.address;
				document.getElementById("address").value = fullAddress;
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

	function mergeAddress() {
		let baseAddress = document.getElementById("address").value;
		let detailAddress = document.getElementById("detailAddress").value;
		document.getElementById("address").value = baseAddress + " "
				+ detailAddress;
	}
</script>

</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="container-fluid my-5">
		<div class="row col-md-8 offset-md-2">
			<h1>회원가입</h1>

			<form action="./join" method="post" enctype="multipart/form-data"
				id="signupForm" onsubmit="mergeAddress()">
				<div class="mb-3">
					<label for="userId" class="form-label">아이디</label> <input
						type="text" name="userId" placeholder="아이디를 입력해주세요"
						class="form-control" id="userId">
					<div class="error" id="userIdError"></div>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">비밀번호</label> <input
						type="password" name="password" placeholder="비밀번호를 입력해주세요"
						class="form-control" id="password">
					<div class="error" id="passwordError"></div>
				</div>

				<div class="mb-3">
					<label for="name" class="form-label">이름</label> <input type="text"
						name="name" placeholder="이름을 입력해주세요" class="form-control"
						id="name">
				</div>

				<div class="mb-3">
					<label for="phone" class="form-label">전화번호</label> <input
						type="text" class="form-control" placeholder="전화번호를 입력해주세요"
						name="phone" id="phone">
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">이메일</label> <input
						type="text" class="form-control" placeholder="이메일을 입력해주세요"
						name="email" id="email">
					<div class="error" id="emailError"></div>
				</div>

				<!-- 주소 입력 부분 -->
				<div class="mb-3">
					<label for="address" class="form-label">주소</label>
					<div class="input-group">
						<input type="text" class="form-control" name="address"
							id="address" placeholder="우편번호 + 기본주소" readonly>
						<button type="button" class="btn btn-secondary"
							onclick="execDaumPostcode()">주소 찾기</button>
					</div>
				</div>

				<div class="mb-3">
					<label for="detailAddress" class="form-label">상세주소</label> <input
						type="text" class="form-control" id="detailAddress"
						placeholder="상세주소를 입력해주세요">
				</div>

				<div class="mb-3">
					<label for="teamNum" class="form-label">응원하는 팀</label> <select
						class="form-control" name="teamNum" id="teamNum">
						<option value="">없음</option>
						<option value="1">기아 타이거즈</option>
						<option value="2">SSG 랜더스</option>
						<option value="3">한화 이글스</option>
						<option value="4">키움 히어로즈</option>
						<option value="5">삼성 라이온즈</option>
						<option value="6">롯데 자이언츠</option>
						<option value="7">케이티 위즈</option>
						<option value="8">엘지 트윈스</option>
						<option value="9">엔씨 다이노스</option>
						<option value="10">두산 베어스</option>
					</select>
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
