const seatBtn = document.getElementsByClassName('seatBtn');
const mn = document.getElementById("mn");


for(let sb of seatBtn) {
    sb.addEventListener('click', ()=>{
        seatNum = sb.getAttribute('data-seatlevel') + sb.innerHTML;
        console.log(seatNum);
        let f = new FormData();
        f.append("matchNum", mn.getAttribute('data-matchnum'));
        f.append("seatNum", seatNum);

        fetch('../tickets/add', {
            method:'POST',
            body: f
        })
    })
    
}