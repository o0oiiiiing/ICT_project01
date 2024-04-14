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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/khj-css/pay.css">

<script type="text/javascript">
// 자신의 주소 가져오기
function sub_addr(user_idx) {
    $.ajax({
        type: "post",
        url: "sub_addr",
        dataType : "json",
        data: "user_idx="+user_idx,
        success: function(data) {
        	$("#addr_res").empty()
			$.each(data, function(idx, k) {
				let p = "<p>";
				p += "<input type='radio' name='radio_btn' class='addrs'>";
				p += "<span>주소지"+(idx+1)+" : "+"</span>";
				p += "<span id='zip'>" + k.zip_code +"</span> ";
				p += "<span id='main'>" + k.main_addr +"</span>";
				if (k.detail_addr != undefined || k.detail_addr != '') {
					p += ", " + "<span id='detail'>"+ k.detail_addr + "</span>"
				}else {
					p += "<span id='detail'></span>"
				}
				if (k.ex_addr != undefined || k.ex_addr != '') {
					p += ", " + "<span id='ex'>"+ k.ex_addr + "</span>"
				}else if (condition) {
					p += "<span id='ex'></span>"
				}
				p += "</span></p>"
				$("#addr_res").append(p)
			})
        },
        error: function() {
            alert("서버 오류");
        }
    });
}

//가져온 주소 선택시 addr창에 적용
$(document).ready(function() {
	$(document).on("change", "input[type=radio]", function() {
		$("#recipient_name").val("${ssuvo.user_name}")
		$("#sample2_postcode").val($(this).parent().find("#zip").text())
		$("#sample2_address").val($(this).parent().find("#main").text())
		$("#sample2_detailAddress").val($(this).parent().find("#detail").text())
		$("#sample2_extraAddress").val($(this).parent().find("#ex").text())
	})
})

function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('#p1_s2_a3 input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
	
function sample_execDaumPostcode() {
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
                document.getElementById("sample_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample_extraAddress").value = '';
            }

            document.getElementById('sample_postcode').value = data.zonecode;
            document.getElementById("sample_address").value = addr;
            document.getElementById("sample_detailAddress").focus();
        }
    }).open();
}
function sample2_execDaumPostcode() {
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
                document.getElementById("sample2_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample2_extraAddress").value = '';
            }

            document.getElementById('sample2_postcode').value = data.zonecode;
            document.getElementById("sample2_address").value = addr;
            document.getElementById("sample2_detailAddress").focus();
        }
    }).open();
}


</script>

