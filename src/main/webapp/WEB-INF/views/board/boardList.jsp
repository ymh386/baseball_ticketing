<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${kind}</title>
    <c:import url="/WEB-INF/views/templates/boot_css.jsp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardList.css">
<style>
	#div1 {
		height: 20%;
	}
	
	#div2 {
		height: 60%;
		margin: 0 20px;
	}
	
	#div3 {
		height: 10%;
	}
	
	#div4 {
		height: 10%;
	}
	
	
</style>
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp" />

<div class="content">
	<div class="wrapper-main">
	
		<div class="container">
		    <div class="row justify-content-center">
		        <div>	
		            <div id="div1" class="d-flex justify-content-between align-items-center" style="gap: 2rem;">
					    <!-- 제목 영역 -->
					    <div  class="d-flex justify-content-center align-items-center"
						     style="height: 60%; margin-left: 30px;
						            background-color: #e6f0fa;
						            padding: 12px 30px;
						            border-radius: 12px;
						            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);">
						    
						    <h1 style="font-size: 2.5rem; margin: 0; color: #2c3e50; font-weight: 600;">
						        <c:if test="${kind == 'notice'}">
						        	공지사항
						        </c:if>
						        <c:if test="${kind == 'qna'}">
						        	QnA
						        </c:if>
						    </h1>
						</div>
					    
					
					    <!-- 검색 폼 영역 -->
					    <div class="d-flex justify-content-center align-items-end" 
					    style="height: 100%; margin-right: 30px; margin-bottom: 30px;" >
					        <form id="searchForm" action="./list" method="get" class="input-group" style="max-width: 500px; ">
					            <select name="kind" class="form-select" style="max-width: 100px; ">
					                <option value="k1" ${pager.kind eq 'k1' ? 'selected' : ''}>제목</option>
					                <option value="k2" ${pager.kind eq 'k2' ? 'selected' : ''}>내용</option>
					                <option value="k3" ${pager.kind eq 'k3' ? 'selected' : ''}>제목+내용</option>
					            </select>
					            <input type="text" name="search" class="form-control" placeholder="검색어를 입력해 주세요." value="${pager.search}" style="max-width: 250px;">
					            <button type="submit" class="btn btn-dark" style="width: 80px;">검색</button>
					        </form>
					    </div>
					</div>
		            
		
		
		            <!-- 리스트 테이블을 감싼 div -->
		            <div id="div2" >
					    <table class="table align-middle text-center fs-1">
					        <thead>
					            <tr>
					                <th style="width: 10%;">번호</th>
					                <th class="text-start">제목</th>
					                <th style="width: 15%;">작성자</th>
					                <th style="width: 15%;">작성일</th>
					                <th style="width: 10%;">조회수</th>
					            </tr>
					        </thead>
					        <tbody>
					            <c:forEach items="${list}" var="v">
					                <tr style="cursor: pointer;" onclick="location.href='./detail?boardNum=${v.boardNum}'">
									    <td>${v.boardNum}</td>
									    <td class="text-start">${v.boardTitle}</td>
									    <td>${v.userId}</td>
									    <td>${v.boardDate}</td>
									    <td>${v.boardHit}</td>
									</tr>
					            </c:forEach>
					        </tbody>
					    </table>
					</div>
		
		            
		            <!-- 페이징 form + nav 를 감싼 div -->
					<div id="div3">
					    <form id="pageForm">
					        <input type="hidden" id="page" name="page">
					    </form>
					
					    <nav>
					        <ul class="pagination justify-content-center">
					            <li class="page-item ${pager.startBtn == 1 ? 'disabled' : ''}">
					                <a class="page-link" href="./list?page=${pager.startBtn - 1}">&laquo;</a>
					            </li>
					
					            <c:forEach begin="${pager.startBtn}" end="${pager.endBtn}" var="i">
					                <li class="page-item ${i == pager.page ? 'active' : ''}">
					                    <a class="page-link" href="./list?page=${i}">${i}</a>
					                </li>
					            </c:forEach>
					
					            <li class="page-item ${pager.endCheck ? 'disabled' : ''}">
					                <a class="page-link" href="./list?page=${pager.endBtn + 1}">&raquo;</a>
					            </li>
					        </ul>
					    </nav>
					</div>
		
		            <!-- 글쓰기 버튼 -->
		            <div id="div4" class="text-end" 
		            style="margin-right: 30px;">
		            <c:choose>
		                <c:when test="${kind eq 'notice' and sessionScope.user != null and sessionScope.user.userId eq 'admin'}">
		                    
		                        <a href="./add" class="btn btn-outline-success btn-lg">글 작성</a>
		                    
		                </c:when>
		                <c:when test="${kind eq 'qna' and sessionScope.user != null}">
		                    
		                        <a href="./add" class="btn btn-outline-success btn-lg">글 작성</a>
		                    
		                </c:when>
		                <c:otherwise>
		                    <c:if test="${kind eq 'qna'}">
		                        <p class="text-danger mt-3">※ Q&A 작성은 로그인 후 이용 가능합니다.</p>
		                    </c:if>
		                </c:otherwise>
		            </c:choose>
					</div>
		        </div>
		    </div>
		</div>
	
	</div>

</div>


<c:import url="/WEB-INF/views/templates/layout_footer.jsp" />
<c:import url="/WEB-INF/views/templates/boot_js.jsp" />
</body>
</html>
