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
			<h1>회원님의 아이디는</h1><a>${kvo2.user_id}</a><h1>입니다.</h1>
		</div>
		<div id="btnn">
			<input type="button" value="login" onclick="location.href='home'">
			<input type="button" value="pwfind" onclick="location.href='find'">
		</div>
	</section>
</body>
</html>