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
<link rel="stylesheet" href="resources/khj-css/customer_center.css">
<script type="text/javascript">

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div id="t_menu">
		<a>자주하는 질문</a>
	</div>
<div id="frame">
<section id="ccenter">
	<article id="sel">
		<div id="s_menu">
			<a href="qna">QnA</a>
			<a href="faq">FaQ</a>
			<a href="claim">Claim</a>
		</div>
		
	</article>
	
	<article id="main">
	<div>
		<div class="m_div">
			<div class="m_num">1</div>
			<div class="m_type">배송</div>
			<div class="m_content">배송기간은 얼마나 걸리나요?</div>
		</div>
		<div class="m_reply">
			<p>배송은 2~5일 정도 소요되며 택배사의 상황에 따라 지연될수 있습니다.</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">2</div>
			<div class="m_type">배송</div>
			<div class="m_content">온라인으로 주문 후 매장 픽업 가능한가요?</div>
		</div>
		<div class="m_reply">
			<p>온라인으로 주문하신 제품은 매장에서 수령하실 수 없습니다.</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">3</div>
			<div class="m_type">배송</div>
			<div class="m_content">배송조회는 어떻게 할 수 있나요?</div>
		</div>
		<div class="m_reply">
			<p>마이페이지 배송조회에서 확인하실 수 있습니다.</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">4</div>
			<div class="m_type">주문</div>
			<div class="m_content">교환 및 환불 규정은 어떻게 되나요?</div>
		</div>
		<div class="m_reply">
			<p>매장 구매 혹은 택배 수령일로부터 7일 이내에 반품 접수를 해주시면 가능합니다.</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">5</div>
			<div class="m_type">기타</div>
			<div class="m_content">매장에 주차를 할 수 있나요?</div>
		</div>
		<div class="m_reply">
			<p>유료 주차장 이용가능 합니다.</p>
		</div>
	</div>
	<div>
	<div>
		<div class="m_div">
			<div class="m_num">6</div>
			<div class="m_type">주문</div>
			<div class="m_content">주문을 취소/수정하고 싶어요</div>
		</div>
		<div class="m_reply">
			<p>주문취소 및 수정은 배송 준비 전 단계에서 가능합니다.</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">7</div>
			<div class="m_type">상품</div>
			<div class="m_content">선물 포장이 가능한가요?</div>
		</div>
		<div class="m_reply">
			<p>선물포장 옵션을 선택하실 수 있습니다.</p>
		</div>
	</div>
		<div class="m_div">
			<div class="m_num">8</div>
			<div class="m_type">상품</div>
			<div class="m_content">향수에 에탄올이 함유 되어 있나요?</div>
		</div>
		<div class="m_reply">
			<p>향수는 베이스에 에탄올이 함유 되어 있습니다.</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">9</div>
			<div class="m_type">상품</div>
			<div class="m_content">임신중에 제품 사용 가능한가요?</div>
		</div>
		<div class="m_reply">
			<p>향과 제품에 따라 사용이 가능한 제품도 있으나 임신 중에는 <br>
			호르몬 변화가 활발하게 일어나는 시기이기 때문에 전문가와 상담하는 것을 권해드립니다.</p>
		</div>
	</div>
	
		
	</article>

</section>
</div>	
<script type="text/javascript">
	$(".m_div").click(function() {
				$(this).next().toggle();
	})
</script>
</body>
</html>