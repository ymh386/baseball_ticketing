<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
    <c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

    <div class="container-fluid my-5">
        <div class="row col-md-8 offset-md-2">
            <!-- contents 내용 작성 -->
            <h2>비밀번호 변경</h2>
            
            <c:if test="${not empty message}">
                <script>
                    alert("${message}");
                </script>
            </c:if>
            
            <form action="./pwUpdate" method="post" onsubmit="return validatePassword()">
                <div>
                    <label for="currentPassword">현재 비밀번호</label>
                    <input type="password" id="currentPassword" name="currentPassword" required />
                </div>
                <div>
                    <label for="newPassword">변경할 비밀번호</label>
                    <input type="password" id="newPassword" name="newPassword" required />
                </div>
                <div>
                    <label for="confirmPassword">변경할 비밀번호 재입력</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required />
                </div>
                <div>
                    <button type="submit">비밀번호 변경</button>
                </div>
            </form>
        </div>
    </div>

    <c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
    <c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
    <script src="/resources/js/users/pwUpdate.js"></script> <!-- 경로 수정 -->
</body>
</html>
