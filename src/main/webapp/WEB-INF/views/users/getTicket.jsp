<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 구매 내역</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>

<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
    <c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

    <div class="container my-5">
        <div class="row">
            <div class="col-md-12 mb-3">
                <h4>티켓 구매 내역</h4>

     
            </div>

            <!-- 현재 날짜 포맷 -->
            <fmt:formatDate var="today" value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd HH:mm:ss" />

            <c:if test="${not empty ticketList}">
                <c:forEach var="ticket" items="${ticketList}">
                    <!-- 홈팀 이름 세팅 -->
                    <c:set var="homeTeamName"
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

                    <!-- 어웨이팀 이름 세팅 -->
                    <c:set var="awayTeamName"
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

                    <!-- 티켓 카드 -->
                    <div class="col-sm-6 col-lg-4 mb-4 ticketCard" data-status="${ticket['TICKETSTATUS']}">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <h6 class="card-title">티켓번호: ${ticket['TICKETNUM']}</h6>
                                <p class="mb-1"><strong>구매자:</strong> ${ticket['USERID']}</p>
                                <p class="mb-1"><strong>좌석 번호:</strong> ${ticket['SEATNUM']}</p>
                                <p class="mb-1"><strong>홈팀:</strong> ${homeTeamName}</p>
                                <p class="mb-1"><strong>어웨이팀:</strong> ${awayTeamName}</p>
                                <p class="mb-1"><strong>경기장:</strong> ${ticket['STADIUMNAME']}</p>
                                <p class="mb-1"><strong>경기 날짜:</strong> ${ticket['MATCHDATE']}</p>
                                <p class="mb-2"><strong>티켓 상태:</strong> ${ticket['TICKETSTATUS']}</p>

                                <c:if test="${ticket['TICKETSTATUS'] == '예매완료' and ticket['MATCHDATE'] >= today}">
                                    <form action="./refund" method="POST" onsubmit="return confirm('정말로 환불하시겠습니까?')">
                                        <input type="hidden" name="paymentId" value="${ticket['PAYMENTID']}">
                                        <input type="hidden" name="ticketNum" value="${ticket['TICKETNUM']}">
                                        <input type="hidden" name="seatNum" value="${ticket['SEATNUM']}">
                                        <button type="submit" class="btn btn-dark btn-sm btn-block">환불 신청</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${empty ticketList}">
                <div class="col-12">
                    <p class="text-muted">조회된 티켓이 없습니다.</p>
                </div>
            </c:if>

            <div class="col-12 mt-3">
                <button type="button" class="btn btn-secondary" onclick="location.href='./mypage'">뒤로가기</button>
            </div>
        </div>
    </div>


    <c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>

    <!-- JS 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
