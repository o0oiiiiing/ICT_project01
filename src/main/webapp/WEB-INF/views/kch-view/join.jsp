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
<link rel="stylesheet" href="resources/kch-css/join.css">
<!-- ??? -->
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

// 비밀번호 일치 확인
	function check_pw(){
 
    var pw = document.getElementById('pw').value;
   
    	if(document.getElementById('pw').value !='' && document.getElementById('pwd').value!=''){
    		if(document.getElementById('pw').value==document.getElementById('pwd').value){
    			document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
      	        document.getElementById('check').style.color='blue';
        	}else {
            	  document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            	  document.getElementById('check').style.color='red';
            	  }
        }
    }
    
    $(document).ready(function() {
		$("#domain-list").change(function() {
			if ($(this).find("option:selected").val()!="type") {
				$("#domain-txt").val($(this).find("option:selected").val());
				$("#domain-txt").prop("disabled", "true");
			}
			else {
				$("#domain-txt").removeAttr("disabled");
				$("#domain-txt").val("");
			}
		})
	})
</script>
</head>
<body>
	<form method="post" action="join_ok">
		<div class="container">
			<div class="insert">

				<table>
					<caption>
						<h2>개인정보입력</h2>
					</caption>
					<tr>
						<td class="menu">이름</td>
						<td class="userin"><input type="text" name="user_name" maxlength="5"></td>
					</tr>
					<tr>
						<td class="menu">아이디</td>
						<td class="userin"><input type="text" name="user_id" maxlength="10"></td>
					</tr>
					<tr>
						<td class="menu">휴대폰 번호</td>
						<td class="userin"><input type="text" name="user_phone" placeholder="ex) 010-0000-0000"></td>
					</tr>
					<tr>
						<td class="menu">비밀번호</td>
						<td class="userin"><input type="password" id="pw" name="user_pwd"
							onchange="check_pw()"></td>
					</tr>
					<tr>
						<td class="menu">비밀번호 확인</td>
						<td class="userin"><input type="password" id="pwd"
							onchange="check_pw()">&nbsp;<span id="check"></span></td>
					</tr>
					<tr>
						<td class="menu">이메일</td>
						<td class="userin"><input type="text" name="front_email"> 
						<span class="a">@</span> <input type="text" id="domain-txt" name="back_email"> 
							<select	name="mailsel" id="domain-list">
								<option value="type" selected >직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.com</option>
						</select> 
						</td>
					</tr>
					<tr id="addr">
						<td class="menu">주소</td>
						<td class="userin" id="addr-in">
							<input class="addr-box" type="text" id="sample6_postcode" name="zip_code" placeholder="우편번호"> 
							<input class="addr-box" class="but3" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input class="addr-box" type="text" id="sample6_address" name="main_addr" placeholder="주소"><br>
							<input class="addr-box" type="text" id="sample6_detailAddress" name="detail_addr" placeholder="상세주소">
							<input class="addr-box" type="text" id="sample6_extraAddress" name="ex_addr" placeholder="참고항목">
						</td>
					</tr>
					<tr>
						<td class="menu">회원자격</td>
						<td>
							<a class="chtext" ><input type="radio" name="user_type" value="0" >seller</a>
							<a class="chtext" ><input type="radio" name="user_type" value="1" >customer</a>
						</td>
					</tr>
				</table>

			</div>

			<div class="create">
				<input class="but4" type="submit" value="회원가입">
				<input class="but5" type="button" value="가입취소" onclick="location.href='home'"> 

			</div>
		</div>
	</form>
</body>
</html>