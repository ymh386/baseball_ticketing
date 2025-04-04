



const btn1 = document.getElementById("btn1");
const idTestDiv = document.getElementById("idTestDiv");

const classImg = document.getElementsByClassName("classImg");

const caretClass = document.getElementsByClassName("caretClass");

//
idTestDiv.addEventListener('click', function(e){
    if(e.target.classList.contains('classImg')){
        e.target.parentElement.remove();

    }
})    

//
let ccF = function(){
    var caretID = 'idCaret';
    var cc = document.createElement("span");
    cc.id = caretID;
    cc.setAttribute("class", "caretClass");

    window.getSelection().getRangeAt(0).insertNode(cc);
}


//
idTestDiv.addEventListener("blur", function() {
    
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
btn1.addEventListener("click", function() {
    const idCaret = document.getElementById("idCaret");
    idCaret.innerHTML = "<img class='classImg' src='/resources/images/stadiums/Gochuck.jpg' style='width: 100px; height: 100px;'>";
    idCaret.id = "";

    
    
})





