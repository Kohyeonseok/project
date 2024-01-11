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
			href="adminPage.jsp">ADMINPAGE</a>
	</div>

	<div class="container p-3 my-3">
		<h3>USER LIST</h3>
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
				<li class="nav-item"><a class="nav-link"
					href="getReportBoardList.do">REPORT</a></li>
				<li class="nav-item"><a class="nav-link" href="getQNABoardList.do?id=${logId.id}">QNA</a></li>
				<li class="nav-item"><a class="nav-link" href="getUserList.do">USERList</a></li>
			</ul>
			</div>
		</nav>
	</div>
	<div class="container my-3">
		<form name="tableForm">
			<table class="table table-bordered table-sm">
				<thead>
					<tr class="thead-dark">
						<th class="col-2">아이디</th>
						<th class="col-2">이름</th>
						<th class="col-1">닉네임</th>
						<th class="col-2">이메일</th>
						<th class="col-2">연락처</th>
						<th class="col-1">경고</th>
						<th class="col-2">비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${list}">
						<c:if test="${user.id ne 'admin' }">
						<tr>
							<td>${user.id }</td>
							<td>${user.name }</td>
							<td>${user.nickName }</td>
							<td>${user.email }</td>
							<td>${user.phoneNum }</td>
							<td>${user.caution }</td>
							<td>
								<c:if test="${user.caution < '3' }">
								<a class="btn btn-dark btn-sm" href="adminThrowCaution.do?id=${user.id }">경고</a>&nbsp;
								</c:if>
								<a class="btn btn-dark btn-sm" onclick="userInfo('${user.id}')">정보 보기</a>
							</td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</form>

	</div>
	
</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function userInfo(userId){
		window.open('getUserInfo.do?id='+userId,'UserInfo','width=400, height=400');
	}
</script>

</html>