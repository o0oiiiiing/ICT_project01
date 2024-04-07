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

<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/jjh-css/point.css">
<script type="text/javascript">
function closePop() {
	window.close();
}
function point(f) {
    // 서버로의 요청을 비동기적으로 보냅니다.
    $.ajax({
        type: "POST",
        url: "point",
        dataType : "text",
        data: $(f).serialize(),
        success: function(data) {
            // 서버로의 요청이 성공하면 원래 창을 새로고침합니다.
            console.log("1")
            window.opener.location.reload();
            console.log("2")
            // 팝업 창을 닫습니다.
            closePop();
        },
        error: function(xhr, status, error) {
            // 서버로의 요청이 실패하면 오류를 처리합니다.
            console.error(xhr.responseText);
            alert("요청을 처리하는 중에 오류가 발생했습니다.");
        }
    });
}
</script>
</head>
<body>
	<form method="post" action="point">
		<div class="container">
			<div class="insert">
				<table>
					<caption>
						<h2>충전할 포인트를 입력해주세요</h2>
					</caption>
					<tr id="addr">
						<td class="menu">포인트 : </td>
						<td class="userin" id="addr-in">
							<input type="number" name="user_point">
						</td>
					</tr>
				</table>
			</div>
			<div class="create">
				<input class="but4" type="button" value="충전하기" onclick="point(this.form)">
				<input class="but5" type="button" value="취소" onclick="closePop()"> 
			</div>
		</div>
	</form>
</body>
</html>