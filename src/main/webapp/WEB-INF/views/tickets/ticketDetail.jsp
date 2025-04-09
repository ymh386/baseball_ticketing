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

		 <div style="width: 400px; border: 2px solid #333; padding: 20px; margin: 50px auto; text-align: center;">
        <h2>큐알 코드</h2>
        <p><strong>티켓 번호:</strong> ${ticket.ticketNum}</p>
        
        <!-- 바코드 이미지 -->
        <img src="barcode?data=${ticket.ticketNum}" alt="큐알 이미지" style="margin-top: 20px;" />

        <div style="margin-top: 20px;">
            <a href="${pageContext.request.contextPath}/users/getTicket">돌아가기</a>
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