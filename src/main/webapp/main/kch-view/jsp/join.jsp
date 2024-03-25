<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/join.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
</head>
<body>
	<form method="post" action="">
		<div class="container">
			<div class="insert">

				<table>
					<caption>
						<h2>개인정보입력</h2>
					</caption>
					<tr>
						<td class="menu">이름</td>
						<td class="userin"><input type="text" name="name" maxlength="5"></td>
					</tr>
					<tr>
						<td class="menu">아이디</td>
						<td class="userin"><input type="text" name="id" maxlength="10">
							<input class='but1' type="button" value="중복확인" onclick="">
						</td>
					</tr>
					<tr>
						<td class="menu">비밀번호</td>
						<td class="userin"><input type="password" name="pw"
							maxlength="16"></td>
					</tr>
					<tr>
						<td class="menu">비밀번호 확인</td>
						<td class="userin"><input type="password" name="pwd"
							maxlength="16"></td>
					</tr>
					<tr>
						<td class="menu">이메일</td>
						<td class="userin"><input type="text" name="mail"> <span
							class="a">@</span> <input type="text" name="email"> <select
							name="mailsel">
								<option value="self" selected>직접입력</option>
								<option value="naver">naver.com</option>
								<option value="gm">gmail.com</option>
								<option value="da">daum.com</option>
						</select> <input class='but2' type="button" value="이메일 중복확인" onclick="">
						</td>
					</tr>
					<tr id="addr">
						<td class="menu">주소</td>
						<td class="userin" id="addr-in">
							<input type="text" id="sample6_postcode" placeholder="우편번호"> 
							<input class="but3" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample6_address" placeholder="주소"><br>
							<input type="text" id="sample6_detailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목">
						</td>
					</tr>
				</table>

			</div>

			<div class="create">
				<input class="but4" type="submit" value="회원가입">
				<input class="but5" type="button" value="가입취소" onclick=""> 

			</div>
		</div>
	</form>
</body>
</html>