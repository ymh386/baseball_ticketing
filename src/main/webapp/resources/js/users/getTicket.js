// 상태 필터링 함수

const statusFilter = document.getElementById("statusFilter");

// select 요소 스타일 변경
statusFilter.style.width = "100px";  // width 설정




function filterTickets() {
    var selectedStatus = document.getElementById('statusFilter').value;
    var rows = document.querySelectorAll('#ticketTable .ticketRow');

    rows.forEach(function(row) {
        var ticketStatus = row.getAttribute('data-status');
        
        // 선택된 상태가 비어 있으면 모든 티켓을 보여주고, 아니면 선택된 상태만 필터링
        if (selectedStatus === "" || ticketStatus === selectedStatus) {
            row.style.display = '';  // 해당 티켓을 보이게 함
        } else {
            row.style.display = 'none';  // 해당 티켓을 숨김
        }
    });
}

// 환불 확인 창
function confirmRefund() {
    return confirm("정말 환불을 신청하시겠습니까?");
}

// 모달에 정보 세팅
function setTicketInfo(userId, ticketNum, matchNum, seatNum, matchDate, ticketStatus) {
    document.getElementById('modalUserId').textContent = userId;
    document.getElementById('modalTicketNum').textContent = ticketNum;
    document.getElementById('modalMatchNum').textContent = matchNum;
    document.getElementById('modalSeatNum').textContent = seatNum;
    document.getElementById('modalMatchDate').textContent = matchDate;
    document.getElementById('modalTicketNumHidden').value = ticketNum;
    
    if (ticketStatus === '환불완료') {
        document.getElementById('refundButton').style.display = 'none';  // 환불 버튼 숨김
    } else {
        document.getElementById('refundButton').style.display = 'inline-block';  // 환불 버튼 보이기
    }
}
