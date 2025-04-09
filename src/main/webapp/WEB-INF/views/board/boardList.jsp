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

<div class="container-fluid my-5">
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
		
		<!-- 페이징 버튼 -->
		
		<form id="pageForm">
			<input type="hidden" id="page" name="page">
		</form>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  
		    <li class="page-item">
		      <button class="page-link pages" onclick="location.href='./list?page=${pager.startBtn-1}'" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
			  </button>
		    </li>
		    
		    <c:forEach begin="${pager.startBtn}" end="${pager.endBtn}" var="i">
		   		<li class="page-item">
					<button class="page-link pages" onclick="location.href='./list?page=${i}'">${i}</button>
				</li>
		    </c:forEach>
		    
		    <li class="page-item ${pager.endCheck?'disabled':''}">
		      <button class="page-link pages" onclick="location.href='./list?page=${pager.endBtn+1}'" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
			  </button>
		    </li>
		    
		  </ul>
		</nav>
		
		
		
		
					<c:choose>
			    <c:when test="${kind eq 'notice' and sessionScope.user != null and sessionScope.user.userId eq 'admin'}">
			        <div>
			            <a href="./add" class="btn btn-outline-success">글 작성</a>
			        </div>
			    </c:when>
			
			    <c:when test="${kind eq 'qna' and sessionScope.user != null}">
			        <div>
			            <a href="./add" class="btn btn-outline-success">글 작성</a>
			        </div>
			    </c:when>
			
			    <c:otherwise>
			        <c:if test="${kind eq 'qna'}">
			            <p class="text-danger">※ Q&A 작성은 로그인 후 이용 가능합니다.</p>
			        </c:if>
			    </c:otherwise>
			</c:choose>

		
		
	</div>
</div>



<c:import url="/WEB-INF/views/templates/layout_footer.jsp"></c:import>
<c:import url="/WEB-INF/views/templates/boot_js.jsp"></c:import>
</body>
</html>