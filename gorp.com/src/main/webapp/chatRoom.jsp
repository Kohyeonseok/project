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
	<div class="container d-flex flex-column justify-content-between" style="height:100vh;">

		<div class="container" id="messageContainer" style="height: 80%; overflow: auto;">
			<c:forEach var="message" items="${chatMessage}">
				<p>${message.id}: ${message.message}</p>
			</c:forEach>
		</div>
		<div class="container">
				<input type="hidden" name="id" id="id" value="${logId.id }"> 
				<input type="hidden" name="roomId" id="roomId" value="${roomId}"> 
				<input type="hidden" name="maxNo" id="maxNo" value="${maxNo }">
				<input type="text" class="form-control" name="message" id="message" placeholder="댓글입력"> 
				<a class="btn btn-dark w-100" onclick="chatMessage()">전송</a>
		</div>
	</div>
</body>

<script>
	let id = document.getElementById("id").value;
	let message = document.getElementById("message").value;
	let roomId = document.getElementById("roomId").value;
	let maxNo = document.getElementById("maxNo").value;

	$(document).ready(
			function() {
				setInterval(function() {
					$.ajax({
						url : "getMessages.do",
						type : "get",
						data : {
							'roomId' : roomId,
							'maxNo' : maxNo
						},
						dataType : 'json',
						success : function(data) {
							var messageContainer = $("#messageContainer");
							messageContainer.empty();

							$.each(data, function(index, message) {
								messageContainer.append('<p>' + message.id
										+ ' : ' + message.message + '</p>');
							});
						}
					});
				}, 500);
			});

	function closeWindow() {
		window.close();
	}

	function chatMessage() {
		let id = document.getElementById("id").value;
		let message = document.getElementById("message").value;
		let roomId = document.getElementById("roomId").value;
		
		if(message == ""){
			alert("대화내용을 입력하세요. ");
			document.getElementById("message").focus();
			return false;
		}

		$.ajax({
			url : "sendMessage.do",
			type : "post",
			data : {
				'id' : id,
				'message' : message,
				'roomId' : roomId
			},
			dataType : 'text',
			success : function(data) {
				if (data == "success") {
					console.log("전송성공.");
					var messageContainer = $("#messageContainer");
					messageContainer.append('<p>' + id + ' : ' + message + '</p>');
					$("#message").val("");
				} else {
					alert("메세지 전송 실패.");
				}
			}
		});

	}
	
	$("#message").keydown(function(event) {
	    if (event.keyCode == 13) { 
	        chatMessage(); 
	        event.preventDefault();
	    }
	});
	
	
</script>
</html>