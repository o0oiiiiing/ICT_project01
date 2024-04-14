<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function qna_write_go(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if(i == 0){
					continue;
				}
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.submit();
	}
	function back() {
		location.href = "qna";
	}
</script>
</head>
<body>
<form action="qna_write_ok" method="post">
		
		<table width="700" style="margin: 200px auto; border: 1px solid black;">
			<caption style="font-size: 20px; font-weight: bold;">
				QnA 작성하기
			</caption>
		<tbody>
			<tr>
				<th>공개 여부</th>
				<td align="left">
					<input type="radio" name="secret" checked value="0">공개글 설정<br>
					<input type="radio" name="secret" value="1">비밀글 설정
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td align="left"><input type="text" name="user_id" value="${ssuvo.user_id}" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td align="left"><input type="text" name="qna_subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="left">
					<textarea rows="10" cols="60" name="qna_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="입력" onclick="qna_write_go(this.form)" /> 
				<input type="button" value="취소" onclick="back()" />
				</td>
			</tr>
            </tbody>
		</table>
	</form>
</body>
</html>