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
<script type="text/javascript">
	function claim_delete_ok() {
		location.href="claim_delete_ok";
		method = "post";
	}
</script>
<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/kch-css/findresult.css">
</head>
<body>
	<section id="wrap">
		<div id="findt">
			<h1>게시물 비밀번호를 입력해주세</h1>
			<input type="password" name="claim_pwd">
		</div>
		<div id="btnn">
			<input type="button" value="삭제" onclick="claim_delete_ok()">
			<input type="button" value="취소" onclick="location.href='claim'">
		</div>
	</section>
</body>
</html>