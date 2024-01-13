<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body{
		background-color : rgba(128, 128, 128, 0.5);
				font-family: 'Commissioner', sans-serif;
		
	}
</style>
</head>
<body>
	<div class="container">
		<h3 class="mb-4">${user.id}</h3>

		<div class="card">
			<div class="card-body">
				<h5 class="card-title">사용자 정보</h5>
				<p class="card-text">
					<strong>이름:</strong> ${user.name}<br> 
					<strong>닉네임:</strong> ${user.nickName}<br> 
					<strong>이메일:</strong> ${user.email}<br>
					<c:if test="${logId.id eq 'admin' }">
					<strong>연락처:</strong> ${user.phoneNum}<br>
					</c:if> 
					<strong>경고수:</strong> ${user.caution}<br>
				</p>
			</div><br>
			<button class="btn btn-dark" onclick="closeWindow()">창 닫기</button>
		</div>
	</div>
</body>

<script>
function closeWindow() {
    window.close();
}
</script>
</html>