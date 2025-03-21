

const userId = document.getElementById("userid");
const password = document.getElementById("password");
const login_button = document.getElementById("login_button");



login_button.addEventListener('click',()=>{
    
    if(userId.value.length==0){
    alert("아이디 입력은 필수 입니다")
    userName.focus();

    return;
}

    if(password.value==""){
        alert("비밀번호 입력은 필수 입니다")
        password.focus();

        return;
    }

    document.getElementById("login_form").submit();


})
    

