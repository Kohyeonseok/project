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
		<h3>R E P O R T</h3>
	</div>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<a class="navbar-brand" href="adminPage.jsp"> <img
				src="images/logo.png" alt="Logo" style="width: 40px;">
			</a>

			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="getReportBoardList.do">REPORT</a></li>
				<li class="nav-item"><a class="nav-link" href="getQnABoard.do">QNA</a></li>
				<li class="nav-item"><a class="nav-link" href="getUserList.do">USERList</a></li>
			</ul>
		</nav>
	</div>
	<div class="container">
		<form name="tableForm">
			<table class="table table-bordered table-sm">
				<thead>
					<tr class="thead-dark">
						<th class="col-1">신고번호</th>
						<th class="col-1">게시판</th>
						<th class="col-1">번호</th>
						<th class="col-1">작성자</th>
						<th class="col-4">신고내용</th>
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
							<td>${post.reportBoardNo }</td>
							<td>${post.reportId }</td>
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
</html>