



const idImageEditor = document.getElementById("idImageEditor");
const idBoardContent = document.getElementById("idBoardContent");
const idSubmit = document.getElementById("idSubmit");
const idForm = document.getElementById("idForm");
const EditorWrapper = document.getElementById("EditorWrapper");

const idAddImage = document.getElementById("idAddImage");
const idImageInput = document.getElementById("idImageInput");

idSubmit.addEventListener("click", function(){
    idBoardContent.setAttribute("value", idImageEditor.innerHTML)
    idForm.submit();
})

idAddImage.addEventListener("click", function(){

    idImageEditor.innerHTML = idImageEditor.innerHTML + idImageInput.innerHTML
    
    let tempHTML = EditorWrapper.innerHTML;
    
    idImageEditor.remove();

    EditorWrapper.innerHTML = tempHTML;    

                   
                

    

})