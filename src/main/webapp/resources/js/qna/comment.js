



const ctcs = document.getElementsByClassName("ctcs");
const subComments = document.getElementsByClassName("subComments");

for(let ctc of ctcs ) {
    ctc.addEventListener("click", function () {
        console.log(ctc.getAttribute("id"))

        for(let subComment of subComments){
            if(ctc.getAttribute("data-num") == subComment.getAttribute("data-num")){
                console.log("got it")

                let e = document.createElement("td")
                e.innerHTML = '<button>TEST</button>'
                subComment.append(e)

            }
        }

        

    })

}