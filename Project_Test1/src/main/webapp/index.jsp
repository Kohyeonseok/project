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

	<div class="container p-3">
		<div class="row">
			<div class="col-4">
			<h3>L O G I N</h3>
				<form action="login.do" method="post" onsubmit="return check()">
					<input type="text" name="id" id="id" placeholder="ID"><br>
					<br> <input type="password" name="password" id="password"
						placeholder="PASSWORD"><br>
					<br>
					<c:if test="${logId eq 1}" var="result">
		아이디 혹은 비밀번호를 확인하세요.<br>
						<br>
					</c:if>
					<input class="btn btn-dark btn-sm" type="submit" value="LOGIN"><br>
				</form>
				<br> <a class="btn btn-dark btn-sm" href="join.jsp">ACCOUNT</a>
			</div>
			<div class="col-8">
				<img src="images/item.jpg" style="height: 100%; width: 100%; object-fit: cover;">
			</div>
		</div>
	</div>

	<script>
		function check() {
			let id = document.getElementById("id").value;
			let pw = document.getElementById("password").value;

			if (id === "") {
				alert("아이디를 입력하세요.");
				document.getElementById("id").focus();
				return false;
			} else if (pw === "") {
				alert("비밀번호를 입력하세요.");
				document.getElementById("password").focus();
				return false;
			} else {
				return true;
			}
		}
	</script>

</body>
</html>