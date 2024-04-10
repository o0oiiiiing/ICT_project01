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
</script>
</head>
<body>
<form action="qna_write_ok" method="post">
		<table width="700">
		<tbody>
			<tr>
				<th>작성자</th>
				<td align="left"><input type="text" name="user_id" value="${suvo.user_id}" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td align="left"> <input type="text" name="qna_subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="left"><textarea rows="10" cols="60" name="qna_content"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>qna 문의글 비밀번호</th>
				<td align="left"><input type="password" name="qna_pw" ></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="입력" onclick="qna_write_go(this.form)" /> 
				<input type="reset" value="취소" />
				</td>
			</tr>
            </tbody>
		</table>
	</form>
</body>
</html>