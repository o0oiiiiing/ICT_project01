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
<script type="text/javascript">
$(document).ready(function() {
	let chk = "${chk}";
	if(chk == 'fail'){
		alert("아이디나 이메일이 없습니다.");
		return ;
	}
});

</script>

<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/kch-css/find.css">
</head>
<body>
	<section id="wrap">
		<section class="f_ipw">
			<div class="f_text">
				<h1>아이디 찾기</h1>
				<hr>
				<span>회원가입시 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인할 수 있습니다.</span>
			</div>
			<form action="find_user_id" class="f_form" method="post">
				<div class="f_ep">
					<input type="radio" name="f_id">이메일
					<input type="radio" name="f_id">휴대폰
				</div>
				<div class="f_ne"> 
					<label for="name_id" >이름&nbsp;&nbsp;&nbsp;</label>
						 <input type="text" class="in_text" id="name_id" name="user_name"><br>
				</div>
				<div class="f_ne">
					<label for="email_id" >이메일</label>
						 <input type="text" class="in_text" id="email_id" name="email_id">
				</div>
				<div class="f_ir">
					<input type="submit" value="아이디 찾기" >&nbsp;
					<input type="button" value="취소" onclick="location='login.jsp'">
				</div>
			</form>
		</section>
		<section class="f_ipw">
			<div class="f_text">
				<h1>비밀번호 찾기</h1>
				<hr>
				<span>가입하신 아이디 + 이메일 또는 휴대폰 번호로 임시비밀번호를 보내드립니다. 로그인 하셔서 반드시 비밀번호를 변경하시기 바랍니다.</span>
			</div>
			<form action="find_user_pw" class="f_form" method="post">
				<div class="f_ep">
					<input type="radio" name="f_id">이메일
					<input type="radio" name="f_id">휴대폰
				</div>
				<div class="f_ne">
					<label for="id_pwd" >아이디</label>
					 <input type="text" class="in_text" id="id_pwd" name="user_id"><br>
				</div>
				<div class="f_ne">
					<label for="email_pwd" >이메일</label>
					 <input type="email" class="in_text" id="email_pwd" name="email_pwd"
					 pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" title="이메일 양식">
				</div>
				<div class="f_ir">
					<input type="submit" value="임시비밀번호 발급">&nbsp;
					<input type="button" value="취소" onclick="location='home'">
				</div>
			</form>
		</section>
	</section>
</body>
</html>