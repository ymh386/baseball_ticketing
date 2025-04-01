



const idNextPage = document.getElementById("idNextPage");
const matchNum = idNextPage.getAttribute("data-matchNum");
const idReviewTbody = document.getElementById("idReviewTbody");



//
window.addEventListener('scroll', function(){
    const isScrollEnded =
    window.innerHeight + window.scrollY >= document.body.offsetHeight;

    if (isScrollEnded) {
        f1(); sleep(1000);

    }
})


//
let page = 1;
let f1 = function(){

    page += 1;
    let formData = new FormData();
    formData.append('matchNum', matchNum);
    formData.append('page', page);

    fetch('./getReviewList', {
        method: 'POST',
        cache: 'no-cache',
        body: formData // body 부분에 폼데이터 변수를 할당
    })
    .then((response) => response.json())
    .then((data) => {
        console.log(data);

        for(let dto of data){
            let tr = document.createElement("tr");
            let td1 = document.createElement("td");
            let td2 = document.createElement("td");
            let td3 = document.createElement("td");
            let td4 = document.createElement("td");
            let td5 = document.createElement("td");
            let td6 = document.createElement("td");
            
            td1.innerHTML = dto.reviewNum;
            tr.append(td1);

            td2.innerHTML = dto.userId;
            tr.append(td2);

            td3.innerHTML = dto.boardContent;
            tr.append(td3);

            td4.innerHTML = dto.boardDate;
            tr.append(td4);

            let btn5 = document.createElement("button");
            btn5.addEventListener("click", function(){
                location.href='./updateReview?reviewNum=${v.reviewNum}&matchNum=${v.matchNum}'
            })
            btn5.innerHTML = "수정";
            td5.append(btn5);
            tr.append(td5);

            let btn6 = document.createElement("button");
            btn6.addEventListener("click", function(){
                location.href='./deleteReview?reviewNum=${v.reviewNum}&matchNum=${v.matchNum}'
            })
            btn6.innerHTML = "X";
            td6.append(btn6);
            tr.append(td6);

            idReviewTbody.append(tr);
        }

    });

    

}


//
idNextPage.addEventListener("click", function(){

    page += 1;

    let formData = new FormData();
    formData.append('matchNum', matchNum);
    formData.append('page', page);

    fetch('./getReviewList', {
        method: 'POST',
        cache: 'no-cache',
        body: formData // body 부분에 폼데이터 변수를 할당
    })
    .then((response) => response.json())
    .then((data) => {
        console.log(data);

        for(let dto of data){
            let tr = document.createElement("tr");
            let td1 = document.createElement("td");
            let td2 = document.createElement("td");
            let td3 = document.createElement("td");
            let td4 = document.createElement("td");
            let td5 = document.createElement("td");
            let td6 = document.createElement("td");
            
            td1.innerHTML = dto.reviewNum;
            tr.append(td1);

            td2.innerHTML = dto.userId;
            tr.append(td2);

            td3.innerHTML = dto.boardContent;
            tr.append(td3);

            td4.innerHTML = dto.boardDate;
            tr.append(td4);

            let btn5 = document.createElement("button");
            btn5.addEventListener("click", function(){
                location.href='./updateReview?reviewNum=${v.reviewNum}&matchNum=${v.matchNum}'
            })
            btn5.innerHTML = "수정";
            td5.append(btn5);
            tr.append(td5);

            let btn6 = document.createElement("button");
            btn6.addEventListener("click", function(){
                location.href='./deleteReview?reviewNum=${v.reviewNum}&matchNum=${v.matchNum}'
            })
            btn6.innerHTML = "X";
            td6.append(btn6);
            tr.append(td6);

            idReviewTbody.append(tr);
        }

    });

    

})
