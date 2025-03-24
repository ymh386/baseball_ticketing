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
		<h1>${kind } 리스트</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="v">
				<tr>
					<td>${v.boardNum}</td>
					<td>
						<a href="./detail?boardNum=${v.boardNum}">
							<%-- <c:catch>
								<c:forEach begin="1" end="${v.boardDepth}">--</c:forEach>
							</c:catch> --%>
							${v.boardTitle}
						</a>
					</td>
					<td>${v.userId}</td>
					<td>${v.boardDate}</td>
					<td>${v.boardHit}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
		<a href="./add" class="btn btn-outline-success">글 작성</a>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>