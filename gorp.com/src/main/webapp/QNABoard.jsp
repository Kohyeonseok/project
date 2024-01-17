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
<script src="jq/jquery.js"></script>
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
				href="logout.do">LOGOUT</a> &nbsp; 		<a class="btn btn-dark btn-sm" href="userPersonalPage.jsp">INFO</a>
		</div>
	</c:if>

	<c:if test="${logId.id eq 'admin' }" var="result">
		<div class="container">
			${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
				href="logout.do">LOGOUT</a>  &nbsp; <a class="btn btn-dark btn-sm"
				href="adminPage.jsp">ADMINPAGE</a>
		</div>
	</c:if>

	<div class="container p-3 my-3">
		<h3>Q&A</h3>
	</div>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<a class="navbar-brand" href="main.jsp"> <img
				src="images/logo.png" alt="Logo" style="width: 40px;">
			</a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<c:if test="${logId.id ne 'admin' }">
			
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
						<li class="nav-item"><a class="nav-link" href="getQNABoardList.do?id=${logId.id}">QNA</a></li>
					</c:if>
				</ul>
			</div>
			</c:if>
			<c:if test="${logId.id eq 'admin' }">
				<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="getReportBoardList.do">REPORT&nbsp;<c:if test="${reportCount ne null}"><span class="badge badge-primary">${reportCount}</span></c:if></a></li>
				<li class="nav-item"><a class="nav-link" href="getQNABoardList.do?id=${logId.id}">Q&A&nbsp;<c:if test="${qnaCount ne null}"><span class="badge badge-primary">${qnaCount}</span></c:if></a></li>
				<li class="nav-item"><a class="nav-link" href="getUserList.do">USERList&nbsp;<c:if test="${userCount ne null}"><span class="badge badge-primary">${userCount-1}</span></c:if></a></li>

				</ul>
			</c:if>
		</nav>
	</div>

	<div class="container my-3">
		<form name="contentForm">
			<input type="hidden" name="no" id="no" value="${board.no}">
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered table-sm" style="background-color:white;">
						<tr>
							<td>제목</td>
							<td>${board.title}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${board.id}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${board.content}</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-4">
					<a class="btn btn-dark btn-block btn-sm"
						href="getQNABoardList.do?id=${logId.id }">목록</a>
				</div>
			</div>
		</form>
		<hr>
		<c:if test="${logId.id eq 'admin' }" var="result">
			<form name="contentForm" action="writeQnAReply.do">
				<input type="hidden" name="forName" value="${board.id }"> <input
					type="hidden" name="groupNum" value="${board.groupNum }"> <input
					type="hidden" name="stepNum" value="${board.no }"> <input
					type="hidden" name="id" value="${logId.id }">
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered table-sm" style="background-color:white;">
							<tr>
								<td>제목</td>
								<td><input type="text" name="title"
									value="re : ${board.title}"></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td>${logId.id}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name="content">re : ${board.content}	&#10;</textarea></td>
							</tr>
						</table>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<input type="submit" class="btn btn-light" value="답변">
					</div>
				</div>
			</form>
		</c:if>
	</div>
</body>

</html>