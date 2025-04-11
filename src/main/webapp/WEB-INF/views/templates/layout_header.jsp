<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <link rel="stylesheet" href="/resources/css/reset.css" />
 --><link rel="stylesheet" href="/resources/css/header.css" />
	<header>
		<div id="headerRow">
		
			<div class="wrapper-menu" id="wrapper-menu1">
				<ul class="menu" id="menu1">
					<!-- 경계선 -->
			        <c:if test="${not empty user}">
	       			<li class="nav-item">
			        	<a class="nav-link" href="/users/mypage">내정보</a>
			        </li>
	       						        
			        <li class="nav-item">
			        	<a class="nav-link" href="/users/logout">로그아웃</a>
			        </li>
			        </c:if>
			        				        
			        <!-- 경계선 -->
			        <c:if test="${empty user}">
			        <li class="nav-item">
			        	<a class="nav-link" href="/users/join">회원가입</a>
			        </li>
			        
			        <li class="nav-item">
			        	<a class="nav-link" href="/users/login">로그인</a>
			        </li>
			        </c:if>	

					<li class="nav-item">
						<a class="nav-link" href="/seats/add">좌석추가</a>
					</li>

				</ul>
			</div>
		
			<div class="wrapper-menu" id="wrapper-menu2">
			
		      <ul class="menu" id="menu2">
		      
		        <li class="nav-item">
		          <a class="nav-link" href="/">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="/teams/list">구단소개</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="/matches/list">경기예매</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="/notice/list">공지사항</a>
		        </li>	
		        
		        <li class="nav-item">
		          <a class="nav-link" href="/qna/list">QnA</a>
		        </li>	
		        			        		        
		       		
		        		        	        
		      </ul>
			          
			</div>
		
		</div>
	</header>
