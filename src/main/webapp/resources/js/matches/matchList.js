const myTeam = document.getElementById('myTeam')
const select1 = document.getElementById("select1");

myTeam.addEventListener('click', ()=>{
    const myTeamNum = myTeam.getAttribute('myTeamNum').trim()
    const month = select1.getAttribute("data-month");

    if(myTeam.checked) {
        location.href=`./list?month=${month}&myTeamNum=${myTeamNum}`;
        let check = document.createAttribute('checked');
        myTeam.setAttribute(check);
    }
    else {
        location.href=`./list?month=${month}`;
        myTeam.remove(check);
    }
})




if(select1.getAttribute("data-month") != null){
    select1.value = select1.getAttribute("data-month");
}

//
function handleOnChange(e) {
    // 선택된 데이터 가져오기
    const month = e.value;
    console.log(month);

    location.href=`./list?month=${month}`;
}