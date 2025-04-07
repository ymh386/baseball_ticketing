



const ctcs = document.getElementsByClassName("ctcs");
const wrapper_subComments = document.getElementsByClassName("wrapper-subComments");

const addSubComments = document.getElementsByClassName("addSubComments");


//
for(let addSubComment of addSubComments) {
  addSubComment.addEventListener("click", function() {

    let text = document.createElement("textarea");
    let go = document.createElement("button");
    go.innerText="작성";
    let del = document.createElement("button");
    del.innerText="X";
    addSubComment.parentNode.append(text);
    addSubComment.parentNode.append(go);
    addSubComment.parentNode.append(del);

  //   let formData = new FormData();
  //   formData.append("commentRef", addSubComment.getAttribute("data-rnum"));
  //   formData.append("commentNum", addSubComment.getAttribute("data-cnum"));
  //   formData.append("boardNum", addSubComment.getAttribute("data-bnum"));
  //   formData.append("boardContent", "내용1");

  //   fetch("./addComment", {
  //     method: 'POST',
  //     cache: 'no-cache',
  //     body: formData
  //   })
  //   .then(r => r.text())
  //   .then(text => {
  //     console.log(text);
  //     location.href=`./detail?boardNum=${addSubComment.getAttribute("data-bnum")}`
  //   })
   })
}



//
for(let ctc of ctcs ) {
    ctc.addEventListener("click", function () {
        console.log(ctc.getAttribute("id"))        
        let check = ctc.getAttribute("data-check")

        // 답글 최초 요청
        if(check == 1){
          console.log(check)
          for(let subComment of wrapper_subComments){
            if(ctc.getAttribute("data-num") == subComment.getAttribute("data-num")){
                console.log("got it")

                ctc.setAttribute("data-check", "2")
                

                //---------------------------------------
                let url ='./getSubCommentList'; // 상대 경로
                fetch(url, {
                    method:'POST',
                    headers:{
                        "Content-type":"application/x-www-form-urlencoded; charset=UTF-8"
                    },
                    body: `commentRef=${ctc.getAttribute("data-num")}`

                })
                //컬렉션이 오면 어떻게 출력?
                .then(r => r.json())
                .then((data) => {
                  console.log(data);
                  
                  subComment.style.display = "block";
                  for(let dto of data){
                      let tr = document.createElement("div");
                      let td1 = document.createElement("span");
                      let td2 = document.createElement("span");
                      let td3 = document.createElement("span");
                      let td4 = document.createElement("span");
                      let td5 = document.createElement("span");
                      let td6 = document.createElement("span");
                      let td7 = document.createElement("span");
                      
                      td1.innerHTML = dto.commentRef;
                      tr.append(td1);
          
                      td2.innerHTML = dto.commentStep;
                      tr.append(td2);
          
                      td3.innerHTML = dto.userId;
                      tr.append(td3);
          
                      td4.innerHTML = dto.boardContent;
                      tr.append(td4);

                      td5.innerHTML = dto.boardDate;
                      tr.append(td5);
                      
                      tr.append(td6);


                      let btn7 = document.createElement("button");
                      btn7.addEventListener("click", function(){
                          location.href=`./deleteComment?commentNum=${dto.commentNum}&boardNum=${dto.boardNum}`;
                      })
                      
                      btn7.innerHTML = "X";
                      td7.append(btn7);
                      tr.append(td7);

                      tr.setAttribute("class", "subComments");
                      subComment.append(tr);
          
                      
                  }
          
              });
                
                  
            }
          }
        // 답글창 가리기
        } else if(check == 2){
          console.log(check)
          for(let subComment of wrapper_subComments){
            if(ctc.getAttribute("data-num") == subComment.getAttribute("data-num")){
              subComment.style.display = "none";
              ctc.setAttribute("data-check", "3")
            }
          }
        // 답글창 보이기 (요청 없이)
        } else if(check == 3){
          console.log(check)
          for(let subComment of wrapper_subComments){
            if(ctc.getAttribute("data-num") == subComment.getAttribute("data-num")){
              subComment.style.display = "block";
              ctc.setAttribute("data-check", "2")
            }
          }

        }

        // fetch(
        //     'https://jsonplaceholder.typicode.com/posts', {
        //     method: 'POST', // 요청 메서드를 POST로 지정
        //     body: JSON.stringify({
        //       title: 'foo',
        //       body: 'bar',
        //       userId: 1,
        //     }),
        //     headers: {
        //       'Content-type': 'application/json; charset=UTF-8',
        //     },
        //   })
        //     .then((response) => response.json())
        //     .then((json) => console.log(json));


    })



}


