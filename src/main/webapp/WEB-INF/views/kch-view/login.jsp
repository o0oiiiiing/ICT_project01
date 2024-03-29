<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/kch-css/login.css">
<!-- 서버용 함수 -->
<script type="text/javascript">
	function join() {
		location.href="join.jsp";
	}
	function find() {
		location.href="find.jsp";
	}
</script>
</head>
<body>
	<section class="login">
		<form method="post">
			<h2 class="material-symbols-outlined">
				<span><a class="icon">Person</a>로그인</span>
			</h2>
			<br>
			<div id="login_form">
				<div class="inputBox">
					<input type="text" placeholder="Username">
				</div>
				<div class="inputBox">
					<input type="password" placeholder="Password">
				</div>
				<div class="inputBox">
					<input type="submit" value="Log in">
				</div>
			</div>
		</form>
		<div class="join">
			<div class="inputBox">
				<input type="button" value="회원가입" onclick="join()">
			</div>
			<br>
			<div class="inputBox">
				<input type="button" value="아이디/비밀번호 찾기" onclick="find()">
			</div>
		</div>
	</section>
</body>
</html>