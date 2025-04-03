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
	<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
		<!-- contents 내용 작성 -->
		<div class="row align-items-center">
			<h1>결제 상세내역</h1>
			  <div class="col">
				  <div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-semititle">결제번호 ${dto.paymentDTO.paymentId}</h5>
						<h5 class="card-semititle">가맹점 결제키 ${dto.paymentDTO.merchantPayKey}</h5>
						<p class="card-text">${dto.paymentDTO.paymentDate}</p>
					</div>
				</div>
					<div class="card" style="width: 18rem;">
					<h3 class="card-title">주문상품</h3>
					
					<div class="card-body">
						<h5 class="card-semititle">${dto.paymentDTO.productName}</h5>
						<p class="card-text"> 티켓번호 ${dto.seatNum}</p>
						<p class="card-text"> 경기번호 ${dto.matchNum}</p>
						<p class="card-text"> 좌석 ${dto.seatNum}</p>
					</div>
				</div>
			  </div>
			  <div class="col">
				<div class="card" style="width: 18rem;">
					<h3 class="card-title">구매자정보</h3>
					
					<div class="card-body">
						<h5 class="card-semititle">${dto.userDTO.name}</h5>
						<p class="card-text"> ${dto.userDTO.userId}</p>
						<p class="card-text"> ${dto.userDTO.phone}</p>
						<p class="card-text"> ${dto.userDTO.email}</p>
						<p class="card-text"> ${dto.userDTO.address}</p>
					</div>
				</div>
			  </div>
			  <div class="col">
				<div class="card" style="width: 18rem;">
					<h3 class="card-title">결제정보</h3>
					
					<div class="card-body">
						<h5 class="card-semititle">주문금액 총 ${dto.paymentDTO.totalAmount}</h5>
						<p class="card-text"> 상품금액 ${dto.paymentDTO.totalAmount}</p>
						<p class="card-text"> 쿠폰할인 0</p>
						<p class="card-text"> 배송비 X</p>
						<p class="card-text"> 결제방법 네이버페이</p>
					</div>
				</div>
			  </div>
			</div>
	</div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>