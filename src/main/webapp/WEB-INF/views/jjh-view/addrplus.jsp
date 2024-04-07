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
<link rel="stylesheet" href="resources/jjh-css/addradd.css">
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
	<form method="post" action="addrAdd">
		<div class="container">
			<div class="insert">
				<table>
					<caption>
						<h2>추가 주소 입력</h2>
					</caption>
					<tr id="addr">
						<td class="menu">주소</td>
						<td class="userin" id="addr-in">
							<input type="checkbox" name="addr_type" value="0">기본배송지로 설정<br>
							<input class="addr-box" type="text" id="sample6_postcode" name="zip_code" placeholder="우편번호"> 
							<input class="addr-box" class="but3" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input class="addr-box" type="text" id="sample6_address" name="main_addr" placeholder="주소"><br>
							<input class="addr-box" type="text" id="sample6_detailAddress" name="detail_addr" placeholder="상세주소">
							<input class="addr-box" type="text" id="sample6_extraAddress" name="ex_addr" placeholder="참고항목">
						</td>
					</tr>
				</table>
			</div>
			<div class="create">
				<input class="but4" type="submit" value="주소 추가하기">
				<input class="but5" type="button" value="취소" onclick="location.href='home'"> 

			</div>
		</div>
	</form>
</body>
</html>