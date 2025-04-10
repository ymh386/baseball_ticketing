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
<link rel="stylesheet" href="/resources/css/contents.css" />
<link rel="stylesheet" href="/resources/css/index.css" />

</head>

<body>
<div class="wrapper">

<c:import url="/WEB-INF/views/templates/layout_header.jsp"></c:import>

<main id="mainContent">
	<div id="wrapper-mainImg">		
		<!-- <img id="mainImg1" src="/resources/images/design/lottelogo.jpg"> -->
	</div>
	<div id="wrapper-mainContent">
		<div class="mainContents"></div>
		<div class="mainContents"></div>
	</div>
</main>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</div>
</body>
</html>