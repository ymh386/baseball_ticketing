<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>페이지를 찾을 수 없습니다</title>
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			background: linear-gradient(to bottom right, #061f46, #0b2c6a);
			color: #fff;
			height: 100vh;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.error-container {
			text-align: center;
		}
		.error-icon {
			font-size: 60px;
			margin-bottom: 20px;
		}
		.error-message {
			font-size: 22px;
			font-weight: bold;
			margin-bottom: 10px;
		}
		.error-detail {
			color: #ccc;
			margin-bottom: 30px;
		}
		.home-btn {
			background-color: #000;
			color: #fff;
			border: none;
			padding: 10px 20px;
			border-radius: 5px;
			text-decoration: none;
			font-weight: bold;
		}
		.home-btn:hover {
			background-color: #222;
		}
	</style>
</head>
<body>
	<div class="error-container">
		<div class="error-icon">📄❌</div>
		<div class="error-message">요청하신 페이지를 찾을 수 없습니다.</div>
		<div class="error-detail">지속적인 문제 발생 시 관리자에게 문의해주세요 abc@gmail.com</div>
		
		<div>${result}</div>
			
			
		<a href="${pageContext.request.contextPath}/" class="home-btn">홈으로 이동</a>
	</div>
</body>
</html>
