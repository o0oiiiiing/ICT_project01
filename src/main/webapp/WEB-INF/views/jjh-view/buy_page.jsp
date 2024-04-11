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
<script type="text/javascript">
$(document).ready(function() {
	$(".re_insert_btn").click(function() {
		$(this).parent().parent().parent().next().toggle()
	});
	$(".re_chk_btn").click(function() {
		$(this).parent().parent().parent().next().toggle()
	});

});
function mypage() {
	location.href="mypage"
}
function buy_list(){
	location.href="buy_list"
}
function product_write(){
	location.href="product_write"
}
function order(){
	location.href="order"
}
// 미구현
function sell_list(){
	location.href="sell_list"
}

$(document).ready(function() {
	$(".menu_btn").hover(
	    function() {
	    	$(this).css("color", "#878787");
	        
	    },
	    function() {
	    	$(this).css("color", "#1E1E1E");
	    }
	);
})
</script>

</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<section id="first">
		<article id="f_menu">
			<button class="menu_btn" onclick="mypage()">마이페이지</button>
			<button class="menu_btn" onclick="order()">주문리스트</button>
			<button class="menu_btn" onclick="buy_list()">구매리스트</button>
			<c:choose>
				<c:when test="${ssuvo.user_type==0}">
					<button class="menu_btn" onclick="sell_list()">판매중인 상품</button>
					<button class="menu_btn" onclick="product_write()">상품 등록</button>
				</c:when>
			</c:choose>
		</article>
		<article id="f_list">
			<c:choose>
				<c:when test="${empty buy_list}">
					<p class="buy-empty">
						구매 완료된 상품이 없습니다.					
					</p>
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
							<div class="line-height">
								<p>${k.p_type}</p>
								<p>${k.p_name}</p>
								<c:choose>
									<c:when test="${k.p_volume == 'free'}">
									</c:when>
									<c:otherwise>
										<p class="product-volume">${k.p_volume}ml</p>
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<p>가격 : <fmt:formatNumber value="${k.p_price}" pattern="#,##0" />₩</p>
								<p>수량 : ${k.p_count}</p>
								<p>총 금액 : <fmt:formatNumber value="${k.total_price()}" pattern="#,##0" />₩</p>
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
						</div>
						<div>
							<p>배송 완료일 : ${k.delivery_end.substring(0, 10)}</p>
							<div>
								<p>배송지 : ${k.main_addr}
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
							<c:choose>
								<c:when test="${empty k.review_list}">
									<p><button type="button" class="re_insert_btn">리뷰 작성하기</button></p>
								</c:when>
								<c:otherwise>
									<p><button type="button" class="re_chk_btn">작성한 리뷰 보기</button></p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<c:choose>
						<c:when test="${empty k.review_list}">
							<form action="review_insert" method="post" enctype="multipart/form-data" class="re_insert" style="display: none;">
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
								<input type="hidden" name="order_idx" value="${k.order_idx}">
								<input type="submit" value="리뷰 작성하기">
							</form>
						</c:when>
						<c:otherwise>
							<div class="re_chk" style="display: none;">
								<c:choose>
									<c:when test="${k.review_list[0].review_img == ''}">
										<div>리뷰에 존재하는 이미지가 없습니다.</div>
									</c:when>
									<c:otherwise>
										<div><img src="resources/review/${k.review_list[0].review_img}"></div>										
									</c:otherwise>
								</c:choose>
								<div>
									<p>평점 : ${k.review_list[0].score}점</p>
									<p>작성일 : ${k.review_list[0].regdate.substring(0, 10)}</p>
									<p>제목 : ${k.review_list[0].review_title}</p>
									<p>내용 : ${k.review_list[0].review_content}</p>
								</div>
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