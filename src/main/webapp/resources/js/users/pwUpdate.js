function validatePassword() {
    const newPassword = document.getElementById("newPassword").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,16}$/;

    // 새 비밀번호와 확인 비밀번호 일치 여부 확인
    if (newPassword !== confirmPassword) {
        alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
        return false;  // 폼 제출을 막음
    }

    // 비밀번호 유효성 검사 (8~16자, 영문, 숫자, 특수문자 포함)
    if (!passwordPattern.test(newPassword)) {
        alert("비밀번호는 8~16자, 영문, 숫자, 특수문자를 포함해야 합니다.");
        return false;  // 폼 제출을 막음
    }

    // 비밀번호가 성공적으로 변경되었음을 알림
    alert("비밀번호가 성공적으로 변경되었습니다.");
    return true;  // 폼 제출을 허용
}
