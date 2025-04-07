<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 구매 내역</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>

<!-- Bootstrap CSS 추가 -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.small-select {
	width: 120px;
	display: inline-block;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

	<div class="container-fluid my-5">
		<div class="row col-md-8 offset-md-2" style="min-height: 50vh;">
			<h2>티켓 구매 내역</h2>

			<!-- 상태 선택 필터 -->
			<form id="statusFilterForm">
				<select class="form-control small-select" id="statusFilter"
					onchange="filterTickets()">
					<option value="">모든 상태</option>
					<option value="예매완료">예매완료</option>
				</select>
			</form>

			<c:if test="${not empty ticketList}">
				<table class="table table-striped" id="ticketTable">
					<thead class="table-primary">
						<tr>
							<th>구매자</th>
							<th>좌석 번호</th>
							<th>홈팀</th>
							<th>어웨이팀</th>
							<th>경기장</th>
							<th>경기 날짜</th>
							<th>티켓 상태</th>
							<th>환불가능</th>
						</tr>
					</thead>
					<tbody>
						<fmt:formatDate var="today" value="<%=new java.util.Date()%>"
							pattern="yyyy-MM-dd HH:mm:ss" />

						<c:forEach var="ticket" items="${ticketList}">
							<tr class="ticketRow" data-status="${ticket['TICKETSTATUS']}">
								<td>${ticket['USERID']}</td>
								<td>${ticket['SEATNUM']}</td>
								<td><c:set var="homeTeamName"
										value="${ticket['HOMETEAM'] == 1 ? '기아 타이거즈' : 
                                                                 ticket['HOMETEAM'] == 2 ? 'SSG 랜더스' : 
                                                                 ticket['HOMETEAM'] == 3 ? '한화 이글스' :
                                                                 ticket['HOMETEAM'] == 4 ? '키움 히어로즈' : 
                                                                 ticket['HOMETEAM'] == 5 ? '삼성 라이온즈' : 
                                                                 ticket['HOMETEAM'] == 6 ? '롯데 자이언츠' : 
                                                                 ticket['HOMETEAM'] == 7 ? '케이티 위즈' : 
                                                                 ticket['HOMETEAM'] == 8 ? '엘지 트윈스' : 
                                                                 ticket['HOMETEAM'] == 9 ? '엔씨 다이노스' : 
                                                                 ticket['HOMETEAM'] == 10 ? '두산 베어스' : '미지정'}" />
									${homeTeamName}</td>
								<td><c:set var="awayTeamName"
										value="${ticket['AWAYTEAM'] == 1 ? '기아 타이거즈' : 
                                                                 ticket['AWAYTEAM'] == 2 ? 'SSG 랜더스' : 
                                                                 ticket['AWAYTEAM'] == 3 ? '한화 이글스' :
                                                                 ticket['AWAYTEAM'] == 4 ? '키움 히어로즈' : 
                                                                 ticket['AWAYTEAM'] == 5 ? '삼성 라이온즈' : 
                                                                 ticket['AWAYTEAM'] == 6 ? '롯데 자이언츠' : 
                                                                 ticket['AWAYTEAM'] == 7 ? '케이티 위즈' : 
                                                                 ticket['AWAYTEAM'] == 8 ? '엘지 트윈스' : 
                                                                 ticket['AWAYTEAM'] == 9 ? '엔씨 다이노스' : 
                                                                 ticket['AWAYTEAM'] == 10 ? '두산 베어스' : '미지정'}" />
									${awayTeamName}</td>
								<td>${ticket['STADIUMNAME']}</td>
								<td>${ticket['MATCHDATE']}</td>
								<td>${ticket['TICKETSTATUS']}</td>
								<td><c:if
										test="${ticket['TICKETSTATUS'] == '예매완료' 
                                            and ticket['MATCHDATE'] >= today}">
										
                                    <form action="./refund" method="POST" onsubmit="return confirm('정말로 환불하시겠습니까?')">
                                    	  <input type="hidden" name="paymentId" value="${ticket['PAYMENTID']}"> 
									    <input type="hidden" name="ticketNum" value="${ticket['TICKETNUM']}">
                                        <input type="hidden" name="seatNum" value="${ticket['SEATNUM']}">
									    <button type="submit" class="btn btn-danger">환불 신청</button>
									</form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

			<c:if test="${empty ticketList}">
				<p>조회된 티켓이 없습니다.</p>
			</c:if>

		</div>
			<button type="button" onclick="location.href='./mypage'">뒤로
				가기</button>
	</div>

	<!-- 상태 필터 기능 -->
	<script>
		function filterTickets() {
			let selectedStatus = document.getElementById("statusFilter").value;
			let rows = document.querySelectorAll("#ticketTable tbody tr");

			rows.forEach(function(row) {
				let ticketStatus = row.getAttribute("data-status");
				if (selectedStatus === "" || ticketStatus === selectedStatus) {
					row.style.display = "";
				} else {
					row.style.display = "none";
				}
			});
		}
	</script>

	<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
	<!-- jQuery 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- Bootstrap JS 추가 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
