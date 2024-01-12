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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body{
		background-color : rgba(128, 128, 128, 0.5);
				font-family: 'Commissioner', sans-serif;
		
	}
</style>
</head>
<body>
	<div class="container">
		${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
			href="logout.do">LOGOUT</a> &nbsp; <a class="btn btn-dark btn-sm"
			href="modify.jsp">MODIFY</a> &nbsp; <a class="btn btn-dark btn-sm"
			href="adminPage.do">ADMINPAGE</a>
	</div>

	<div class="container p-3 my-3">
		<h3>REPORT</h3>
	</div>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<a class="navbar-brand" href="adminPage.jsp"> <img
				src="images/logo.png" alt="Logo" style="width: 40px;">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Links -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="getReportBoardList.do">REPORT&nbsp;<c:if test="${reportCount ne null}"><span class="badge badge-primary">${reportCount}</span></c:if></a></li>
				<li class="nav-item"><a class="nav-link" href="getQNABoardList.do?id=${logId.id}">Q&A&nbsp;<c:if test="${qnaCount ne null}"><span class="badge badge-primary">${qnaCount}</span></c:if></a></li>
				<li class="nav-item"><a class="nav-link" href="getUserList.do">USERList&nbsp;<c:if test="${userCount ne null}"><span class="badge badge-primary">${userCount-1}</span></c:if></a></li>

			</ul>
			</div>
		</nav>
	</div>
	<div class="container my-3">
		<form name="tableForm">
			<table class="table table-bordered table-sm" style="background-color : white;">
				<thead>
					<tr class="thead-dark">
						<th class="col-1">신고번호</th>
						<th class="col-1">게시판</th>
						<th class="col-1">번호</th>
						<th class="col-1">작성자</th>
						<th class="col-1">신고구분</th>
						<th class="col-3">신고내용</th>
						<th class="col-2">신고일</th>
						<th class="col-1">글삭제</th>
						<th class="col-1">처리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${list}">
						<tr>
							<td>${post.reportNo }</td>
							<td>${post.reportBoardCategory }</td>
							<td><a href="#" onclick="viewReportBoard('${post.reportBoardCategory }',${post.reportBoardNo })">${post.reportBoardNo }</a></td>
							<td>${post.reportId }</td>
							<td>${post.reportCategory }
							<td>${post.reportContent }</td>
							<td>${post.reportWtime }</td>
							<td><a class="btn btn-dark btn-sm" href="adminDeleteBoard.do?no=${post.reportBoardNo}&category=${post.reportBoardCategory}">삭제</a>
							<td><a class="btn btn-dark btn-sm" href="adminDeleteReport.do?reportNo=${post.reportNo }">처리완료</a>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>

	</div>
</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function viewReportBoard(category,no){
		
		 window.open('getBoard.do?category='+category+'&no='+no, 'reportBoard', 'width=1000, height=700');

	}
</script>
</html>