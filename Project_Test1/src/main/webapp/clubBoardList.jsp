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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
				href="adminPage.jsp">ADMINPAGE</a>
		</div>
	</c:if>

	<div class="container p-3 my-3">
		<h3>CLUB</h3>
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
						<li class="nav-item"><a class="nav-link" href="getQNABoardList.do?id=${logId.id}">QNA</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container my-3">
		<form class="form-inline" action="searchClubBoard.do" onsubmit="return validateSearch()"> 
			<select name="searchCategory" class="form-control">
				<option value="title">TITLE</option>
				<option value="content">CONTENT</option>
				<option value="date">DATE</option>
			</select>&nbsp; 
			<input class="form-control mr-sm-2" name="searchContent" id="searchContent" type="text" placeholder="Search">
			<button class="btn btn-dark btn-sm" type="submit">검색</button>
		</form>
	</div>
	<div class="container">
		<c:forEach var="club" items="${clubBoard}">
			<div class="container my-3 border d-flex flex-column flex-md-row" style="background-color : white;">
				<div class="container p-3">
					<img src="images/about.jpg" width="100%" height="100px">
				</div>
				
				<div class="container p-3">
					<p>모임명 : <a href="getClubBoard.do?no=${club.no}">${club.title}</a></p>
					<p>개설자 : ${club.id}</p>
					<p>마감일 : ${club.dueDate}</p>
					<c:if test="${logId.id eq club.id || logId.id eq 'admin'}">
						<button class="btn btn-dark btn-sm" onclick="confirmDeleteClub(${club.no})">모임삭제</button>
					</c:if>
				</div>
			</div>
		</c:forEach>
		<a class="btn btn-dark btn-sm" href="createClubBoard.jsp">모임만들기</a>&nbsp;
		<a class="btn btn-dark btn-sm" href="main.jsp">메인으로</a>
	</div>
</body>

	<script>
		function validateSearch() {
			var searchContent = document.getElementById("searchContent").value;

			if (searchContent.trim() === "") {
				window.location.href = "getClubBoardList.do?";
				return false;
			}
			return true;
		}
		
		function confirmDeleteClub(clubNo) {
		    const userConfirmed = confirm("정말로 모임을 삭제하시겠습니까?");

		    if (userConfirmed) {
		        deleteClubBoard(clubNo);
		    }
		}

		function deleteClubBoard(clubNo) {
			$.ajax({
				url : "deleteClubBoard.do",
				type : "POST",
				data : {
					'no' : clubNo
				},
				dataType : 'text',
				success : function(data) {
					if (data=="success") {
						alert("모임이 삭제되었습니다.");
						location.reload();
					}
				}
			});
		}

	</script>
</html>