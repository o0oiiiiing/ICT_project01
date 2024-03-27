<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
$(".wishitems > div:nth-of-type(2) button:nth-of-type(2)").click(function() {
	$(this).parent().parent().remove();
});
$(".wishitems > div:nth-of-type(2) button:nth-of-type(2)").hover(
	function() {
		$(this).css("backgroundColor", "gray");
	},
	function() {
		$(this).css("backgroundColor", "#bfbfbf");
	}
);
</script>
</body>
</html>