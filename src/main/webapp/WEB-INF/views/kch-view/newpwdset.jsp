<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function npwdset() {
		location.href="npwdset";	
	}
</script>
</head>
<body>
	<div class="npwdbox">
		<input type="text" id="npwd" name="pass" placeholder="새로운 패스워드를 입력하세요" > 
			<input type="text" id="npasschk" placeholder="새로운 패스워드를 다시 입력하세요" >
	</div>
	<button id="npwdbtn" onclick="npwdset()">변경</button>
</body>
</html>