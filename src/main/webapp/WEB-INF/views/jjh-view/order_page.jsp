<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/common-css/reset.css" rel="stylesheet">
<link href="resources/jjh-css/04_01_cart.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 서버용 함수 -->

</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<section id="first">
		<article id="f_list">
			<c:forEach var="k" items="${cart}">
			<form class="c_product">
				<div class="f_imgs">
					<input type="checkbox" name="p_idx" value="${k.p_idx}">
					<div class="f_img">
						<img src="resources/upload/${k.p_main_img}">
						<input type="hidden" name="p_main_img" value="${k.p_main_img}">
					</div>
				</div>
				<div class="f_option">
					<div>
						<p>Type : ${k.p_type}</p>
						<input type="hidden" name="p_type" value="${k.p_type}">
						<input type="hidden" name="p_brand" value="${k.p_brand}">
						<p>${k.p_name}</p>
						<input type="hidden" name="p_name" value="${k.p_name}">
						<c:choose>
							<c:when test="${k.p_volume == 'free'}">
							</c:when>
							<c:otherwise>
								<p>${k.p_volume}ml</p>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="p_volume" value="${k.p_volume}">
					</div>
					<div>
						<span>선물 옵션</span>

					</div>
					<div>
						<span>수량 옵션</span>
		
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${k.p_price}"/></span> KRW</p>
				</div>
			</form>
			</c:forEach>
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