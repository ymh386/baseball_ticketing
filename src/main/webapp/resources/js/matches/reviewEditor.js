



const idImageEditor = document.getElementById("idImageEditor");
const idBoardContent = document.getElementById("idBoardContent");
const idSubmit = document.getElementById("idSubmit");
const idForm = document.getElementById("idForm");
const EditorWrapper = document.getElementById("EditorWrapper");

const idAddImage = document.getElementById("idAddImage");
const idImageInput = document.getElementById("idImageInput");

const imgWrapper = document.getElementsByClassName("imgWrapper");



idImageEditor.addEventListener('click', function(e){
    if(e.target.classList.contains('imgs')){
       
        console.log(e.target.getAttribute("id"))
        console.log(e.target.getAttribute("src"))
        let check = confirm("선택한 이미지를 삭제합니다");

        if(check) {
            let formData = new FormData();
            formData.append("src", e.target.getAttribute("src"));

            fetch("./deleteTempImage", {
                method: 'POST',
                cache: 'no-cache',
                body: formData
            })
            .then(function(response) {
                return response.json(); // 응답을 JSON 형식으로 변환
            })
            .then(function(data) {
                console.log(data); // JSON 데이터를 출력
                e.target.remove();

            })
            .catch(function(error) {
                console.error(error); // 에러를 출력
            });
        }
    }
})



//
idSubmit.addEventListener("click", function(){
    idBoardContent.setAttribute("value", idImageEditor.innerHTML)
    idForm.submit();

})


//
let idCount = 0;
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
            idCount += 1;
            let strHead = "<img class='imgs' id='idImg"+ idCount +"' src='";
            let strFoot = "' style='width:80px; height:80px;'>";

            // let strHead = "<div class='imgWrapper'><img class='imgs' id='idImg"+ idCount +"' src='";            
            // let strFoot = "' style='width:80px; height:80px;'></div>";

            let strBody = data.tempImage;
            let strSum = strHead + strBody + strFoot;
            
            idImageEditor.innerHTML += strSum;


        })
        .catch(function(error) {
            console.error(error); // 에러를 출력
        });
    }
    




    
            // let str = '<img src="/resources/images/qna/d338deb8-c682-4eaa-8ecc-9ee1f95f5aff_img1.jpg"></img>';

            // idImageEditor.innerHTML += str;
		
                   
                

    

})