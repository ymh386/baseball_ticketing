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
	<div class="row col-md-8 offset-md-2" style="min-height: 60vh">
		<!-- contents 내용 작성 -->
		<h3>해당 경기장의 해당 등급의 좌석추가</h3>
		<form action="./add" method="post">
		  <div class="mb-3">
		    <select name="stadiumNum" class="form-select" aria-label="Default select example">
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
		  <div class="mb-3">
		    <select id="level" name="seatLevel" class="form-select" aria-label="Default select example">
			  <option selected value="C">C</option>
			  <option value="B">B</option>
			  <option value="A">A</option>
			</select>
		  </div>
		  <div class="mb-3">
		    <label for="price" class="form-label">좌석가격</label>
		    <input type="text" name="seatPrice" value="15000" class="form-control" id="price" readonly>
		  </div>
		  <div class="mb-3">
		    <label for="count" class="form-label">좌석갯수</label>
		   <input type="text" name="seatCount" class="form-control" id="count">
		  </div>
		  <div class="col-md-4">
			  <button type="submit" class="btn btn-success">등록</button>
			  <button type="reset" class="btn btn-danger">초기화</button>
		  </div>
		</form>
	</div>
</div>

<script src="/resources/js/seats/add.js"></script>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>