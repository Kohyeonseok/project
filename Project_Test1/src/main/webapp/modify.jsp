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
		${logId.id}님 안녕하세요. <br> 
		<a class="btn btn-dark btn-sm" href="logout.do">LOGOUT</a>
	</div>

	<div class="container p-3 my-3">
		<h3>M O D I F Y</h3>
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
					href="#">CAMPING</a></li>
				<li class="nav-item"><a class="nav-link"
					href="#">FREE</a></li>
				<li class="nav-item"><a class="nav-link"
					href="#">MARKET</a></li>
			</ul>
		</nav>
	</div>
	<div class="container p-3 my-3 border">
		<form action="modify.do" action="post" onsubmit="return check()">
			이름 <br> 
			<input type="text" name="name" id="name" value="${logId.name}"><br>
			<br> 
			아이디<br> 
			<input type="text" name="id" value="${logId.id}" readonly="readonly">
			<br><br> 
			닉네임 <br> 
			<input type="text" name="nickName" id="nickName" value="${logId.nickName}"><br><br> 
			비밀번호 <br> 
			<input type="password" name="password" id="password"><br>
			<br> 
			비밀번호 확인 <br> 
			<input type="password"
				name="passwordCheck" id="passwordCheck"><br>
			<br> 
			이메일 <br> 
			<input type="email" name="email" id="email" value="${logId.email}" readonly="readonly"><br>
			<br> 
			주소 <br> 
			<input type="text" name="sample4_postcode" id="sample4_postcode" value="${logId.sample4_postcode}" placeholder="우편번호"> 
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" name="sample4_roadAddress" id="sample4_roadAddress" value="${logId.sample4_roadAddress}" placeholder="도로명주소"> 
			<input type="text" name="sample4_jibunAddress" id="sample4_jibunAddress" value="${logId.sample4_jibunAddress}"  placeholder="지번주소"> 
			<span id="guide" style="color: #999; display: none"></span> 
			<input type="text" name="sample4_detailAddress" id="sample4_detailAddress" value="${logId.sample4_detailAddress}" placeholder="상세주소"> 
			<input type="text" name="sample4_extraAddress" id="sample4_extraAddress" value="${logId.sample4_extraAddress }" placeholder="참고항목">
			<br>
			<br> 
			전화번호 <br> 
			<input type="text" name="phoneNum"	id="phoneNum" value="${logId.phoneNum}" >
			<br>
			<br> 
			성별 <br> 
			<input type="radio" name="gender" id="gender" value="male" ${logId.gender eq "male" ? 'checked' : '' }>남 
			<input type="radio" name="gender" id="gender" value="female" ${logId.gender eq "female" ? 'checked' : '' }>여
			<br> 
			<input class="btn btn-dark btn-sm" type="submit" value="정보수정">
		</form>
		<br>
		<a class="btn btn-dark btn-sm" href="main.jsp">취소</a>&nbsp;
		<a class="btn btn-dark btn-sm" href="deleteUser.do?id=${logId.id}">탈퇴</a>
	</div>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>

	<script>
		function check() {
			let pw = document.getElementById("password").value;
			let pwCk = document.getElementById("passwordCheck").value;

			if (pw === "") {
				alert("비밀번호를 입력하세요");
				document.getElementById("password").focus();
				return false;
			} else if (pw === pwCk) {
				return true;
			} else {
				alert("암호가 일치하지 않습니다.");
				document.getElementById("passwordCheck").focus();
				return false;
			}

		}
		
		
	</script>


</body>
</html>