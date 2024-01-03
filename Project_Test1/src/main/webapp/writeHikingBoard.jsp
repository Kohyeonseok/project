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
		<h3>WRITE HIKING</h3>
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
	<div class="container">
		<form name="writeForm" method="post" action="writeOkHikingBoard.do" onSubmit="return check()" enctype="multipart/form-data">
			<input type="hidden" name="id" id="id" value="${logId.id}">
			<input type="hidden" name="category" id="category" value="hiking">
			<table class="table table-bordered table-sm">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="content"></textarea></td>
				</tr>
				<tr>
					<td><input type="file" name="uploadFile"</td>
				</tr>
				<tr>
					<td><input type="submit" value="입력"> <a
						href="getHikingBoardList.do">목록</a></td>
				</tr>
			</table>
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