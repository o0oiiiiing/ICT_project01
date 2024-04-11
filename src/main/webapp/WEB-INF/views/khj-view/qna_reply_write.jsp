<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
	    text-align:center;
	    padding:4px 10px;
	    background-color: #F6F6F6;
	}
	
th {
		width:120px;
	    text-align:center;
	    padding:4px 10px;
	    background-color: #B2CCFF;
	}
</style>
<script type="text/javascript">
	function qna_reply_write_ok(f) {
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.action = "qna_reply_write_ok";
		f.submit();
	}
	function qna_list() {
		location.href = "qna";
	}
</script>
</head>
<body>
	<form action="" method="post" >
		<table width="700">
		<tbody>
			<tr>
				<th>qna 글 제목</th>
				<td align="left">${qnavo.qna_subject}</td>
			</tr>
			<tr>
				<th>qna 글 내용</th>
				<td align="left">${qnavo.qna_content}</td>
			</tr>
			<tr>
				<th>답글 작성자</th>
				<td align="left"><input type="text" name="qna_reply_writer"></td>
			</tr>
			<tr>
				<th>답글 내용</th>
				<td align="left"><textarea rows="10" cols="60" name="qna_reply_content"></textarea>
				</td>
			</tr>
			<tr>
				<th>답글 비밀번호</th>
				<td align="left"><input type="password" name="qna_pw"></td>
			</tr>
			<tr>
				<td colspan="2">
			<%-- 	<input type="hidden" name="cPage" value="${cPage }"> --%>
				<input type="hidden" name="qna_idx" value="${qnarvo.qna_idx }">
				<input type="hidden" name="qna_reply_status" value="1">
				<input type="button" value="답글입력" onclick="qna_reply_write_ok(this.form)" /> 
				<input type="button" value="목록" onclick="qna_list()" /> 
				<input type="reset" value="취소" />
				</td>
			</tr>
            </tbody>
		</table>
	</form>
</body>
</html>