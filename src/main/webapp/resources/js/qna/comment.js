



const ctcs = document.getElementsByClassName("ctcs");
const subComments = document.getElementsByClassName("subComments");

for(let ctc of ctcs ) {
    ctc.addEventListener("click", function () {
        console.log(ctc.getAttribute("id"))        
        let check = ctc.getAttribute("data-check")

        if(check == 1){
          console.log(check)
          for(let subComment of subComments){
            if(ctc.getAttribute("data-num") == subComment.getAttribute("data-num")){
                console.log("got it")

                let e = document.createElement("td")
                e.innerHTML = '<button>TEST</button>'
                subComment.append(e)
                ctc.setAttribute("data-check", "0")

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
                .then(r => r.text())
                .then(data => {
                  
                  console.log(data);
                  

                })
                
                  
                


            }
          }
        } else {
          console.log(check)
          for(let subComment of subComments){
            if(ctc.getAttribute("data-num") == subComment.getAttribute("data-num")){
              subComment.innerHTML = "";
              ctc.setAttribute("data-check", "1")
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

