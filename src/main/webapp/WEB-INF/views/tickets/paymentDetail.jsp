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
		
		<div class="row align-items-start mb-5">
			<div class="col">
				<h1>결제 상세내역</h1>
			</div>
			<div class="col">
				
			</div>
			<div class="col">
				<div class="card p-3" style="width: 20rem; height: auto;">
					<div class="card-body">
						<p class="card-semititle">결제번호 ${dto.paymentDTO.paymentId}</p>
						<p class="card-text">가맹점 결제키 ${dto.paymentDTO.merchantPayKey}</p>
						<p class="card-text">${dto.paymentDTO.paymentDate}</p>
					</div>
				</div>
			</div>
		  </div>
		
		<div class="row align-items-center">
			  <div class="col">
				
			  </div>
			  
			  
			  <div class="col">
				<div class="card p-3" style="width: 50rem;">
					<div class="row align-items-start">
						<div class="col">
							<h3 class="card-title">주문상품</h3>
						
							<div class="card-body">
								<div class="alert alert-primary">
	  
									<h5 class="card-semititle">${dto.paymentDTO.productName}</h5>
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> 티켓번호 ${dto.ticketNum}</p>
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> 경기번호 ${dto.matchNum}</p>
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> 좌석 ${dto.seatNum}</p>
								</div>
							</div>
						</div>
						<div class="col">
							<h3 class="card-title">구매자정보</h3>
							<div class="card-body">
								<div class="alert alert-primary">
	  
									<h5 class="card-semititle">${dto.userDTO.name}</h5>
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> ${dto.userDTO.userId}</p>
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> ${dto.userDTO.phone}</p>
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> ${dto.userDTO.email}</p>
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> ${dto.userDTO.address}</p>
								</div>
							</div>
						</div>
						<div class="col">
							<h3 class="card-title">결제정보</h3>
						
							<div class="card-body">
								<div class="alert alert-primary">
	  
									<h5 class="card-semititle">주문금액 총 ${dto.paymentDTO.totalAmount}</h5>
								</div>
								<div class="alert alert-primary">
	  								<c:choose>
	  									<c:when test="${level eq 'C'}"><p class="card-text"> 상품금액 15000</p></c:when>
	  									<c:when test="${level eq 'B'}"><p class="card-text"> 상품금액 20000</p></c:when>
	  									<c:otherwise><p class="card-text"> 상품금액 30000</p></c:otherwise>
	  								</c:choose>
									
								</div>
								<div class="alert alert-primary">
	  								<c:choose>
	  									<c:when test="${level eq 'C'}"><p class="card-text"> 할인 ${15000-dto.paymentDTO.totalAmount}</p></c:when>
	  									<c:when test="${level eq 'B'}"><p class="card-text"> 할인 ${20000-dto.paymentDTO.totalAmount}</p></c:when>
	  									<c:otherwise><p class="card-text"> 할인 ${30000-dto.paymentDTO.totalAmount}</p></c:otherwise>
	  								</c:choose>
									
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> 배송비 X</p>
								</div>
								<div class="alert alert-primary">
	  
									<p class="card-text"> 결제방법 네이버페이</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			  </div>
			  <div class="col">
				
			  </div>
			</div>
	</div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>