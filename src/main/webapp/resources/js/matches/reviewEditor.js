



const idImageEditor = document.getElementById("idImageEditor");
const idBoardContent = document.getElementById("idBoardContent");
const idSubmit = document.getElementById("idSubmit");
const idForm = document.getElementById("idForm");
const EditorWrapper = document.getElementById("EditorWrapper");

const idAddImage = document.getElementById("idAddImage");
const idImageInput = document.getElementById("idImageInput");

const imgWrapper = document.getElementsByClassName("imgWrapper");

const caretClass = document.getElementsByClassName("caretClass");





//
let ccF = function(){
    var caretID = 'idCaret';
    var cc = document.createElement("span");
    cc.id = caretID;
    cc.setAttribute("class", "caretClass");
    
    window.getSelection().getRangeAt(0).insertNode(cc);    
}


//
// idImageEditor.addEventListener("focus", function(){
//     const savedImgs = document.getElementsByClassName("savedImgs");
//     let list = new Array();
    
//     for(let savedImg of savedImgs){
//         list.push(savedImg.getAttribute("src"));
//     }

//     let formData = new FormData();
//     formData.append("list", list);

//     fetch("./deleteTempImage", {
//         method: 'POST',
//         cache: 'no-cache',
//         body: formData
//     })

// })


//
idImageEditor.addEventListener("blur", function() {
    
    for(let caret of caretClass){
        if(caret.innerHTML == ""){
            caret.remove();
        }
    }

    ccF();

    const selectedText = window.getSelection().toString();
    const { anchorNode, focusNode, anchorOffset, focusOffset, isCollapsed } = window.getSelection();
    
    console.log(selectedText);
    console.log(anchorOffset);
    console.log(focusOffset);
    console.log(isCollapsed);
    
})


//
idImageEditor.addEventListener('click', function(e){

    let user = e.target.getAttribute("data-user");
    if(user == ""){
        alert("로그인 후 작성 가능합니다");
        e.target.setAttribute("contenteditable", false);
    }

    if(e.target.classList.contains('imgs')){
       
        console.log(e.target.getAttribute("id"))
        console.log(e.target.getAttribute("src"))
        let check = confirm("선택한 이미지를 삭제합니다");

        e.target.parentElement.remove();


        // 이미지 삭제 요청
        // if(check) {
        //     let formData = new FormData();
        //     formData.append("src", e.target.getAttribute("src"));

        //     fetch("./deleteTempImage", {
        //         method: 'POST',
        //         cache: 'no-cache',
        //         body: formData
        //     })
        //     .then(function(response) {
        //         return response.json(); // 응답을 JSON 형식으로 변환
        //     })
        //     .then(function(data) {
        //         console.log(data); // JSON 데이터를 출력
        //         e.target.remove();

        //     })
        //     .catch(function(error) {
        //         console.error(error); // 에러를 출력
        //     });
        // }
    }
})



//
idSubmit.addEventListener("click", function(){
    const idCaret = document.getElementById("idCaret");
    idCaret.id = "";

    const imgs = document.getElementsByClassName("imgs");
    for(let img of imgs){
        img.setAttribute("class", "savedImgs");
    }

    idBoardContent.setAttribute("value", idImageEditor.innerHTML)
    idForm.submit();

})


//
idAddImage.addEventListener("click", function(){
    let formData = new FormData();

    if(idImageInput.files[0] != null){

        formData.append("attaches", idImageInput.files[0]);
    
        fetch("./tempImage", {
            method: 'POST',
            cache: 'no-cache',
            body: formData
        })
        .then(function(response) {
            return response.json(); // 응답을 JSON 형식으로 변환
        })
        .then(function(data) {
            console.log(data); // JSON 데이터를 출력
            let strHead = "<img class='imgs' src='";
            let strFoot = "' style='width:80px; height:80px;'>";

            // let strHead = "<div class='imgWrapper'><img class='imgs' id='idImg"+ idCount +"' src='";            
            // let strFoot = "' style='width:80px; height:80px;'></div>";

            let strBody = data.tempImage;
            let strSum = strHead + strBody + strFoot;
            
            const idCaret = document.getElementById("idCaret");
            idCaret.innerHTML = strSum;
            idCaret.id = "";

            idImageEditor.focus();
            

        })
        .catch(function(error) {
            console.error(error); // 에러를 출력
        });
    }
    

            // let str = '<img src="/resources/images/qna/d338deb8-c682-4eaa-8ecc-9ee1f95f5aff_img1.jpg"></img>';

            // idImageEditor.innerHTML += str;
		
               

})


