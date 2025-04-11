<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 상세내역</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/contents.css">
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp" />




<div class ="contents">
	<div class ="wrapper-main">

	<div class="container my-5">
	    <!-- 결제 상단 정보 -->
	    <div class="mb-4">
	        <h2 class="mb-3">결제 상세내역</h2>
	        <div class="card p-3 shadow-sm">
            <div class="card-body">
                <p><strong>결제번호:</strong> ${dto.paymentDTO.paymentId}</p>
                <p><strong>가맹점 결제키:</strong> ${dto.paymentDTO.merchantPayKey}</p>
                <p><strong>결제일:</strong> ${dto.paymentDTO.paymentDate}</p>
            </div>
        </div>
    </div>

    <!-- 세부 정보 영역: 3단 카드 -->
    <div class="row g-3">
        <!-- 주문 상품 -->
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <div class="card-header bg-primary text-white">
                    주문 상품
                </div>
                <div class="card-body">
                    <p><strong>${dto.paymentDTO.productName}</strong></p>
                    <hr>
                    <p>티켓번호: ${dto.ticketNum}</p>
                    <p>경기번호: ${dto.matchNum}</p>
                    <p>좌석: ${dto.seatNum}</p>
                </div>
            </div>
        </div>

        <!-- 구매자 정보 -->
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <div class="card-header bg-success text-white">
                    구매자 정보
                </div>
                <div class="card-body">
                    <p><strong>${dto.userDTO.name}</strong></p>
                    <hr>
                    <p>ID: ${dto.userDTO.userId}</p>
                    <p>전화번호: ${dto.userDTO.phone}</p>
                    <p>이메일: ${dto.userDTO.email}</p>
                    <p>주소: ${dto.userDTO.address}</p>
                </div>
            </div>
        </div>

        <!-- 결제 정보 -->
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <div class="card-header bg-warning text-dark">
                    결제 정보
                </div>
                <div class="card-body">
                    <p><strong>총 결제금액:</strong> ${dto.paymentDTO.totalAmount}원</p>
                    <hr>
                    <c:choose>
                        <c:when test="${level eq 'C'}"><p>상품금액: 15,000원</p></c:when>
                        <c:when test="${level eq 'B'}"><p>상품금액: 20,000원</p></c:when>
                        <c:otherwise><p>상품금액: 30,000원</p></c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${level eq 'C'}"><p>할인: ${15000 - dto.paymentDTO.totalAmount}원</p></c:when>
                        <c:when test="${level eq 'B'}"><p>할인: ${20000 - dto.paymentDTO.totalAmount}원</p></c:when>
                        <c:otherwise><p>할인: ${30000 - dto.paymentDTO.totalAmount}원</p></c:otherwise>
                    </c:choose>

                    <p>배송비: 없음</p>
                    <p>결제방법: 네이버페이</p>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

	</div>
</div>


<c:import url="/WEB-INF/views/templates/layout_footer.jsp" />
<c:import url="/WEB-INF/views/templates/boot_js.jsp" />
</body>
</html>
