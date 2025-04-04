<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
    <!-- ✅ mypage.css 추가 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<body>
    <c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

    <div class="container my-5">
        <div class="row">
            <!-- 왼쪽: 프로필 정보 -->
            <div class="col-md-4">
                <div class="card p-3">
                    <h2 class="text-center">마이페이지</h2>
                    
                    <!-- 아이디 -->
                    <div class="alert alert-primary">
                        <strong>아이디:</strong> ${sessionScope.user.userId}
                    </div>

                    <!-- 이름 -->
                    <div class="alert alert-primary">
                        <strong>이름:</strong> ${user.name}
                    </div>

                    <!-- 이메일 -->
                    <div class="alert alert-primary">
                        <strong>이메일:</strong> ${user.email}
                    </div>

                    <!-- 포인트 -->
                    <div class="alert alert-primary">
                        <strong>포인트:</strong> ${user.point}
                    </div>

             
                    
                    <!-- 버튼 목록 -->
                    <div class="d-grid gap-2 mt-3">
                        <button class="btn btn-outline-primary" onclick="location.href='./pwUpdate'">비밀번호 변경</button>
                        <button class="btn btn-outline-success" onclick="location.href='./getTicket'">티켓 확인</button>
                        <button class="btn btn-outline-info" onclick="location.href='../tickets/paymentList'">결제 내역</button>
                        <button class="btn btn-outline-danger" onclick="location.href='./userDelete'">회원탈퇴</button>
                    </div>
                </div>
            </div>

            <!-- 오른쪽: 응원팀 정보 및 최근 경기 -->
            <div class="col-md-8">
                <div class="card p-3">
                    <h3 class="text-center">MY TEAM</h3>

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

                    <div class="team-section">
                        <h4>${teamName}</h4>
               <div class="text-center">

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
         alt="${teamName} 로고" style="width: 300px; height: 200px;">
		</div>

  
                </div>
           
            </div>
            
            
        </div>
    </div>

    
   
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
<script src="/resources/js/uesrs/login.js"></script>
</body>
</html>