</head>
<body>
<div id="page01">
<h2>결제하기</h2>
<form action="" id="form_action" method="post">
<div id="p_main">	
	<section id="p1_s1">
		<article id="p1_s1_a1">
			<h3 style="text-align: center;">주문 상품 정보</h3>
			<div>
			<c:choose>
				<c:when test="${empty pay_list }">
					<h3>결제상품이 없습니다......</h3>
				</c:when>
				<c:otherwise>
					<c:set var = "pt_price_total" value = "0" />
					<c:set var = "pay_ok_count" value = "0" />
					<c:forEach var="k" items="${pay_list }" varStatus="vs">
						<div class="s1a1_d1">
				<div class="s1a1d1_img"><img src="resources/upload/${k.p_main_img}"></div>
				<div id="s1a1d1_pa">
				<input type="hidden" name="p_idx" value="${k.p_idx}">
				<input type="hidden" name="user_idx" value="${k.user_idx}">
				<input type="hidden" name="p_name" value="${k.p_name}">
				<input type="hidden" name="p_type" value="${k.p_type}">
				<input type="hidden" name="p_brand" value="${k.p_brand}">
				<input type="hidden" name="p_volume" value="${k.p_volume}">
				<input type="hidden" name="p_price" value="${k.p_price}">
				<input type="hidden" name="p_count" value="${k.p_count}">
				<input type="hidden" name="p_option" value="${k.p_option}">
				<input type="hidden" name="p_main_img" value="${k.p_main_img}">
					<div id="p_name">${k.p_name}<a></a></div>
					<div id="p_count"  >${k.p_count}<a>개</a></div>
					<div id="pt_price">${k.p_price} * ${k.p_count} 개  = ${k.p_price * k.p_count}<a> KRW(원)</a></div>
					<c:set var= "pt_price_total" value="${pt_price_total + k.p_price * k.p_count}"/>
					<c:set var= "pay_ok_count" value="${vs.count}"/>
				</div>
			</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<%-- <div>총 결제금액 : <c:out value="${pt_price_total}"/> KRW(원) </div> --%>
			<div id="s1a1_d2">
				<a>배송비는 상품마다 3000원씩 포함됩니다.</a>
			</div>
			</div>
		</article>
		<article id="p1_s1_a2">
			<h3 style="text-align: center;">주문자 정보</h3>
				<div id="s1a2d1">
					<ul>
						<li>배송은 하루 걸립니다.</li>
						<li>상품을 받으시면 구매확정 부탁드립니다.</li>
						<li>배송이 완료되고 3일 지나면 자동으로 구매확정이 됩니다.</li>
						<li>포장은 파손이 되지 않게 상품마다 별도 포장되기에 안심하셔도 됩니다.</li>
						<li>개별 포장되어 발송되기에 배송비는 상품마다 포함됩니다.</li>
					</ul>
				</div>
				<fieldset id="orderer">
				<input class="addr-box" id="orderer_name" type="text" placeholder="주문자 이름" value="${uvo.user_name}" required readonly disabled>
				<tr id="addr">
						<td class="userin" id="addr-in">
							<input class="addr-box" type="text" id="sample_postcode" name="zip_code" value="${uvo.zip_code}" placeholder="우편번호" required readonly disabled> 
							<input class="addr-box" type="text" id="sample_address" name="main_addr" value="${uvo.main_addr}" placeholder="주소" required readonly disabled>
							<input class="addr-box" type="text" id="sample_detailAddress" name="detail_addr" value="${uvo.detail_addr}" placeholder="상세주소" required readonly disabled>
							<input class="addr-box" type="text" id="sample_extraAddress" name="ex_addr" value="${uvo.ex_addr}" placeholder="참고항목" required readonly disabled>
						</td>
					</tr>
					</fieldset>

		</article>
		<article id="p1_s1_a3">
			<h3 style="text-align: center;">배송 정보</h3>
			<fieldset id="recipient">
			<a>
			<label for="copy-field">주문자와 동일</label>
			<input type="checkbox" id="copy-field">
			</a>
			<button type="button" onclick="sub_addr(${ssuvo.user_idx})" id="import_addr">배송지 가져오기</button>
			<div id="addr_res"></div>
			<input class="addr-box2" id="recipient_name" type="text" placeholder="수령인 이름"  required>
			
			<tr id="addr2">
						<td class="delivery_in" id="addr-in2">
							<input class="addr-box2" type="text" id="sample2_postcode" name="zip_code" placeholder="우편번호" required> 
							<input class="but2" type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
							<input class="addr-box2" type="text" id="sample2_address" name="main_addr" placeholder="수령인 주소" required><br>
							<input class="addr-box2" type="text" id="sample2_detailAddress" name="detail_addr" placeholder="상세주소" required>
							<input class="addr-box2" type="text" id="sample2_extraAddress" name="ex_addr" placeholder="참고항목">
						</td>
					</tr>
			</fieldset>
		</article>
	</section>
		
	<section id="p1_s2">
		<article id="p1_s2_a1">
			<h3 style="text-align: center;">주문 요약</h3>
			<div id="all_opp">주문상품들 가격: <a><c:out value="${pt_price_total}"/> KRW(원)</a></div>
			<div id="d_charge">배송비: <a>${3000} * ${pay_ok_count} = ${3000 * pay_ok_count } KRW(원)</a></div>
			<hr>
			<div id="t_o_amount">총 결제금액: <a>${pt_price_total + 3000} KRW(원)</a></div>
		</article>
		<article id="p1_s2_a2">
			<h3 style="text-align: center;">결제 수단</h3>
			<a><input type="radio" id="p_pay" name="pay" value="point" checked>포인트</a>
			<a><input type="radio" id="c_pay" name="pay" value="credit_card">신용카드</a>
			<a><input type="radio" id="a_pay" name="pay" value="account_transfer">계좌이체</a>
		</article>
		<article id="p1_s2_a3">
			<div id="s2a3_d1"><input type="checkbox" onclick="selectAll(this)" name="p1_agree" value="all_a">모두 동의</div>
			<a id="s2a3_a1"><input type="checkbox" name="p1_agree" value="info_a">개인정보 수집 및 이용동의</a>
			<a id="terms">약관보기<br></a>
			<a id="s2a3_a3"><input type="checkbox" name="p1_agree" value="pay_a">구매조건 확인 및 결제진행에 동의</a>
			
			<button type="button" id="pay_b1" onclick="pay_ok(this.form)"  >결제하기</button>
			<button id="pay_b1" onclick="cancel()"  >취소</button>
			<input  type="hidden" name="delivery_status" value="1"  >
			<input  type="hidden" name="buy_chk" value="1" >
			<input  type="hidden" name="minus_pay_point" value="${uvo.user_point - pt_price_total + 3000}" >
		</article>
	</section>
