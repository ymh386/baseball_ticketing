



const pages = document.getElementsByClassName("pages");
const pageForm = document.getElementById("pageForm");
const page = document.getElementById("pageNum");

for(let p of pages) {
    p.addEventListener("clicK", function(){
        page.value = p.getAttribute("data-page-num");
        console.log(page.value);
        pageForm.submit();

    })

}
