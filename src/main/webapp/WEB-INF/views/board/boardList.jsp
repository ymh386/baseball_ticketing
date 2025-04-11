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
</head>
<body>
<c:import url="/WEB-INF/views/templates/layout_header.jsp" />

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-10">

            <h3 class="mb-4">${kind}</h3>

					     
					<form action="./list" method="get" class="input-group mb-4" style="max-width: 500px;">
					    <select name="kind" class="form-select" style="max-width: 100px;">
					        <option value="k1" ${pager.kind eq 'k1' ? 'selected' : ''}>제목</option>
					        <option value="k2" ${pager.kind eq 'k2' ? 'selected' : ''}>내용</option>
					        <option value="k3" ${pager.kind eq 'k3' ? 'selected' : ''}>제목+내용</option>
					    </select>
					    <input type="text" name="search" class="form-control" placeholder="검색어를 입력해 주세요." value="${pager.search}" style="max-width: 250px;">
					    <button type="submit" class="btn btn-dark" style="width: 80px;">검색</button>
					</form>


            <!-- 리스트 테이블 -->
            <table class="table align-middle text-center">
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
                        <tr>
                            <td>${v.boardNum}</td>
							  <td class="text-start">
							    <a href="./detail?boardNum=${v.boardNum}" class="text-decoration-none text-dark fw-bold">
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

            <!-- 페이징 -->
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

            <!-- 글쓰기 버튼 -->
            <c:choose>
                <c:when test="${kind eq 'notice' and sessionScope.user != null and sessionScope.user.userId eq 'admin'}">
                    <div class="mt-4 text-end">
                        <a href="./add" class="btn btn-outline-success">글 작성</a>
                    </div>
                </c:when>
                <c:when test="${kind eq 'qna' and sessionScope.user != null}">
                    <div class="mt-4 text-end">
                        <a href="./add" class="btn btn-outline-success">글 작성</a>
                    </div>
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

<c:import url="/WEB-INF/views/templates/layout_footer.jsp" />
<c:import url="/WEB-INF/views/templates/boot_js.jsp" />
</body>
</html>
