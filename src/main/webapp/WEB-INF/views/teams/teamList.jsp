<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 목록</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<!-- Bootstrap 모달 스타일과 스크립트 추가 -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="container my-5">
	<div class="row col-md-8 offset-md-2">
	
	
            <h3 class="mb-4 fs-2">구단 소개</h3>  	
		<br>
		<br>
		<br>
		
		<span>
		각 구단의 로고를 클릭하시면 우승횟수(년도)를 확인 하실 수 있습니다.
		</span>
		
		<br>
	
		<table class="table table table-sm">
			<thead>
				<tr>
					<th>팀 로고</th>
					<th>팀 이름</th>
					<th>연고지</th>
					<th>경기장</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="v">
				<tr>
					<!-- 팀 로고를 표시하는 <td> -->
					<td>
						<!-- 로고 클릭 시 모달을 띄우기 위한 버튼 추가 -->
						<button type="button" class="btn btn-link" data-toggle="modal" data-target="#teamModal" data-team="${v.teamName}">
							<img src="${pageContext.request.contextPath}/resources/images/teams/${v.teamName == '기아 타이거즈' ? 'kia' :
                          v.teamName == 'SSG 랜더스' ? 'ssg' :
                          v.teamName == '한화 이글스' ? 'hanwha' :
                          v.teamName == '키움 히어로즈' ? 'kiwoom' :
                          v.teamName == '삼성 라이온즈' ? 'samsung' :
                          v.teamName == '롯데 자이언츠' ? 'lotte' :
                          v.teamName == '케이티 위즈' ? 'kt' :
                          v.teamName == '엘지 트윈스' ? 'lg' :
                          v.teamName == '엔씨 다이노스' ? 'nc' :
                          v.teamName == '두산 베어스' ? 'doosan' : 'kbo'}.jpg"
                             alt="${v.teamName} 로고" style="width: 50px; height: 50px;">
						</button>
					</td>
					
					<td>${v.teamName}</td>
					<td>${v.field}</td>
					<td>
						<c:choose>
							<c:when test="${v.stadiumNum == 3}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">잠실야구장</a></c:when>
							<c:when test="${v.stadiumNum == 4}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">고척스카이돔</a></c:when>
							<c:when test="${v.stadiumNum == 5}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">SSG랜더스필드</a></c:when>
							<c:when test="${v.stadiumNum == 6}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">수원KT위즈파크</a></c:when>
							<c:when test="${v.stadiumNum == 7}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">대전한화생명볼파크</a></c:when>
							<c:when test="${v.stadiumNum == 8}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">광주챔피언스필드</a></c:when>
							<c:when test="${v.stadiumNum == 9}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">대구라이온즈파크</a></c:when>
							<c:when test="${v.stadiumNum == 10}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">사직야구장</a></c:when>
							<c:when test="${v.stadiumNum == 11}"><a href="../stadiums/detail?stadiumNum=${v.stadiumNum}">창원NC파크</a></c:when>
							<c:otherwise>알 수 없음</c:otherwise>
						</c:choose>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- 모달 창 HTML 추가 -->
<div class="modal" id="teamModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- 모달 헤더 -->
      <div class="modal-header">
        <h4 class="modal-title">팀 우승 정보</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- 모달 본문 -->
      <div class="modal-body">
        <p id="teamName"></p>
        <p id="championships"></p>
      </div>

      <!-- 모달 푸터 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
<script src="/resources/js/teams/list.js"></script>
</body>
</html>
