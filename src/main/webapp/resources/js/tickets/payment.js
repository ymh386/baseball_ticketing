const cancel = document.getElementById('cancel');

cancel.addEventListener('click', ()=>{
    let mn = cancel.getAttribute('data-matchnum');
    let sn = cancel.getAttribute('data-seatnum');
    console.log(mn);
    console.log(sn);
})