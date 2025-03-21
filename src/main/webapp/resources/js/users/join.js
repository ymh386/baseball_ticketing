
document.getElementById("signupForm").addEventListener("submit", function(event) {
    event.preventDefault(); // 기본 제출 방지

    let isValid = true;




const userId = document.getElementById("userId").value;
const password = document.getElementById("password").value;
const email = document.getElementById("email").value;


const userIdError = document.getElementById("userIdError");
const passwordError = document.getElementById("passwordError");
const emailError = document.getElementById("emailError");



userIdError.textContent = "";
passwordError.textContent ="";
emailError.textContent = "";


let userIdPattern = /^[a-zA-Z0-9]{5,12}$/;

if(!userIdPattern.test(userId)){
    userIdError.textContent = "아이디는 5~12자 영문 숫자 포함"
    isValid = false;
}

let passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,16}$/;


if(!passwordPattern.test(password)){
    passwordError.textContent = "비밀번호는 8~16자, 영문 숫자 특수문자 포함"
    isValid = false;
}

let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
if (!emailPattern.test(email)) {
    emailError.textContent = "올바른 이메일 형식을 입력하세요";
    isValid = false;
}


if (isValid) {
    alert("회원가입이 완료되었습니다!");
    this.submit();
}




});






