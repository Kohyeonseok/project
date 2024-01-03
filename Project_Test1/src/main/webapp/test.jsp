<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hiking</title>
    <script src="jq/jquery.js"></script>
    <script src="js/hiking.js"></script>
    <link rel="stylesheet" href="css/hiking&camp.css">
    <link rel="icon" href="images/logo.png">
</head>

<body>
	
	<script>
		$.ajax({
			url:'http://localhost:8080/www/cat.do',
			type:'GET',
			dataType: 'json',
			crossDomain: true,
			success:function(list){
				console.log('성공',list);
				$(".review_list")
			const nodes = document.querySelectorAll(".review_list")
			for (let i = 0; i < node.length; i++) {
				const item = list[i];
				const node = nods[i];
				node > img > src = item.image_url
				
				
			}
			},
			error:function(xhr,status,error){
				console.log('error::::', xhr, status, error);
			}
		});
		
	</script>
</body>

</html>