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

	//이메일 자동완성
	function email_change() {
	// 도메인 직접 입력 or domain option 선택
	const domainListEl = document.querySelector('#domain-list')
	const domainInputEl = document.querySelector('#domain-txt')
	// select 옵션 변경 시
	domainListEl.addEventListener('change', (event) => {
	  // option에 있는 도메인 선택 시
	  if(event.target.value !== "type") {
	    // 선택한 도메인을 input에 입력하고 disabled
	    domainInputEl.value = event.target.value
	    domainInputEl.disabled = true
	  } else { // 직접 입력 시
	    // input 내용 초기화 & 입력 가능하도록 변경
	    domainInputEl.value = ""
	    domainInputEl.disabled = false
	  }
	})
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
						<td class="userin"><input type="text" name="id" maxlength="10"></td>
					</tr>
					<tr>
						<td class="menu">비밀번호</td>
						<td class="userin"><input type="password" id="pw"
							onchange="check_pw()"></td>
					</tr>
					<tr>
						<td class="menu">비밀번호 확인</td>
						<td class="userin"><input type="password" id="pwd"
							onchange="check_pw()">&nbsp;<span id="check"></span></td>
					</tr>
					<tr>
						<td class="menu">이메일</td>
						<td class="userin"><input type="text" name="mail"> 
						<span class="a">@</span> <input type="text" id="domain-txt" name="email"> 
							<select	name="mailsel" id="domain-list" onchange="email_change()">
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
							<input class="addr-box" type="text" id="sample6_postcode" placeholder="우편번호"> 
							<input class="addr-box" class="but3" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input class="addr-box" type="text" id="sample6_address" placeholder="주소"><br>
							<input class="addr-box" type="text" id="sample6_detailAddress" placeholder="상세주소">
							<input class="addr-box" type="text" id="sample6_extraAddress" placeholder="참고항목">
						</td>
					</tr>
					<tr>
						<td class="menu">회원자격</td>
						<td>
							<a class="chtext" ><input type="radio" name="choose" value="seller" >seller</a>
							<a class="chtext" ><input type="radio" name="choose" value="seller" >customer</a>
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