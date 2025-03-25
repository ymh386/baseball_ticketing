const cancel = document.getElementById('cancel');
const payBtn = document.getElementById('payBtn');
let userId = payBtn.getAttribute('data-userid');

payBtn.addEventListener('click', ()=>{

    let p = new FormData();
    p.append('cid', 'TC0ONETIME');
    p.append('partner_order_id', cancel.getAttribute('data-seatnum') + '_0001');
    p.append('partner_user_id', `${userId}`);
    p.append('item_name', cancel.getAttribute('data-matchnum')+'_'+cancel.getAttribute('data-seatnum'));
    p.append('quantity', 1);
    p.append('total_amount', 110);
    p.append('tax_free_amount', 10);
    p.append('approval_url', 'https://developers.kakao.com/success');
    p.append('cancel_url', 'https://developers.kakao.com/cancel');
    p.append('fail_url', 'https://developers.kakao.com/fail');
    // p.append('approval_url', `/users/mypage?userId=${userId}`);
    // p.append('cancel_url', '/tickets/payment?matchNum=' + cancel.getAttribute('data-matchnum') + '&seatNum' + cancel.getAttribute('data-seatNum'));
    // p.append('fail_url', '/tickets/payment?matchNum=' + cancel.getAttribute('data-matchnum') + '&seatNum' + cancel.getAttribute('data-seatNum'));

    fetch('https://open-api.kakaopay.com/online/v1/payment/ready', {
        method:'POST',
        mode: 'no-cors',
        headers: {
            "Authorization": "SECRET_KEY DEVB8549A32B21FBA6F8DD8DABCD5E450FA4E98C",
            "Content-Type": "application/json; charset=UTF-8"
        },

        body: p
    })
    .then(r=>r.json())
    .then(r=>{
        console.log(r);
    })

    
})



cancel.addEventListener('click', ()=>{
    let mn = cancel.getAttribute('data-matchnum')*1;
    let sn = cancel.getAttribute('data-seatnum');
    console.log(mn);
    console.log(sn);
    let f = new FormData();
    f.append('matchNum', mn);
    f.append('seatNum', sn);
    if(confirm("결제를 취소하겠습니까?")){
        fetch("./delete", {
            method:'POST',
            body: f
        })
        .then(r=>r.text())
        .then(r=>{
            if(r.trim()*1>0) {
                alert("취소 완료")
                location.href=`/matches/seatList?matchNum=${mn}`  
            } else{
                alert("취소 불가")
            }
        }).catch(e => {
            alert("관리자에게 문의")
        })
    }
})