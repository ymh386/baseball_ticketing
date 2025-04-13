<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>

<style>
.innerDiv {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 1rem;
}

.btn {
	font-size: larger;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="container my-5">
  <div class="d-flex justify-content-center">
    <div class="login-box border rounded p-4 shadow-sm bg-light">

      <div class="text-center mb-4">
        <img src="${pageContext.request.contextPath}/resources/images/teams/kbo.jpg" alt="KBO 로고" style="width: 150px;">
      </div>

      <!-- contents 내용 작성 -->
      
      <form action="./add" method="post">
		  <div class="innerDiv mb-3">
		    <label for="stadiumNum" class="form-label w-100">경기장</label>
		    <div class="ipts d-flex justify-content-center">
		      <select id="stadiumNum" style="width: 350px; cursor: pointer;" name="stadiumNum" class="form-select" aria-label="Default select example">
		        <option value="1">test1 홈</option>
		        <option selected value="3">잠실야구장(LG, 두산)</option>
		        <option value="4">고척스카이둠(키움)</option>
		        <option value="5">SSG랜더스필드(SSG)</option>
		        <option value="6">수원KT위즈파크(KT)</option>
		        <option value="7">대전한화생명볼파크(한화)</option>
		        <option value="8">광주챔피언스필드(기아)</option>
		        <option value="9">대구라이온즈파크(삼성)</option>
		        <option value="10">사직야구장(롯데)</option>
		        <option value="11">창원NC파크(NC)</option>
		      </select>
		    </div>
		  </div>
		
		  <div class="innerDiv mb-3">
		    <label for="level" class="form-label w-100">좌석등급</label>
		    <div class="ipts d-flex justify-content-center">
		      <select style="width: 350px; cursor: pointer;" id="level" name="seatLevel" class="form-select" aria-label="Default select example">
		        <option selected value="C">C</option>
		        <option value="B">B</option>
		        <option value="A">A</option>
		      </select>
		    </div>
		  </div>
		
		  <div class="innerDiv mb-3">
		    <label for="price" class="form-label w-100">좌석가격</label>
		    <div class="ipts d-flex justify-content-center">
		      <input type="text" name="seatPrice" value="15000" class="form-control" id="price" readonly style="width: 350px;">
		    </div>
		  </div>
		
		  <div class="innerDiv mb-3">
		    <label for="count" class="form-label w-100">좌석갯수</label>
		    <div class="ipts d-flex justify-content-center">
		      <input type="text" name="seatCount" class="form-control" id="count" style="width: 350px;">
		    </div>
		  </div>
		
		  <div class="d-flex justify-content-between gap-2 mt-5" style="width: 350px; margin: 0 auto;">
			 <button type="submit" class="btn btn-success w-50 py-3">등록</button>
			 <button type="reset" class="btn btn-danger w-50 py-3">초기화</button>
		  </div>
		  
		</form>
      

    </div>
  </div>
</div>


<script src="/resources/js/seats/add.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>