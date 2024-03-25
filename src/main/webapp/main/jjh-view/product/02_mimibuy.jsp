<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/02_01_minibuy.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#body").on("click", function() {
		$("#mini").fadeOut(600);
	});
});
</script>
</head>
<body id="body">
	<section id="mini">
		<article id="fir_art">
			<form action="" id="mini_form">
				<div id="mini_img">
					<img src="../testimg/projtest.png">
				</div>
				<div id="mini_btns">
					<div id="mini_info">
						<p>Soie SignaturePerfume</p>
						<p>100,000 KRW</p>
					</div>
					<div id="p_btn">
						<input type="checkbox" name="present">
						<p>선물 포장</p>
					</div>
					<div id="num_btn">
						<button>⟨</button>
						<p>수량 선택</p>
						<button>⟩</button>
					</div>
				</div>
				<div id="sum_box">
					<p id="sum_price">100,000 KRW</p>
					<p id="sum_icon">X</p>
					<p id="sum_num">2</p>
					<p id="sum">총 상품 금액 : 200,000 KRW</p>
				</div>
				<div id="pick_box">
					<button id="wish">♡</button>
					<button id="pick">장바구니 담기</button>
					<button id="sell_btn">구매하기</button>
				</div>
			</form>
		</article>
	</section>
</body>
</html>