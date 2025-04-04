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
		<h1>결제내역</h1>
		
		<table class="table table-striped">
			<thead class="table-primary">
				<tr>
					<th>결제번호</th>
					<th>결제상태</th>					
					<th>결제일시</th>
					<th>총 결제금액</th>
					<th>상품명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="v">
				<tr>
					<c:choose>
						<c:when test="${v.paymentStatus eq '승인'}"><td><a href="./paymentDetail?paymentId=${v.paymentId}">${v.paymentId}</a></td></c:when>
						<c:otherwise><td>${v.paymentId}</td></c:otherwise>
					</c:choose>
					<td>${v.paymentStatus}</td>
					<td>${v.paymentDate}</td>
					<td>${v.totalAmount}</td>
					<td>${v.productName}</td>							
				</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징 버튼 -->
		<form id="pageForm">
			<input type="hidden" id="page" name="page">
		</form>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  
		    <li class="page-item">
		      <button class="page-link pages" onclick="location.href='./paymentList?page=${pager.startBtn-1}'" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
			  </button>
		    </li>
		    
		    <c:forEach begin="${pager.startBtn}" end="${pager.endBtn}" var="i">
		   		<li class="page-item">
					<button class="page-link pages" onclick="location.href='./paymentList?page=${i}'">${i}</button>
				</li>
		    </c:forEach>
		    
		    <li class="page-item ${pager.endCheck?'disabled':''}">
		      <button class="page-link pages" onclick="location.href='./paymentList?page=${pager.endBtn+1}'" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
			  </button>
		    </li>
		    
		  </ul>
		</nav>
		
	</div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>