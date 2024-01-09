<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<div class="container">
		${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
			href="logout.do">LOGOUT</a> &nbsp; <a class="btn btn-dark btn-sm"
			href="modify.jsp">MODIFY</a> &nbsp; <a class="btn btn-dark btn-sm"
			href="adminPage.jsp">ADMINPAGE</a>
	</div>

	<div class="container p-3 my-3">
		<h3>Admin Page</h3>
	</div>
	<div class="container my-3">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<a class="navbar-brand" href="main.jsp"> <img
				src="images/logo.png" alt="Logo" style="width: 40px;">
			</a>

			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="getReportBoardList.do">REPORT</a></li>
				<li class="nav-item"><a class="nav-link"
					href="getQNABoardList.do?id=${logId.id}">QNA</a></li>
				<li class="nav-item"><a class="nav-link"
					href="getUserList.do">USERList</a></li>
			</ul>
		</nav>
	</div>
	<div class="container my-3">
		<img src="images/camp.jpg" style="max-width: 100%">
	</div>

</body>
</html>