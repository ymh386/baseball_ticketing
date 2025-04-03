

const cancel = document.getElementById('cancel');
// const payBtn = document.getElementById('payBtn');
const elNaverPayBtn = document.getElementById("naverPayBtn");
let userId = elNaverPayBtn.getAttribute('data-userid');

let oPay = Naver.Pay.create({ //SDK Parameters를 참고 바랍니다.
    "mode" : "development",
    "clientId": "HN3GGCMDdTgGUfl0kFCo",
    "chainId" : "eC85S084MzBnNlZ",
    "openType": "popup",
    "onAuthorize" : function(oData) {
        /*
        팝업 타입을 설정하고, onAuthorize callback function 을 설정하여 결과를 callback function 으로 전달 받을 수 있도록 지원합니다.
        onAuthorize callback function 을 설정하지 않은 경우는 returnUrl 로 참조 정보와 함께 redirect 됩니다.
        oData 객체에는 결제 인증 결과와 전달한 returnUrl 정보가 함께 전달되며,
        이 정보는 이후 승인 요청 처리를 위한 정보 (resultCode, resultMessage, returnUrl, paymentId, reserveId 등) 입니다.
        전달되는 값은 https://developers.pay.naver.com/docs/v2/api#payments-payments_window 의 성공 & 실패 응답 값을 참조해주세요.
        */
        if(oData.resultCode === "Success") {
            // 네이버페이 결제 승인 요청 처리
            let p = new FormData();
            p.append('paymentId', oData.paymentId)
            p.append('productName', cancel.getAttribute('data-matchnum')+'_'+cancel.getAttribute('data-seatnum')) 
            p.append('totalAmount', elNaverPayBtn.getAttribute('data-seatprice'))
            p.append('merchantPayKey', cancel.getAttribute('data-seatnum') + '_0001')
            
            fetch('./paymentAdd', {
                method:'POST',
                body:p
            })
            .then(r=>r.text())
            .then(r=>{
                if(r.trim()*1>0){
                    if(confirm("결제를 완료. 결제내역을 확인하시시겠습니까?")){
                        location.href="./paymentList"
                    }else{
                        location.href="../matches/list"
                    }
                }else{
                    alert("결제 실패")
                }
            }).catch(e=>{
                alert("결제 실패, 관리자에게 문의")
            })
            

            //네이버페이 승인(실패)
            // const pay = document.getElementById('pay')
            // let b = document.createElement('button')
            // b.classList.add('btn', 'btn-success')
            // b.innerHTML="결제 승인"
            // pay.append(b);


            // b.addEventListener('click', ()=>{
            //     let uuid = crypto.randomUUID();
            //     let p = new FormData();
            //     p.append('paymentId', oData.paymentId)
            //     fetch("https://dev-pub.apis.naver.com/naverpay-partner/naverpay/payments/v2.2/apply/payment", {
            //         method:"POST",
            //         headers:{
            //             "X-Naver-Client-Id":"HN3GGCMDdTgGUfl0kFCo",
            //             "X-Naver-Client-Secret":"ftZjkkRNMR",
            //             "X-NaverPay-Chain-Id":"eC85S084MzBnNlZ",
            //             "X-NaverPay-Idempotency-Key":uuid,
            //             "Content-Type":"application/x-www-form-urlencoded"
            //         },
            //         body:p
            //     })
            //     .then(r=>r.text())
            //     .then(r=>{
            //         console.log('zz');
            //         console.log(r);
            //     })
            // })


            // let uuid = crypto.randomUUID();
            // let p = new FormData();
            // p.append('paymentId', oData.paymentId)
            // fetch('https://dev-pub.apis.naver.com/naverpay-partner/naverpay/payments/v2.2/apply/payment', {
            //     method:'POST',
            //     headers: {
            //         'X-Naver-Client-Id': 'HN3GGCMDdTgGUfl0kFCo',
            //         'X-Naver-Client-Secret': 'ftZjkkRNMR',
            //         'X-NaverPay-Chain-Id': 'eC85S084MzBnNlZ',
            //         'X-NaverPay-Idempotency-Key': uuid,
            //         'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
            //     },
            //     body: p
            // })
            // .then(r=>r.text())
            // .then(r=>{
            //     location.href='https://developers.pay.naver.com/user/sand-box/payment/list'
            // })
        } else {
            // 필요 시 oData.resultCode 와 oData.resultMessage 를 활용하여 적절한 사용자 안내 처리 구현
        }
    }
});


elNaverPayBtn.addEventListener("click", function() {
    oPay.open({ // Pay Reserve Parameters를 참고 바랍니다.
    "merchantPayKey": cancel.getAttribute('data-seatnum') + '_0001',
    "productName": cancel.getAttribute('data-matchnum')+'_'+cancel.getAttribute('data-seatnum'),
    "productCount": 1,
    "totalPayAmount": 10,
    "taxScopeAmount": 10,
    "taxExScopeAmount": 0,
    "returnUrl": "https://developers.pay.naver.com/user/sand-box/payment"
    })
});


// 카카오페이(포기기)
// payBtn.addEventListener('click', ()=>{

//     let p = new FormData();
//     p.append('cid', 'TC0ONETIME');
//     p.append('partner_order_id', cancel.getAttribute('data-seatnum') + '_0001');
//     p.append('partner_user_id', `${userId}`);
//     p.append('item_name', cancel.getAttribute('data-matchnum')+'_'+cancel.getAttribute('data-seatnum'));
//     p.append('quantity', 1);
//     p.append('total_amount', 110);
//     p.append('tax_free_amount', 10);
//     p.append('approval_url', 'https://developers.kakao.com/success');
//     p.append('cancel_url', 'https://developers.kakao.com/cancel');
//     p.append('fail_url', 'https://developers.kakao.com/fail');
//     // p.append('approval_url', `/users/mypage?userId=${userId}`);
//     // p.append('cancel_url', '/tickets/payment?matchNum=' + cancel.getAttribute('data-matchnum') + '&seatNum' + cancel.getAttribute('data-seatNum'));
//     // p.append('fail_url', '/tickets/payment?matchNum=' + cancel.getAttribute('data-matchnum') + '&seatNum' + cancel.getAttribute('data-seatNum'));

//     fetch('https://open-api.kakaopay.com/online/v1/payment/ready', {
//         method:'POST',
//         mode: 'no-cors',
//         headers: {
//             "Authorization": "SECRET_KEY DEVB8549A32B21FBA6F8DD8DABCD5E450FA4E98C",
//             "Content-Type": "application/json; charset=UTF-8"
//         },

//         body: p
//     })
//     .then(r=>r.json())
//     .then(r=>{
//         console.log(r);
//     })

    
// })



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