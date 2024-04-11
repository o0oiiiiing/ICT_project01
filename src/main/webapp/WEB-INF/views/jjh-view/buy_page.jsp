<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/common-css/reset.css" rel="stylesheet">
<link href="resources/jjh-css/order_page.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 서버용 함수 -->

</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<section id="first">
		<article id="f_list">
			<c:choose>
				<c:when test="${empty buy_list}">
					<h3>
						구매완료 한 상품이 없습니다.					
					</h3>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${buy_list}">
					<div class="c_product">
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
								<p>배송 완료 일자 : ${k.delivery_end.substring(0, 10)}</p>
								<c:choose>
									<c:when test="${empty k.review_list}">
										<p><button type="button">리뷰 작성하기</button></p>
									</c:when>
									<c:otherwise>
										<p><button type="button">내가 작성한 리뷰 보기</button></p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${empty k.review_list}">
							<form action="review_insert" method="post" enctype="multipart/form-data">
								<label for="user_id">유저명 : </label>
								<input type="text" name="user_id" id="user_id" value="${ssuvo.user_id}" disabled>
								<input type="hidden" name="user_id" value="${ssuvo.user_id}">
								<br>
								<label>평점 : </label>
								<input type="radio" name="score" value="1">1점
								<input type="radio" name="score" value="2">2점
								<input type="radio" name="score" value="3">3점
								<input type="radio" name="score" value="4">4점
								<input type="radio" name="score" value="5">5점
								<br>
								<label>리뷰 이미지 : </label>
								<input type="file" name="review_p_img">
								<br>
								<label>리뷰 제목 : </label>
								<input type="text" name="review_title">
								<br>
								<label>리뷰 내용 : </label>
								<textarea rows="5" cols="30" name="review_content"></textarea>
								<br>
								<input type="hidden" name="p_idx" value="${k.p_idx}">
								<input type="submit" value="리뷰 작성하기">
							</form>
						</c:when>
						<c:otherwise>
							<div class="rev1">
								<p>${k.review_list[0].score}</p>
								<p>${k.review_list[0].review_title}</p>
								<p>${k.review_list[0].regdate}</p>
								<div><img src="resources/review/${k.review_list[0].review_img}"></div>
								<p>${k.review_list[0].review_title}</p>
							</div>
						</c:otherwise>
					</c:choose>
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