<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
function closePop() {
	window.close();
}
function point(f) {
    // 서버로의 요청을 비동기적으로 보냅니다.
    $.ajax({
        type: "post",
        url: "popup",
        dataType : "text",
        data: $(f).serialize(),
        success: function(data) {
            closePop();
        },
        error: function() {
            alert("서버 오류");
        }
    });
}
</script>

</head>
<body>
	<form method="post" style="width: 600px; height: 350px; margin: 0 auto;">
		<div style="width: 600px; height: 300px;">
		<img src="resources/jjh-image/popup.png" style="width: 100%; height: 100%; object-fit : contain;">
		</div>
		<br>
		<input type="checkbox" name="popup" value="1">
		<span>3분동안 보지 않기</span>
		<input type="button" value="닫기" onclick="point(this.form)">
	</form>
</body>
</html>