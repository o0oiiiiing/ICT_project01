<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/kch-css/findresult.css">
</head>
<body>
	<section id="wrap">
		<div id="findt">
			<P>메일로 보내드린 인증번호 <br>
			6자리를 입력해 주세요.</P><br><br>
			<input type="password" id="pw" name="user_pwd">
		</div>
		<div id="btnn">
			<input type="button" value="로그인하기" onclick="location.href='home'">
		</div>
	</section>
</body>
</html>