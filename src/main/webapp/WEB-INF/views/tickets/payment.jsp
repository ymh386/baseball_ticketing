<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
<style>
	#payment-button{ width:100%; padding:15px; background-color:#3065AC; color:white; border-radius:3px; font-size:16px; border:none; margin-top:10px}
	.title {margin: 0 0 4px; font-size: 24px; font-weight: 600;color: #4e5968;}

	#div1{
		height: 110px;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="container my-5">
	<div class="d-flex justify-content-center">
	  	<div class="login-box border rounded p-4 shadow-sm bg-light">
			<div class="text-center mb-4">
				<img src="${pageContext.request.contextPath}/resources/images/teams/kbo.jpg" alt="KBO 로고" style="width: 150px;">
			</div>
			<!-- contents 내용 작성 -->
			

			<form action="./add" method="post">
				<div class="innerDiv mb-3">
				<label class="form-label w-100">티켓번호</label>
				<div class="ipts d-flex justify-content-center">
					<input type="text" class="form-control" value="${dto.ticketNum}" readonly style="width: 350px;">
				</div>
				</div>
			
				<div class="innerDiv mb-3">
				<label class="form-label w-100">경기번호</label>
				<div class="ipts d-flex justify-content-center">
					<input type="text" class="form-control" value="${dto.matchNum}" readonly style="width: 350px;">
				</div>
				</div>
			
				<div class="innerDiv mb-3">
					<label class="form-label w-100">좌석</label>
					<div class="ipts d-flex justify-content-center">
						<input type="text" class="form-control" value="${dto.seatNum}" readonly style="width: 350px;">
					</div>
				</div>
			
				<div class="innerDiv mb-3">
					<label class="form-labe w-100">가격</label>
					<div class="ipts d-flex justify-content-center">
						<input id="payPrice" type="text" class="form-control" value="${price}" readonly style="width: 350px;">
					</div>
				</div>

				<div class="innerDiv mb-3">
					<div id="usePointInfo">
						<label class="form-labe w-100">사용 가능 포인트</label>
						<div class="ipts d-flex justify-content-center">
							<input type="text" class="form-control" value="${user.point}P" readonly style="width: 350px;">
						</div>		
					</div>
				</div>

				<div class="innerDiv mb-3">
					<div class="form-check">
						<label class="form-check-label w-100" for="point">
							포인트 사용
						</label>
						<input class="form-check-input" type="checkbox" value="${user.point}" id="point">
					</div>
				</div>
			
				<div class="d-flex justify-content-between gap-2 mt-5" style="width: 350px; margin: 0 auto;">
					<div id="pay">
						<!-- 결제하기 버튼 생성 -->
						<input data-userid="${dto.userId}" type="button" id="naverPayBtn" class="btn btn-success" value="네이버페이 결제">
						<!-- <button data-userid="${dto.userId}" type="button" id="payBtn" class="btn btn-success">결제하기</button> -->
					</div>
					<button data-ticketnum="${dto.ticketNum}" data-matchnum="${dto.matchNum}" data-seatnum="${dto.seatNum}" id="cancel" type="button" class="btn btn-warning">결제취소</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script src="/resources/js/tickets/payment.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>