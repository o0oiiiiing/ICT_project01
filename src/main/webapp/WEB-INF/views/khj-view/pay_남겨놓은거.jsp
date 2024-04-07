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
<link rel="stylesheet" href="resources/khj-css/pay.css">

<script type="text/javascript">

function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>
</head>
<body>
<div id="page01">
<h2>결제하기</h2>
<form action="">
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
				<div class="s1a1d1_img"><img src="resources/jjh-image/projtest.png"></div>
				<div id="s1a1d1_pa">
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
				<input id="orderer_name" type="text" placeholder="주문자 이름"  required>
				<input id="orderer_addr" type="text" placeholder="주문자 주소"  required>
				<%--  <input  id="orderer_phone" type="text" oninput="oninput_op(this)" maxlength="14" placeholder="주문자 연락처"  required>
				<input id="orderer_email" placeholder="주문자 이메일"  required> --%>
		</article>
		<article id="p1_s1_a3">
			<h3 style="text-align: center;">배송 정보</h3>
			<button id="op_same_b1">주문자 정보와 동일</button>
			<button id="import_addr">배송지 가져오기</button>
			<input id="recipient_name" placeholder="수령인" readonly required>
			<input id="recipient_addr" placeholder="수령인 주소" readonly required>
			
		</article>
	</section>
		
	<section id="p1_s2">
		<article id="p1_s2_a1">
			<h3 style="text-align: center;">주문 요약</h3>
			<div id="all_opp">주문상품들 가격: <a><c:out value="${pt_price_total}"/> KRW(원)</a></div>
			<div id="d_charge">배송비: <a>${3000} * ${pay_ok_count} = ${3000 * pay_ok_count } KRW(원)</a></div>
			<hr>
			<div id="t_o_amount">총 결제금액: <a>${pt_price_total + 3000 * pay_ok_count } KRW(원)</a></div>
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
			<button id="pay_b1" type="submit">결제하기</button>
		</article>
	</section>
</div>	
</form>
</div>
</body>
</html>