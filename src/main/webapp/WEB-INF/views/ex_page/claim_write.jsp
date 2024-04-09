<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/kch-css/claim_write.css">
</head>
<body>
<form method="post" action="claim_ok">
		<div class="container">
			<div class="insert">

				<table>
					<caption>
						<h2>신고하기</h2>
					</caption>
					<tr>
						<td class="menu">아이디</td>
						<td class="userin">${ssuvo.user_id}</td>
					</tr>
					<tr>
						<td class="menu">비밀번호</td>
						<td class="userin"><input type="password" id="qna_pw" name="qna_pw" />
					</tr>
					<tr>
						<td class="menu">제목</td>
						<td class="userin"><input type="text" id="qna_subject" name="qna_subject">
						</td>
					</tr>
					<tr>
						<td class="menu">내용</td>
						<td><textarea rows="10" cols="60" id="qna_content" name="qna_content"></textarea>
						</td>
					</tr>
				</table>

			</div>

			<div class="create">
				<input class="but4" type="submit" value="등록하기">
				<input class="but5" type="button" value="취소하기" onclick="location.href='claim'"> 

			</div>
		</div>
	</form>
</body>
</html>













