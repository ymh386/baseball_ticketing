<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/templates/boot_css.jsp"></c:import>

</head>

<body>

<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<div class="content">

	<div id="wrapper-main">
		<div id="wrapper-mainImg">		
			<!-- <img id="mainImg1" src="/resources/images/design/lottelogo.jpg"> -->
			<div class="divImg">이미지</div>
		</div>
		<div id="wrapper-section">
			<div class="sections" id="section1">
				<div class="matchTitle">카드배너 제목</div>
			</div>
			<div class="sections" id="section2">
				<div class="matchCards">경기 카드</div>
				<div class="matchCards">경기 카드</div>
				<div class="matchCards">경기 카드</div>
			</div>
		</div>
	</div>


<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</div>
<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
</body>
</html>