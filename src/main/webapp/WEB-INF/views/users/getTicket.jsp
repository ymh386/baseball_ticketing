<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 정보</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="container-fluid my-5">
    <div class="row col-md-8 offset-md-2">
        <!-- contents 내용 작성 -->
        <h2>티켓 정보</h2>

        <c:if test="${not empty ticketList}">
            <form action="/ticket/refund" method="POST">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>매치 번호</th>
                            <th>좌석 번호</th>
                            <th>티켓 번호</th>
                            <th>구매자</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 티켓 목록을 EL 반복문으로 출력 -->
                        <c:forEach var="ticket" items="${ticketList}">
                            <tr>
                                <td><input type="checkbox" name="selectedTickets" value="${ticket.ticketNum}"></td>
                                <td>${ticket.matchNum}</td>
                                <td>${ticket.seatNum}</td>
                                <td>${ticket.ticketNum}</td>
                                <td>${ticket.userId}</td>
                                <td>${ticket.ticketStatus}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- 환불 버튼 -->
                <button type="submit" class="btn btn-danger">선택된 티켓 환불</button>
            </form>
        </c:if>

        <!-- 티켓이 없는 경우 -->
        <c:if test="${empty ticketList}">
            <p>조회된 티켓이 없습니다.</p>
        </c:if>
        
        <button type="button" onclick="location.href='./mypage'">뒤로 가기</button>
    </div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
<script src="/resources/js/uesrs/login.js"></script>
</body>
</html>
