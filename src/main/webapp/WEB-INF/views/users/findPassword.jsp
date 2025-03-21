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
		
		<h2>비밀번호 찾기</h2>
		<form method="post" class="form-signin" action="findPassword" name="findform">
<div class="form-label-group">
			<label for="userId">아이디</label>
			<input type="text" id="userId" name="userId" class="form-control"/>
		</div>
		
		<div class="form-label-group">
			<label for="name">이름</label>
			<input type="text" id="name" name="name" class="form-control"/>
		</div>
		
		<div class="form-label-group">
			<label for="email">이메일</label>
			<input type="text" id="email" name="email" class="form-control"/>
		</div>

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="비밀번호 찾기">
		</div>

		<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
			opener.document.findform.userId.value = "";
				opener.document.findform.name.value = "";
				opener.document.findform.email.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
			<c:if test="${check == 0 }">
		<label>찾으시는 비밀번호는'${password}' 입니다.</label>
		
		</c:if>

	</form>
		

	</div>
</div>





<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
<script src="/resources/js/users/join.js"></script>
</body>
</html>