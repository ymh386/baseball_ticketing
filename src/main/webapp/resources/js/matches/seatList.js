const seatBtn = document.getElementsByClassName('seatBtn');
const mn = document.getElementById("mn");


for(let sb of seatBtn) {
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
                location.href = `tickets/payment?matchNum=${matchNum}&seatNum=${seatNum}`
            }else {
                alert("매진된 좌석 입니다.")
            }
        })
        .catch(e=>{
            alert("로그인 해주세요")
        })

        
    })
    
}