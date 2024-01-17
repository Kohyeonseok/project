<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GORP.COM</title>
<link rel="icon" href="images/logo.png">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Commissioner:wght@400&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background-color: rgba(128, 128, 128, 0.5);
	font-family: 'Commissioner', sans-serif;
}
</style>

</head>
<body>

	<div class="container">
		${logId.id}님 안녕하세요. <br> 
		<a class="btn btn-dark btn-sm" href="logout.do">LOGOUT</a> &nbsp; 
		<a class="btn btn-dark btn-sm" href="userPersonalPage.jsp">INFO</a>
	</div>

	<div class="container p-3 my-3">
		<h3>INFO</h3>
	</div>
	<div class="container my-3">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<!-- Links -->
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="modify.jsp">MODIFY</a></li>
					<li class="nav-item"><a class="nav-link" href="userWriteBoardList.do?id=${logId.id }">BOARDLIST</a></li>
					<li class="nav-item"><a class="nav-link" href="userJoinClubList.do?id=${logId.id }">CLUBLIST</a></li>
				</ul>
			</div>
		</nav>
	</div>

	<div class="container">
		<form name="tableForm">
			<table class="table table-bordered table-sm"
				style="background-color: white;">
				<thead>
					<tr class="thead-dark">
						<th class="col-1">번호</th>
						<th class="col-1">게시판</th>
						<th class="col-4">제목</th>
						<th class="col-1">아이디</th>
						<th class="col-2">작성일</th>
						<th class="col-1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${list}">
						<tr>
							<td>${post.no }</td>
							<td>${post.category}Board</td>
							<td><a class="text-dark"
								href="getBoard.do?no=${post.no}&category=${post.category}">${post.title }</a></td>
							<td>${post.id }</td>
							<td>${post.wtime }
							<td>${post.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>

	</div>
</body>

</html>
