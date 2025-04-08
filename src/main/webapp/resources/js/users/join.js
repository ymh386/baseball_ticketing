document.getElementById("signupForm").addEventListener("submit", function(event) {
    event.preventDefault(); // 기본 제출 방지

    let isValid = true;

    // 필드 값 가져오기
    const userId = document.getElementById("userId").value;
    const password = document.getElementById("password").value;
    const email = document.getElementById("email").value;

    // 오류 메시지 요소 가져오기
    const userIdError = document.getElementById("userIdError");
    const passwordError = document.getElementById("passwordError");
    const emailError = document.getElementById("emailError");

    // 오류 메시지 초기화
    userIdError.textContent = "";
    passwordError.textContent = "";
    emailError.textContent = "";

    // 오류 메시지 스타일 초기화
    userIdError.style.color = "red";
    passwordError.style.color = "red";
    emailError.style.color = "red";

    // 유효성 검사
    let userIdPattern = /^[a-zA-Z0-9]{5,12}$/;
    if (!userIdPattern.test(userId)) {
        userIdError.textContent = "아이디는 5~12자 영문 숫자 포함";
        isValid = false;
    }

    let passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,16}$/;
    if (!passwordPattern.test(password)) {
        passwordError.textContent = "비밀번호는 8~16자, 영문 숫자 특수문자 포함";
        isValid = false;
    }

    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        emailError.textContent = "올바른 이메일 형식을 입력하세요";
        isValid = false;
    }

    // 유효성 검사 통과 시, 회원가입 완료
    if (isValid) {
        alert("회원가입이 완료되었습니다!");
        this.submit();
    }
});


document.getElementById("checkIdBtn").addEventListener("click", function () {
    const userIdInput = document.getElementById("userId");
    const userId = userIdInput.value.trim();
    const errorDiv = document.getElementById("userIdError");

    if (!userId) {
        errorDiv.textContent = "아이디를 입력해주세요.";
        userIdInput.focus();
        return;
    }

    fetch("./checkId", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ userId: userId })  // JSON으로 보냄
    })
        .then(response => response.json()) 
        .then(data => {
            if (data.exists) {
                errorDiv.textContent = "이미 사용 중인 아이디입니다.";
                errorDiv.classList.remove("text-success");
                errorDiv.classList.add("text-danger");
            } else {
                errorDiv.textContent = "사용 가능한 아이디입니다.";
                errorDiv.classList.remove("text-danger");
                errorDiv.classList.add("text-success");
            }
        })
        .catch(error => {
            console.error("에러 발생:", error);
            errorDiv.textContent = "중복 확인 중 오류가 발생했습니다.";
            errorDiv.classList.add("text-danger");
        });
});



