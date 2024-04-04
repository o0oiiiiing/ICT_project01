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
		$("#pick").click(function() {
			$.ajax({
				url : "cartAjax.do",
				method : "post",
				dataType : "text",
				data : "p_idx="+$(this).attr("name"),
				success : function(data) {
					$("#cart_ajax").text("("+data+")")
				},
				error: function() {
					alert("읽기 실패")
				}
			})
		})
		$("#wish_ajax").click(function() {
			$.ajax({
				url : "wishAjax.do",
				method : "post",
				dataType : "text",
				data : "p_idx="+$(this).attr("name"),
				success : function(data) {
					$("#cart_ajax").text("("+data+")")
				},
				error: function() {
					alert("읽기 실패")
				}
			})
		})
	})
</script>
</body>
</html>