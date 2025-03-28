<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 정보</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>

<!-- Bootstrap CSS 추가 -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="container-fluid my-5">
    <div class="row col-md-8 offset-md-2">
        <h2>티켓 정보</h2>

        <c:if test="${not empty ticketList}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>매치 번호</th>
                        <th>좌석 번호</th>
                        <th>티켓 번호</th>
                        <th>구매자</th>
                        <th>상태</th>
                        <th>홈팀</th>
                        <th>어웨이팀</th>
                        <th>경기 날짜</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ticket" items="${ticketList}">
                        <tr>
                            <td>${ticket['MATCHNUM']}</td>
                            <td>${ticket['SEATNUM']}</td>
                            <td>${ticket['TICKETNUM']}</td>
                            <td>
                                <!-- 구매자 이름 클릭 시 모달 창 띄우기 -->
                                <a href="#" data-toggle="modal" data-target="#ticketModal" 
                                   onclick="setTicketInfo('${ticket['USERID']}', '${ticket['TICKETNUM']}', '${ticket['MATCHNUM']}', '${ticket['SEATNUM']}', '${ticket['MATCHDATE']}', '${ticket['TICKETSTATUS']}')">
                                    ${ticket['USERID']}
                                </a>
                            </td>
                            <td>${ticket['TICKETSTATUS']}</td>

                            <!-- 팀 번호를 팀 이름으로 변환 -->
                            <c:set var="homeTeamName" value="${ticket['HOMETEAM'] == 1 ? '기아 타이거즈' : 
                                                             ticket['HOMETEAM'] == 2 ? 'SSG 랜더스' : 
                                                             ticket['HOMETEAM'] == 3 ? '한화 이글스' :
                                                             ticket['HOMETEAM'] == 4 ? '키움 히어로즈' : 
                                                             ticket['HOMETEAM'] == 5 ? '삼성 라이온즈' : 
                                                             ticket['HOMETEAM'] == 6 ? '롯데 자이언츠' : 
                                                             ticket['HOMETEAM'] == 7 ? '케이티 위즈' : 
                                                             ticket['HOMETEAM'] == 8 ? '엘지 트윈스' : 
                                                             ticket['HOMETEAM'] == 9 ? '엔씨 다이노스' : 
                                                             ticket['HOMETEAM'] == 10 ? '두산 베어스' : '미지정'}" />

                            <c:set var="awayTeamName" value="${ticket['AWAYTEAM'] == 1 ? '기아 타이거즈' : 
                                                             ticket['AWAYTEAM'] == 2 ? 'SSG 랜더스' : 
                                                             ticket['AWAYTEAM'] == 3 ? '한화 이글스' :
                                                             ticket['AWAYTEAM'] == 4 ? '키움 히어로즈' : 
                                                             ticket['AWAYTEAM'] == 5 ? '삼성 라이온즈' : 
                                                             ticket['AWAYTEAM'] == 6 ? '롯데 자이언츠' : 
                                                             ticket['AWAYTEAM'] == 7 ? '케이티 위즈' : 
                                                             ticket['AWAYTEAM'] == 8 ? '엘지 트윈스' : 
                                                             ticket['AWAYTEAM'] == 9 ? '엔씨 다이노스' : 
                                                             ticket['AWAYTEAM'] == 10 ? '두산 베어스' : '미지정'}" />

                            <td>${homeTeamName}</td>
                            <td>${awayTeamName}</td>
                            <td>${ticket['MATCHDATE']}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- 티켓이 없는 경우 -->
        <c:if test="${empty ticketList}">
            <p>조회된 티켓이 없습니다.</p>
        </c:if>

        <button type="button" onclick="location.href='./mypage'">뒤로 가기</button>
    </div>
</div>

<!-- 모달 -->
<div class="modal" id="ticketModal" tabindex="-1" role="dialog" aria-labelledby="ticketModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ticketModalLabel">티켓 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p><strong>구매자:</strong> <span id="modalUserId"></span></p>
                <p><strong>티켓 번호:</strong> <span id="modalTicketNum"></span></p>
                <p><strong>매치 번호:</strong> <span id="modalMatchNum"></span></p>
                <p><strong>좌석 번호:</strong> <span id="modalSeatNum"></span></p>
                <p><strong>경기 날짜:</strong> <span id="modalMatchDate"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <!-- 환불 신청 버튼 -->
                <form action="./refund" method="POST">
                    <input type="hidden" id="modalTicketNumHidden" name="ticketNum">
                    <!-- 환불 버튼, ID 'refundButton' 추가 -->
                    <button type="submit" class="btn btn-danger" id="refundButton">환불 신청</button>
                </form>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>

<!-- Bootstrap JS & jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
// 모달에 정보 세팅
function setTicketInfo(userId, ticketNum, matchNum, seatNum, matchDate, ticketStatus) {
    // 모달에 정보 세팅
    document.getElementById('modalUserId').textContent = userId;
    document.getElementById('modalTicketNum').textContent = ticketNum;
    document.getElementById('modalMatchNum').textContent = matchNum;
    document.getElementById('modalSeatNum').textContent = seatNum;
    document.getElementById('modalMatchDate').textContent = matchDate;
    document.getElementById('modalTicketNumHidden').value = ticketNum;
    
    // 상태가 '환불완료'일 경우 환불 버튼 숨기기
    if (ticketStatus === '환불완료') {
        document.getElementById('refundButton').style.display = 'none';  // 환불 버튼 숨김
    } else {
        document.getElementById('refundButton').style.display = 'inline-block';  // 환불 버튼 보이기
    }
}
</script>

<script src="/resources/js/users/login.js"></script>
</body>
</html>
