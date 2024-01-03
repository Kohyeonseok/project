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
		${logId.id}님 안녕하세요. <br> <a href="logout.do">LOGOUT</a> &nbsp; <a
			href="modify.jsp">MODIFY</a>
	</div>

	<div class="container p-3 my-3 border">
		<h3>HIKING</h3>
	</div>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
			<a class="navbar-brand" href="main.jsp"> <img
				src="images/logo.png" alt="Logo" style="width: 40px;">
			</a>

			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="getHikingBoardList.do">HIKING</a></li>
				<li class="nav-item"><a class="nav-link"
					href="getCampingBoardList.do">CAMPING</a></li>
				<li class="nav-item"><a class="nav-link"
					href="getFreeBoardList.do">FREE</a></li>
				<li class="nav-item"><a class="nav-link"
					href="getMarketBoardList.do">MARKET</a></li>
				<li class="nav-item"><a class="nav-link" 
					href="getGatheringBoardList.do">GATHERING</a></li>
			</ul>
		</nav>
	</div>
	<div class="container my-3">
		<form name="searchForm" action="searchHikingBoard.do"
			onSubmit="return check()">
			<select name="searchCategory">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="text" name="searchContent" id="searchContent"> <input
				type="submit" value="검색">
		</form>
		</div>
	<div class="container my-3">
			<form name="tableForm">
				<table class="table table-bordered table-sm">
					<tr>
						<th class="col-1">번호</th>
						<th class="col-2">아이디</th>
						<th class="col-8">제목</th>
						<th class="col-1">조회수</th>
					</tr>
					<c:forEach var="post" items="${list}">
						<tr>
							<td>${post.no }</td>
							<td>${post.id }</td>
							<td><a href="getHikingBoard.do?no=${post.no}">${post.title }</a></td>
							<td>${post.hit }</td>
						</tr>
					</c:forEach>
				</table>

						<a href="writeHikingBoard.do">글작성</a>&nbsp;
						<a href="main.jsp">메인으로</a>

<%-- 				<c:forEach var='num' begin='1' end='${post.pageNum}'>
					<a href="getHikingBoardList.do?offset=${num}">${num}</a>
				</c:forEach> --%>
			</form>

	</div>
</body>
</html>