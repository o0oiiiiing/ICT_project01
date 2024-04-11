<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	$("#re_insert_btn").toggle(function() {
		$("#re_insert").css("display", "block");
	}, function() {
		$("#re_insert").css("display", "none");
	});
});
$(document).ready(function() {
	$("#re_chk_btn").toggle(function() {
		$("#re_chk").css("display", "block");
	}, function() {
		$("#re_chk").css("display", "none");
	});
});
</script>
</body>
</html>