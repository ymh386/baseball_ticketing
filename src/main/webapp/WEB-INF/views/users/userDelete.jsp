<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="continer-fluid my-5">
	<div class="row col-md-8 offset-md-2">
		<!-- contents 내용 작성 -->
		
        <form action="./userDelete" method="post" onsubmit="return confirmDelete();">
		<h2>그 동안 저희 baseball ticketing 예매 서비스를 이용해주셔서 감사합니다 </h2>
    
			<h2>id: ${user.userId}</h2>
            <button type="submit">회원 탈퇴 </button>
        </form>

        <script>
            function confirmDelete() {
                return confirm("정말로 탈퇴하시겠습니까 아이디 복구는 불가합니다");
            }
        </script>
				
		
	</div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>