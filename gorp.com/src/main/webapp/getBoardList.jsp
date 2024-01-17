<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G O R P . C O M</title>
<link rel="icon" href="images/logo.png">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Commissioner:wght@400&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
	body{
		background-color : rgba(128, 128, 128, 0.5);
				font-family: 'Commissioner', sans-serif;
		
	}
</style>

</head>

<body>
	<c:if test="${logId.id ne 'admin' }" var="result">
		<div class="container">
			${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
				href="logout.do">LOGOUT</a> &nbsp; <a class="btn btn-dark btn-sm" href="userPersonalPage.jsp">INFO</a>
		</div>
	</c:if>

	<c:if test="${logId.id eq 'admin' }" var="result">
		<div class="container">
			${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
				href="logout.do">LOGOUT</a> &nbsp; <a class="btn btn-dark btn-sm"
				href="adminPage.jsp">ADMINPAGE</a>
		</div>
	</c:if>

	<div class="container p-3 my-3">
		<h3>${category }</h3>
	</div>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<a class="navbar-brand" href="main.jsp"> <img
				src="images/logo.png" alt="Logo" style="width: 40px;">
			</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Links -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<!-- Links -->
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="getBoardList.do?category=hiking">HIKING</a></li>
					<li class="nav-item"><a class="nav-link" href="getBoardList.do?category=camping">CAMPING</a></li>
					<li class="nav-item"><a class="nav-link" href="getBoardList.do?category=free">FREE</a></li>
					<li class="nav-item"><a class="nav-link" href="getBoardList.do?category=market">MARKET</a></li>
					<li class="nav-item"><a class="nav-link" href="getClubBoardList.do?">CLUB</a></li>
					<c:if test="${logId.id ne 'admin' }">
						<li class="nav-item"><a class="nav-link" href="getQNABoardList.do?id=${logId.id}">Q&A</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container my-3">
		<form class="form-inline" action="searchBoard.do" onsubmit="return validateSearch()">
			<input type="hidden" name="category" id="category" value="${category }">
			<select name="searchCategory" class="form-control">
				<option value="title">TITLE</option>
				<option value="content">CONTENT</option>
			</select>&nbsp; 
			<input class="form-control mr-sm-2" name="searchContent" id="searchContent" type="text" placeholder="Search">
			<button class="btn btn-dark btn-sm" type="submit">검색</button>
		</form>
	</div>
	<div class="container">
		<form name="tableForm">
			<table class="table table-bordered table-sm" style="background-color : white;">
				<thead>
					<tr class="thead-dark">
						<th class="col-1">번호</th>
						<th class="col-5">제목</th>
						<th class="col-1">아이디</th>
						<th class="col-2">작성일</th>
						<th class="col-1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${list}">
						<tr>
							<td>${post.no }</td>
							<td><a class="text-dark"
								href="getBoard.do?no=${post.no}&category=${category}">${post.title }</a></td>
							<td>${post.id }</td>
							<td>${post.wtime }
							<td>${post.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a class="btn btn-light btn-sm"
				href="getBoardList.do?pageNum=${(pageNum.pageNum > 1) ? pageNum.pageNum-1 : 1}&category=${category}"><span
				class="bi bi-caret-left-fill"></span></a>
			<c:forEach var='num' begin='1' end='${pageNum.totalPage}'>
				<a class="btn btn-light btn-sm"
					href="getBoardList.do?pageNum=${num}&category=${category}">${num}</a>
			</c:forEach>
			<a class="btn btn-light btn-sm"
				href="getBoardList.do?pageNum=${(pageNum.pageNum < pageNum.totalPage) ? pageNum.pageNum + 1 : pageNum.totalPage}&category=${category}"><span
				class="bi bi-caret-right-fill"></span></a>
			<hr>

			<a class="btn btn-dark btn-sm" href="writeBoard.do?category=${category}">글작성</a>&nbsp;
			<a class="btn btn-dark btn-sm" href="main.jsp">메인으로</a>

			<%-- 				<c:forEach var='num' begin='1' end='${post.pageNum}'>
					<a href="getHikingBoardList.do?offset=${num}">${num}</a>
				</c:forEach> --%>
		</form>

	</div>
	<script>
		function validateSearch() {
			var category = document.getElementById("category").value;
			var searchContent = document.getElementById("searchContent").value;

			if (searchContent.trim() === "") {
				window.location.href = "getBoardList.do?category="+category;
				return false;
			}
			return true;
		}
	</script>
</body>
</html>