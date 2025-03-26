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
		
		<h1>로그인</h1>
		<h3>${result}</h3>
		<form id="login_form" action="./login" method="post">
		  <div class="mb-3">
		    <label for="userID" class="form-label">아이디</label>
		    <input type="text" value="abcdef123456" name="userId" placeholder="ID" class="form-control" id="userId">
		  </div>

		  <div class="mb-3">
		    <label for="password" class="form-label">비밀번호</label>
		    <input type="password" value="qwe123456@" name="password" placeholder="PW" class="form-control" id="password">
		  </div>	
			
			
			<a href="./findId">id찾기</a>	
			<a href="./findPassword">PW찾기</a>	
		  <button type="submit" class="btn btn-primary" id="login_button">로그인</button>
	
		</form>	
		
		
		
	</div>
</div>


<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<a href="javascript:void(0);" onclick="kakaoLogin(event);">
    <img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height: 30px;width: auto;">
</a>

<script>
    // Kakao SDK 초기화
    Kakao.init('1dfd8db15495713d79e3735cc1f2c94b'); // 카카오 앱의 JavaScript 키

    function kakaoLogin(event) {
        // 로그인 이벤트를 처리할 때 페이지 새로고침 방지
        event.preventDefault(); // 기본 동작을 막습니다.

        Kakao.Auth.login({
            scope: 'profile_nickname,profile_image', // 요구하는 권한 범위
            success: function(authObj) {
                console.log(authObj);
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(res) {
                        const kakao_account = res.kakao_account; // 사용자 계정 정보
                        console.log(kakao_account);
                    },
                    fail: function(error) {
                        console.error('API 요청 실패:', error);
                    }
                });
            },
            fail: function(error) {
                console.log('로그인 실패:', error); // 로그인 실패 시 에러 처리
            }
        });
    }
</script> -->

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
<script src="/resources/js/uesrs/login.js"></script>
</body>
</html>