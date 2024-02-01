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
<style>
	body{
		background-color : rgba(128, 128, 128, 0.5);
				font-family: 'Commissioner', sans-serif;
		
	}
</style>
</head>
<body>
	<div class="container">
		${logId.id}님 안녕하세요. <br> 
		<a class="btn btn-dark btn-sm" href="logout.do">LOGOUT</a> &nbsp; 
		<a class="btn btn-dark btn-sm" href="modify.jsp">MODIFY</a>
	</div>

	<div class="container p-3 my-3">
		<h3>MODIFY BOARD</h3>
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
					<li class="nav-item"><a class="nav-link" href="getBoardList.do?pageNum=1&category=hiking">HIKING</a></li>
					<li class="nav-item"><a class="nav-link" href="getBoardList.do?pageNum=1&category=camping">CAMPING</a></li>
					<li class="nav-item"><a class="nav-link" href="getBoardList.do?pageNum=1&category=free">FREE</a></li>
					<li class="nav-item"><a class="nav-link" href="getBoardList.do?pageNum=1&category=market">MARKET</a></li>
					<li class="nav-item"><a class="nav-link" href="getClubBoardList.do?">CLUB</a></li>
					<c:if test="${logId.id ne 'admin' }">
						<li class="nav-item"><a class="nav-link" href="getQNABoardList.do?id=${logId.id}">Q&A</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container my-3">
		<form name="writeForm" method="post" action="updateOkBoard.do" onSubmit="return check()" enctype="multipart/form-data">
			<input type="hidden" name="id" id="id" value="${logId.id}">
			<input type="hidden" name="no" id="no" value="${board.no }">
			<input type="hidden" name="category" id="category" value="${category }">
			<table class="table table-bordered table-sm" style="background-color : white;">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" id="title" value="${board.title}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="content">${board.content }</textarea></td>
				</tr>
				<tr>
					<td><input class="form-control-file" type="file" name="uploadFile"></td>
				</tr>
				<tr>
				</tr>
			</table>
			<hr>
				<div class="row">
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm" href="getBoardList.do?category=${category }">목록</a>
					</div>
					<div class="col-md-4">
						<input class="btn btn-dark btn-block btn-sm" type="submit" value="수정">
					</div> 
				</div>			
		</form>
	</div>
</body>
<script>
	function check() {
		let title = document.getElementById("title").value;
		let contents = document.getElementById("contents").value;

		if (title == "") {
			alert("제목을 입력하세요.");
			document.getElementById("title").focus();
			return false;
		} else if (contents == "") {
			alert("내용을 입력하세요.");
			document.getElementById("contents").focus();
			return false;
		} else {
			return true;
		}
	}
</script>
</html>