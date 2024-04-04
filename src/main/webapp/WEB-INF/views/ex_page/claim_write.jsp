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
						<td class="userin">${uvo.user_id}</td>
					</tr>
					<tr>
						<td class="menu">이메일</td>
						<td class="userin">
						<span class="a">${uvo.user_email}</span> 
						</td>
					</tr>
					<tr>
						<td class="menu">비밀번호</td>
						<td class="userin"><input type="password" id="pw" name="user_pwd" />
					</tr>
					<tr>
						<td class="menu">내용</td>
						<td><textarea rows="10" cols="60" name="content"></textarea>
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