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
<link rel="stylesheet" href="resources/common-css/logout.css">
<!-- 서버용 함수 -->
<script type="text/javascript">
	function mypage() {
		location.href="mypage";
	}
	function log_out() {
		location.href="logout";
	}
</script>
<body>
	<section class="login">
		<input type="button" value="마이페이지" onclick="mypage()">
		<p class="vertical">&nbsp;&nbsp;|</p>
		<input type="button" value="로그아웃" onclick="log_out()">
	</section>
</body>
</html>