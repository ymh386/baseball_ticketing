



const select1 = document.getElementById("select1");

if(select1.getAttribute("data-month") != null){
    select1.value = select1.getAttribute("data-month");
}

//
function handleOnChange(e) {
    // 선택된 데이터 가져오기
    const month = e.value;
    console.log(month);

    location.href=`./matchList?month=${month}`;
}