</div>	

</form>
</div>
<script type="text/javascript">
var $copyFields = $('#copy-field');

var $ordererField = $('#orderer .addr-box');
var $recipientField = $('#recipient .addr-box2');

$copyFields.change(function () {
	var $this = $(this);
	var checked = $this.prop('checked');

	if (checked) {
		$recipientField.each(function (idx) {
			var $this = $(this);
			var value = $ordererField[idx].value;
			$this.val(value)
			
		});
		$('#recipient input').filter('input:text')
		    	  		.attr('readonly',true)
		     	 		.css('opacity', 0.5);
		$('#orderer input').filter('input:text')
		    	  		.attr('readonly',true)
		     	 		.css('opacity', 0.5);
		
	} else {
		$recipientField.val('');
		$('#recipient input').filter('input:text')
		    	  		.attr('readonly',false)
		     	 		.css('opacity', 1);
		$('#orderer input').filter('input:text')
		    	  		.attr('readonly',false)
		     	 		.css('opacity', 1);
	}

});

$recipientField.change(function () {
	var count = $recipientField.length;
	// console.log(count);

	var same = true;

	// 주문자 정보 필드의 값을 저장할 변수 billingValue, 배송지 정보 필드의 값을 저장할 변수 shippingValue, for 문을 제어할 변수 i 를 선언
	var ordererValue, recipientValue, i;

	for (i = 0; i < count; i++) {
		ordererValue = $ordererField[i].value;
		recipientValue = $recipientField[i].value;
		// console.log(billingValue, shippingValue);

		// 두 값이 비교해서 다르면 same 변수에 false 를 저장
		if (ordererValue != recipientValue) {
			same = false;
			break;
		}

	}

	$copyFields.prop('checked', same);

});

function pay_ok(f) {
	let check = document.querySelector('#s2a3_a1 input');
	let check2 = document.querySelector('#s2a3_a3 input');
	if(!check.checked || !check2.checked){
		alert("체크 덜 됐음. . ");
		 f.preventDefault();
		return;
	}else if (${uvo.user_point < pt_price_total}) {
		alert("포인트가 부족합니다.");
		document.querySelector('#form_action').setAttribute('action', 'mypage');
		document.querySelector('#pay_b1').setAttribute('type', 'submit');
	}else{
		alert("결제가 완료되었습니다.");
		document.querySelector('#form_action').setAttribute('action', 'pay_ok');
		document.querySelector('#pay_b1').setAttribute('type', 'submit');
	}
}
function cancel() {
	location.href = "home";
}

</script>
</body>
</html>