<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 아이큰 -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/common-css/login.css">
<!-- 서버용 함수 -->
<script type="text/javascript">
	function join() {
		location.href="join";
	}
	function find() {
		location.href="find";
	}
</script>
<body>
	<section class="login">
		<form method="post" action="login">
			<p class="login_text">로그인 | 회원가입</p>
			<br>
			<div id="login_form">
				<div class="inputBox">
					<input type="text" name="user_id" placeholder="Username">
				</div>
				<div class="inputBox">
					<input type="password" name="user_pwd" placeholder="Password">
				</div>
				<div class="inputBox">
					<input type="submit" value="Log in">
				</div>
			</div>
			<br>
		</form>
		<div class="join">
			<div class="inputBox">
				<input type="button" value="회원가입" onclick="join()">
			</div>
			<div class="inputBox">
				<input type="button" value="아이디 | 비밀번호 찾기" onclick="find()">
			</div>
		</div>
	</section>
</body>
</html>