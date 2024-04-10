<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/common-css/reset.css" rel="stylesheet">
<link href="resources/jjh-css/buy_page.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 서버용 함수 -->
<script type="text/javascript">
	function buy_chk(order_idx) {
		location.href="buy_chk?order_idx="+order_idx
	}
</script>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<section id="first">
		<article id="f_list">
			<c:choose>
				<c:when test="${empty order_list}">
					<h3>
						주문하신 상품이 없습니다.					
					</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${order_list}">
					<form class="c_product">
						<div class="f_imgs">
							<div class="f_img">
								<img src="resources/upload/${k.p_main_img}">
							</div>
						</div>
						<div class="f_option">
							<div>
								<p>Type : ${k.p_type}</p>
								<p>${k.p_name}</p>
								<c:choose>
									<c:when test="${k.p_volume == 'free'}">
									</c:when>
									<c:otherwise>
										<p>${k.p_volume}ml</p>
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<p>가격 : ${k.p_price}, 수량 : ${k.p_count}</p>
								<p>총 금액 : <fmt:formatNumber value="${k.total_price()}" /></p>
							</div>
							<div>
								<c:choose>
									<c:when test="${k.p_option == '1'}">
										<p>
											일반 포장
										</p>
									</c:when>
									<c:otherwise>
										<p>
											선물 포장
										</p>
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<p>배송지 : ${uvo.main_addr}
									<c:choose>
										<c:when test="${!empty k.detail_addr}">, ${k.detail_addr}</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${!empty k.ex_addr}">, ${k.ex_addr}</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
						<div>
							<div>
								<p>주문 일자 : ${k.pay_date.substring(0,10)}</p>
								<c:choose>
									<c:when test="${k.delivery_status == '1'}">
										<p>배송 완료 일자 : ${k.delivery_end.substring(0, 10)}</p>
									</c:when>
								</c:choose>
								<p>
								배송 상태 : 
								<c:choose>
									<c:when test="${k.delivery_status == '0'}">
										<span>
											배송중								
										</span>
									</c:when>
									<c:otherwise>
										<span>
											배송 완료							
										</span>
										<button type="button" onclick="buy_chk(${k.order_idx})">
											구매확정
										</button>
									</c:otherwise>
								</c:choose>
								</p>
							</div>
						</div>
					</form>
			</c:forEach>
				</c:otherwise>
			</c:choose>
		</article>
	</section>
	
	
<script type="text/javascript">
	/* 글자 보이고 가리기 */
	$(".f_option > div:nth-of-type(1) > p:nth-of-type(2)").hover(
			function() {
				$(this).css("whiteSpace", "wrap")
			},
			function() {
				$(this).css("whiteSpace", "nowrap")
			}
	)
	</script>
</body>
</html>