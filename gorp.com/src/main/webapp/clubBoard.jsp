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
<link
	href="https://fonts.googleapis.com/css2?family=Commissioner:wght@400&display=swap"
	rel="stylesheet">


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
body {
	background-color: rgba(128, 128, 128, 0.5);
	font-family: 'Commissioner', sans-serif;
}
</style>
</head>
<body>
	<c:if test="${logId.id ne 'admin' }" var="result">
		<div class="container">
			${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
				href="logout.do">LOGOUT</a> &nbsp; <a class="btn btn-dark btn-sm"
				href="userPersonalPage.jsp">INFO</a>
		</div>
	</c:if>

	<c:if test="${logId.id eq 'admin' }" var="result">
		<div class="container">
			${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm"
				href="logout.do">LOGOUT</a> &nbsp; <a class="btn btn-dark btn-sm"
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
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
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
						<li class="nav-item"><a class="nav-link"
							href="getQNABoardList.do?id=${logId.id}">Q&A</a></li>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="container my-3 text-center"
			style="background-color: white;">
			<h1>${clubBoard.title}</h1>
			<p>${clubBoard.id }</p>
			<p>${clubBoard.dueDate}</p>
			<img src="uploadFile/${clubBoard.fileName }" width="500px"
				height="500px">
			<p>${clubBoard.content}</p>
		</div>
		<hr>
		<div class="container">
			<h3>참여인원</h3>
			<c:forEach var="member" items="${members }">
				<span><a class="btn btn-light btn-sm"
					onclick="userInfo('${member.id}')">${member.id}</a></span>
			</c:forEach>
		</div>
		<hr>
		<c:if test="${clubBoard.id ne logId.id && logId.id ne 'admin'}">
			<a class="btn btn-dark btn-sm" onclick="joinClub()">참여하기</a>&nbsp;
			<a class="btn btn-danger btn-sm" onclick="cancleClub()">취소하기</a>&nbsp;
		</c:if>
		<a class="btn btn-dark btn-sm" onclick="showChat()">채팅</a>
	</div>
	<input type="hidden" name="logId" id="logId" value="${logId.id }">
	<input type="hidden" name="no" id="no" value="${clubBoard.no }">


</body>
<script>
	let loginId = document.getElementById("logId").value;
	if(loginId == null){
		alert("로그아웃 되었습니다. 다시 로그인 해 주세요.");
	}

	function joinClub() {

		let logId = document.getElementById("logId").value;
		let no = document.getElementById("no").value;

		$.ajax({
			url : "joinClub.do",
			type : "POST",
			data : {
				'id' : logId,
				'no' : no
			},
			dataType : 'text',
			success : function(data) {
				if (data == "success") {
					alert("참여신청이 완료되었습니다.");
					location.reload();
				} else {
					alert("이미 참여신청이 되었습니다.");
				}
			}
		});
	}

	function cancleClub() {

		let logId = document.getElementById("logId").value;
		let no = document.getElementById("no").value;

		$.ajax({
			url : "cancleClub.do",
			type : "POST",
			data : {
				'id' : logId,
				'no' : no
			},
			dataType : 'text',
			success : function(data) {
				if (data == "success") {
					alert("참여 취소가 완료되었습니다.");
					location.reload();
				} else {
					alert("참여하고 있지않습니다.");
				}
			}
		});
	}
	
	function userInfo(memberId){
		window.open('getUserInfo.do?id='+memberId,'UserInfo','width=400, height=400');
	}
	
	function showChat(){
		let logId = document.getElementById("logId").value;
		let no = document.getElementById("no").value;
		
		$.ajax({
			url : "checkClub.do",
			type : "post",
			data : {
				'id' : logId,
				'no' : no
			},
			dataType : 'text',
			success : function(data){
				if (data == "success") 
				{
				window.open('getChatRoom.do?roomId='+no+'&id='+logId,'chatRoom','width=500, height=750');
				
				} else {
					alert("참여하고 있지않습니다.");
				}
			}
		});
		
	} 
	
</script>


</html>