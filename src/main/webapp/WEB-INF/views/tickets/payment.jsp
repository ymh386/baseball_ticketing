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
</style>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="continer-fluid my-5">
	<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
		<!-- contents 내용 작성 -->
		<h1>결제창(미완성)</h1>
		  <div class="container text-center">
			<div class="row align-items-end">
			  <div class="col">
			  </div>
			  <div class="col">
				<form>
					<div class="mb-3">
					  <label class="form-label">티켓번호</label>
					  <input type="text" class="form-control" value="${dto.ticketNum}" readonly>
					</div>
					<div class="mb-3">
					  <label class="form-label">경기번호</label>
					  <input type="text" class="form-control" value="${dto.matchNum}" readonly>
					</div>
					<div class="mb-3">
						<label class="form-label">좌석</label>
						<input type="text" class="form-control" value="${dto.seatNum}" readonly>
					</div>
				  </form>
			  </div>
			  <div class="col">
			  </div>
			</div>
		  </div>
		  <div class="container text-center">
			<div class="row align-items-center">
			  <div class="col">
			  </div>
			  <div id="pay" class="col">
				<!-- 결제하기 버튼 생성 -->
				<input data-seatprice="${price}" data-userid="${dto.userId}" type="button" id="naverPayBtn" class="btn btn-success" value="네이버페이 결제 버튼">
				<!-- <button data-userid="${dto.userId}" type="button" id="payBtn" class="btn btn-success">결제하기</button> -->
				</div>
			  <div class="col">
				<button data-ticketnum="${dto.ticketNum}" data-matchnum="${dto.matchNum}" data-seatnum="${dto.seatNum}" id="cancel" type="button" class="btn btn-warning">결제취소</button>
			</div>
		  </div>
	</div>
</div>

<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script src="/resources/js/tickets/payment.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>