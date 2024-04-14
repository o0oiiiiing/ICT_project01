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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>

<script type="text/javascript">
	function update_pwd_ok(f){
		f.action="update_pwd_ok";
		f.submit();
	}
	// 비밀번호 일치 확인
	function check_pw(){
 
    var pw = document.getElementById('pw').value;
   
    	if(document.getElementById('pw').value !='' && document.getElementById('pwd').value!=''){
    		if(document.getElementById('pw').value==document.getElementById('pwd').value){
    			document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
      	        document.getElementById('check').style.color='blue';
    			document.getElementsByClassName('but4')[0].disabled = false;
        	}else {
            	  document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            	  document.getElementById('check').style.color='red';
            	  document.getElementsByClassName('but4')[0].disabled = true;
            	  }
        }
    }
</script>
</head>
<body>
	<form method="post" >
		<div class="container">
			<div class="insert">

				<table>
					<caption>
						<h2>개인정보입력</h2>
					</caption>
					<tr>
						<td class="menu">변경할 비밀번호</td>
						<td class="userin"><input type="password" id="pw" name="user_pwd"
							onchange="check_pw()"></td>
					</tr>
					<tr>
						<td class="menu">변경할 비밀번호 확인</td>
						<td class="userin"><input type="password" id="pwd"
							onchange="check_pw()">&nbsp;<span id="check"></span></td>
					</tr>
				</table>

			</div>

			<div class="create">
				<input class="but4" type="button" value="수정하기" onclick="update_pwd_ok(this.form)">
				<input class="but5" type="button" value="취소하기" onclick="location.href='mypage'"> 

			</div>
		</div>
	</form>
</body>
</html>