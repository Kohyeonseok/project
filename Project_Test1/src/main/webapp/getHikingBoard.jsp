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
<script src="jq/jquery.js"></script>
</head>
<body>
	<div class="container">
		${logId.id}님 안녕하세요. <br> <a class="btn btn-dark btn-sm" href="logout.do">LOGOUT</a> &nbsp; 
		<a class="btn btn-dark btn-sm" href="modify.jsp">MODIFY</a>
	</div>

	<div class="container p-3 my-3">
		<h3>H I K I N G</h3>
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
			</ul>
		</nav>
	</div>
	<c:if test="${logId.id eq board.id || logId.id eq 'admin'}"
		var="result">
		<%-- <div class="container my-3">
			<form name="contentForm">
				<input type="hidden" name="no" id="no" value="${board.no }">
				<table class="table table-bordered table-sm">
					<tr>
						<td>${board.title}</td>
					</tr>
					<tr>
						<td>${board.id}</td>
					</tr>
					<tr>
						<td style="min-height: 800px;"><img src="./uploadFile/${board.fileName}"
							alt="${board.fileName }" width="500px"><br>
							${board.content}
						</td>
					</tr>
					
				</table>
				<hr>
				<a class="btn btn-dark" href="deleteHikingBoard.do?no=${board.no}">삭제</a> 
				<a class="btn btn-dark" href="getHikingBoardList.do">목록</a>
				<a class="btn btn-dark" href="modifyHikingBoard.do?no=${board.no }">수정</a>
			</form>
		</div> --%>
		<div class="container my-3">
			<form name="contentForm">
				<input type="hidden" name="no" id="no" value="${board.no}">
				<input type="hidden" name="category" id="category" value="${board.category}">
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
							<table class="table table-sm" id="commentList">
								<thead class="thead-dark">
									<tr>
										<th class="col-2">작성자</th>
										<th class="col-7">댓글</th>
										<th class="col-3">작성시간</th>
									</tr>
								</thead>
							<tbody>
							<c:forEach var="reply" items="${boardReply }">
								<tr>
									<td>${reply.id}</td>
									<td>${reply.replyContent}</td>
									<td>${reply.wtime }</td>
								</tr>
							</c:forEach>
							</tbody>
							</table>
						</div>
						<input type="hidden" name="logId" id="logId" value="${logId.id }">
						<textarea class="form-control" id="replyContent" rows="3"></textarea>
						<button type="button" class="btn btn-dark mt-3 btn-sm" onClick="addReply()">댓글 작성</button>
					</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm" href="getHikingBoardList.do">목록</a>
					</div>
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm"
							href="modifyHikingBoard.do?no=${board.no}">수정</a>
					</div>
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm"
							href="deleteHikingBoard.do?no=${board.no}">삭제</a>
					</div>
				</div>
			</form>
		</div>
	</c:if>





	<c:if test="${logId.id ne board.id && logId.id ne 'admin'}"
		var="result">
		<%-- <div class="container my-3">
			<form name="contentForm">
				<input type="hidden" name="no" id="no" value="${board.no }">
				<table class="table table-bordered table-sm">
					<tr>
						<td>${board.id}</td>
					</tr>
					<tr>
						<td>${board.title}</td>
					</tr>
					<tr>
						<td style="min-height: 800px;"><img src="./images/${board.fileName}"
							alt="${board.fileName }" width="500px"> ${board.content}</td>
					</tr>
					
				</table>
				<hr>
				<a class="btn btn-dark" href="getHikingBoardList.do">목록</a>
			</form>
		</div> --%>
		<div class="container my-3">
			<form name="contentForm">
				<input type="hidden" name="no" id="no" value="${board.no}">
				<input type="hidden" name="category" id="category" value="${board.category}">
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
										<th class="col-7">댓글</th>
										<th class="col-3">작성시간</th>
									</tr>
								</thead>
								<tbody>
							<c:forEach var="reply" items="${boardReply }">
								<tr>
									<td>${reply.id}</td>
									<td>${reply.replyContent}</td>
									<td>${reply.wtime }</td>
								</tr>
							</c:forEach>
							</tbody>
							</table>
						</div>
						<input type="hidden" name="logId" id="logId" value="${logId.id }">
						<textarea class="form-control" id="replyContent" rows="3"></textarea>
						<button type="button" class="btn btn-dark mt-3 btn-sm" onClick="addReply()">댓글 작성</button>
					</div>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<a class="btn btn-dark btn-block btn-sm" href="getHikingBoardList.do">목록</a>
					</div>
				</div>
			</form>
		</div>
	</c:if>

</body>
<script>
function addReply() {
    var postNo = document.getElementById("no").value;
    var category = $("#category").val();
    var id = $("#logId").val();
    var replyContent = $("#replyContent").val();

    $.ajax({
        type: "POST",
        url: "inputReply.do",
        data: {
            'postNo': postNo,
            'category': category,
            'id': id,
            'replyContent': replyContent
        },
        dataType: 'json',
        success: function (data) {
        	console.log(data);
            if (data) {
                updateComment(data);
            } else {
                alert('댓글 추가에 실패했습니다.');
            }
        }
    });
}

function updateComment(data) {
    console.log(data);
    commentList.innerHTML += '<tr><td>' + data.id + '</td><td>' + data.replyContent +'</td><td>'+data.wtime +'</td></tr>';
    $("#replyContent").val("");
}
</script>


</html>