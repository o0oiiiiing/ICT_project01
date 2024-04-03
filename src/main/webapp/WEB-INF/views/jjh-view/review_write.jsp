<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
<h2>리뷰 작성</h2>
<div>
<form action="review_insert" method="post">
	<label for="user_id">유저명 : </label>
	<input type="text" name="user_id" id="user_id" value="${ssuvo.user_id}" disabled>
	<br>
	<label>평점 : </label>
	<input type="radio" name="score" value="1">1점
	<input type="radio" name="score" value="2">2점
	<input type="radio" name="score" value="3">3점
	<input type="radio" name="score" value="4">4점
	<input type="radio" name="score" value="5">5점
	<br>
	<input type="file" name="review_f_img">
	<br>
	<textarea rows="5" cols="30" name="review_content"></textarea>
</form>
</div>
</body>
</html>