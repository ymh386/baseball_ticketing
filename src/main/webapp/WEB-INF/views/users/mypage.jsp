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
		<h2>마이페이지</h2>
		
		<div class="alert alert-primary" role="alert">
  			${sessionScope.user.userId}
		</div>
		<div class="alert alert-primary" role="alert">
  			${user.name}
		</div>
		<div class="alert alert-primary" role="alert">
  			${user.email}
		</div>
		
		<c:set var="teamName" value="${user.teamNum == 1 ? '기아 타이거즈' : 
                             user.teamNum == 2 ? 'SSG 랜더스' : 
                             user.teamNum == 3 ? '한화 이글스' :
                             user.teamNum == 4 ? '키움 히어로즈' : 
                             user.teamNum == 5 ? '삼성 라이온즈' : 
                             user.teamNum == 6 ? '롯데 자이언츠' : 
                             user.teamNum == 7 ? '케이티 위즈' : 
                             user.teamNum == 8 ? '엘지 트윈스' : 
                             user.teamNum == 9 ? '엔씨 다이노스' : 
                             user.teamNum == 10 ? '두산 베어스' : '미지정'}" />

<div class="alert alert-primary" role="alert">
    응원하는 팀: ${teamName} <!-- 응원하는 팀 출력 -->
</div>

<!-- 팀 로고 이미지 출력 -->
<div class="alert alert-primary" role="alert">
    <img src="${pageContext.request.contextPath}/resources/images/teams/${
                  teamName == '기아 타이거즈' ? 'kia' :
                  teamName == 'SSG 랜더스' ? 'ssg' :
                  teamName == '한화 이글스' ? 'hanwha' :
                  teamName == '키움 히어로즈' ? 'kiwoom' :
                  teamName == '삼성 라이온즈' ? 'samsung' :
                  teamName == '롯데 자이언츠' ? 'lotte' :
                  teamName == '케이티 위즈' ? 'kt' :
                  teamName == '엘지 트윈스' ? 'lg' :
                  teamName == '엔씨 다이노스' ? 'nc' :
                  teamName == '두산 베어스' ? 'doosan' : 'kbo'}.jpg"
         alt="${teamName} 로고" style="width: 200px; height: 150px;">
</div>
		
		<button type="button" onclick="location.href='./pwUpdate'">비밀번호 변경</button>
		<button type="button" onclick="location.href='./getTicket'">티켓확인</button>
		<button type="button" onclick="location.href='./userDelete'">회원탈퇴</button>
		
		

	</div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
<script src="/resources/js/uesrs/login.js"></script>
</body>
</html>