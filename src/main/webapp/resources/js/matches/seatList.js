const seatBtn = document.getElementsByClassName('seatBtn');
const mn = document.getElementById("mn");
const ticketSeat = document.getElementsByClassName('ticketseat');




for(let sb of seatBtn) {

    let sc = sb.getAttribute('data-seatcount');
    let sl = sb.getAttribute('data-seatlevel');
    let sn = sl + sb.innerHTML;

    for(let ts of ticketSeat) {
        if(sn == ts.getAttribute('data-ticketseat')){
            if(sb.classList.contains('btn-outline-warning')){
                sb.classList.replace('btn-outline-warning', 'btn-secondary')
            }else if(sb.classList.contains('btn-outline-success')){
                sb.classList.replace('btn-outline-success', 'btn-secondary')
            }else if(sb.classList.contains('btn-outline-primary')){
                sb.classList.replace('btn-outline-primary', 'btn-secondary')
            }
        }
    }

    sb.addEventListener('click', ()=>{
        let seatNum = sb.getAttribute('data-seatlevel') + sb.innerHTML;
        let matchNum = mn.getAttribute('data-matchnum')*1;
        let f = new FormData();
        f.append('matchNum', matchNum);
        f.append('seatNum', seatNum);

        fetch('/tickets/add', {
            method:'POST',
            body: f
        })
        .then(r=>r.text())
        .then(r=>{
            if(r.trim()*1>0){   
                alert("좌석선택완료")
                location.href = `/tickets/payment?matchNum=${matchNum}&seatNum=${seatNum}`
            }else {
                alert("매진된 좌석 입니다.")
            }
        })
        .catch(e=>{
            alert("로그인 해주세요")
        })

        
    })
    
}