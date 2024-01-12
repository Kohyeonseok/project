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
	<c:if test="${logId.id ne 'admin' }" var="result">
		<div class="container">
			${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
				href="logout.do">LOGOUT</a> &nbsp; <a class="btn btn-dark btn-sm"
				href="modify.jsp">MODIFY</a>
		</div>
	</c:if>

	<c:if test="${logId.id eq 'admin' }" var="result">
		<div class="container">
			${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
				href="logout.do">LOGOUT</a> &nbsp; <a class="btn btn-dark btn-sm"
				href="modify.jsp">MODIFY</a> &nbsp; <a class="btn btn-dark btn-sm"
				href="adminPage.do">ADMINPAGE</a>
		</div>
	</c:if>

	<input type="hidden" id="userCaution" value="${logId.caution }">
	<input type="hidden" id="id" value="${logId.id }">

	<div class="container p-3 my-3">
		<h3>GORP.COM</h3>
	</div>
	<div class="container my-3">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<a class="navbar-brand" href="main.jsp"> <img
				src="images/logo.png" alt="Logo" style="width: 40px;">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
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
	<div class="container">
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/main1.jpg" width="100%" height="500">
				</div>
				<div class="carousel-item">
					<img src="images/main3.jpg" width="100%" height="500">
				</div>
				<div class="carousel-item">
					<img src="images/hiking.jpg" width="100%" height="500">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>

</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	window.onload = function() {

		let userCaution = document.getElementById("userCaution").value;
		let id = document.getElementById("id").value;
		
		if (id !== "admin" && userCaution != 0) {
			if (userCaution == 1) {
				alert("❗1회 경고입니다. 3회 경고시 사이트를 이용할 수 없습니다.️");
			} else if (userCaution == 2) {
				alert("❗❗ 2회 경고입니다. 3회 경고시 사이트를 이용할 수 없습니다.️");
			} else {
				alert("❗❗❗ 3회 경고입니다. 사이트를 이용할 수 없어 회원 탈퇴를 진행합니다.");

				$.ajax({
					url : "exitUser.do",
					type : "post",
					data : {
						"id" : id
					},
					dataType : 'text',
					success : function(result) {
						alert("이용해 주셔서 감사합니다.");
						window.location.href = "index.do";
					},
					error : function() {
						alert("서버요청실패");
					}
				});

			}
		}
	};
</script>
</html>