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

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="jq/jquery.js"></script>
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
		<h3>${category }</h3>
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
	<c:if test="${logId.id eq board.id || logId.id eq 'admin'}"
		var="result">
		<div class="container my-3">
			<form name="contentForm">
				<input type="hidden" name="no" id="no" value="${board.no}">
				<input type="hidden" name="category" id="category"
					value="${board.category}">
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered table-sm" style="background-color : white;">
							<tr>
								<td>${board.title}</td>
							</tr>
							<tr>
								<td>${board.id}</td>
							</tr>
							<tr>
								<td>${board.wtime}</td>
							</tr>
							<tr>
								<td style="min-height: 800px;"><img
									src="./uploadFile/${board.fileName}" alt="${board.fileName}"
									width="400px"> <br> ${board.content}</td>
							</tr>
						</table>
					</div>
				</div>
				<hr>
				<div class="container">
					<h4>R E P L Y</h4>
					<div class="container">
						<table class="table table-sm" id="commentList" style="background-color : white;">
							<thead class="thead-dark">
								<tr>
									<th class="col-2">작성자</th>
									<th class="col-6">댓글</th>
									<th class="col-3">작성시간</th>
									<th class="col-1">비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reply" items="${boardReply }">
									<tr>
										<td>${reply.id}</td>
										<td>${reply.replyContent}</td>
										<td>${reply.wtime }</td>
										<c:if test="${reply.id eq logId.id || logId.id eq 'admin'}" var="result">
											<td>
												<button class="btn btn-light btn-sm" onclick="deleteReply(${reply.no})">삭제</button>
											</td> 
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<input type="hidden" name="logId" id="logId" value="${logId.id }">
					<textarea class="form-control" id="replyContent" rows="3"></textarea>
					<button type="button" class="btn btn-dark mt-3 btn-sm"
						onClick="addReply()">댓글 작성</button>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm"
							href="getBoardList.do?category=${category }">목록</a>
					</div>
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm"
							href="modifyBoard.do?no=${board.no}&category=${category}">수정</a>
					</div>
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm"
							href="deleteBoard.do?no=${board.no}&category=${category}">삭제</a>
					</div>
				</div>
			</form>
		</div>
	</c:if>





	<c:if test="${logId.id ne board.id && logId.id ne 'admin'}"
		var="result">
		<div class="container my-3">
			<form name="contentForm">
				<input type="hidden" name="no" id="no" value="${board.no}">
				<input type="hidden" name="category" id="category"
					value="${board.category}">
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered table-sm">
							<tr>
								<td>${board.title}</td>
							</tr>
							<tr>
								<td>${board.id}</td>
							</tr>
							<tr>
								<td style="min-height: 800px;"><img
									src="./uploadFile/${board.fileName}" alt="${board.fileName}"
									width="400px"> <br> ${board.content}</td>
							</tr>
						</table>
					</div>
				</div>
				<hr>
				<div class="container">
					<h4>R E P L Y</h4>
					<div class="container">
						<table class="table table-sm" id="commentList">
							<thead class="thead-dark">
								<tr>
									<th class="col-2">작성자</th>
									<th class="col-6">댓글</th>
									<th class="col-3">작성시간</th>
									<th class="col-1">비고</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reply" items="${boardReply }">
									<tr>
										<td>${reply.id}</td>
										<td>${reply.replyContent}</td>
										<td>${reply.wtime }</td>
										<c:if test="${reply.id eq logId.id || logId.id eq 'admin'}" var="result">
											<td>
												<a class="btn btn-light btn-sm" href="deleteReply.do">삭제</a>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<input type="hidden" name="logId" id="logId" value="${logId.id }">
					<textarea class="form-control" id="replyContent" rows="3"></textarea>
					<button type="button" class="btn btn-dark mt-3 btn-sm"
						onClick="addReply()">댓글 작성</button>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm"
							href="getBoardList.do?&category=${category}">목록</a>
					</div>
					<div class="col-md-4">
						<a class="btn btn-danger btn-block btn-sm" data-toggle="modal"
							data-target="#myModal">신고</a>
					</div>
				</div>
			</form>
		</div>
	</c:if>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">R E P O R T</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="report.do" method="post"
						onsubmit="return contentCheck()">
						<input type="hidden" name="reportId" value="${board.id }">
						<input type="hidden" name="reportBoardCategory"
							value="${board.category }"> <input type="hidden"
							name="reportBoardNo" value="${board.no }"> <select
							name="reportCategory" class="form-control">
							<option value="욕설">욕설</option>
							<option value="사행성">사행성</option>
							<option value="허위사실">허위사실</option>
						</select> <br> <input type="text" class="form-control mr-sm-2"
							name="reportContent" id="reportContent"
							placeholder="신고내용을 입력하세요."><br>
						<br> <input class="btn btn-danger btn-sm" type="submit"
							value="신고">&nbsp;
						<button type="button" class="btn btn-danger btn-sm"
							data-dismiss="modal">닫기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	function addReply() {
		var postNo = document.getElementById("no").value;
		var category = $("#category").val();
		var id = $("#logId").val();
		var replyContent = $("#replyContent").val();

		$.ajax({
			type : "POST",
			url : "inputReply.do",
			data : {
				'postNo' : postNo,
				'category' : category,
				'id' : id,
				'replyContent' : replyContent
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				if (data) {
					location.reload();
				} else {
					alert('댓글 추가에 실패했습니다.');
				}
			}
		});
	}

	function contentCheck() {
		var content = document.getElementById("reportContent").value;

		if (content == "") {
			alert("신고내용을 작성하세요.");
			return false;
		}
		alert("신고를 완료하였습니다.");
	}
	
	function deleteReply(no) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "deleteReply.do",
                data: { "no": no },
                success: function (response) {
                    location.reload();
                },
                error: function (error) {
                    console.error("Error deleting reply:", error);
                }
            });
        }
    }
</script>


</html>