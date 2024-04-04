<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- css -->
<link href="resources/common-css/reset.css" rel="stylesheet">
<link href="resources/jjh-css/05_01_wish.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id="wishlist">
	<article id="lists">
		<div class="wishitems">
			<div class="wish_img">
				<img src="resources/jjh-image/projtest.png">
			</div>
			<div class="wish_sub_title">
				<p>Soie SignaturePerfume Soie SignaturePerfume</p>
				<p>LE LABO</p>
			</div>
			<div class="wish_hide">
				<p>500ml</p>
				<p>100,000 KRW</p>
				<div class="wish_move_btn">
					<button class="material-symbols-outlined">favorite</button>
					<button>장바구니에 추가</button>
				</div>
			</div>
		</div>
		<div class="wishitems">
			<div class="wish_img">
				<img src="resources/jjh-image/projtest.png">
			</div>
			<div class="wish_sub_title">
				<p>Soie SignaturePerfume Soie SignaturePerfume</p>
				<p>LE LABO</p>
			</div>
			<div class="wish_hide">
				<p>500ml</p>
				<p>100,000 KRW</p>
				<div class="wish_move_btn">
					<button class="material-symbols-outlined">favorite</button>
					<button>장바구니에 추가</button>
				</div>
			</div>
		</div>
		<div class="wishitems">
			<div class="wish_img">
				<img src="resources/jjh-image/projtest.png">
			</div>
			<div class="wish_sub_title">
				<p>Soie SignaturePerfume Soie SignaturePerfume</p>
				<p>LE LABO</p>
			</div>
			<div class="wish_hide">
				<p>500ml</p>
				<p>100,000 KRW</p>
				<div class="wish_move_btn">
					<button class="material-symbols-outlined">favorite</button>
					<button>장바구니에 추가</button>
				</div>
			</div>
		</div>
		<div class="wishitems">
			<div class="wish_img">
				<img src="resources/jjh-image/projtest.png">
			</div>
			<div class="wish_sub_title">
				<p>Soie SignaturePerfume Soie SignaturePerfume</p>
				<p>LE LABO</p>
			</div>
			<div class="wish_hide">
				<p>500ml</p>
				<p>100,000 KRW</p>
				<div class="wish_move_btn">
					<button class="material-symbols-outlined">favorite</button>
					<button>장바구니에 추가</button>
				</div>
			</div>
		</div>
		<div class="wishitems">
			<div class="wish_img">
				<img src="resources/jjh-image/projtest.png">
			</div>
			<div class="wish_sub_title">
				<p>Soie SignaturePerfume Soie SignaturePerfume</p>
				<p>LE LABO</p>
			</div>
			<div class="wish_hide">
				<p>500ml</p>
				<p>100,000 KRW</p>
				<div class="wish_move_btn">
					<button class="material-symbols-outlined">favorite</button>
					<button>장바구니에 추가</button>
				</div>
			</div>
		</div>
		<div class="wishitems">
			<div class="wish_img">
				<img src="resources/jjh-image/projtest.png">
			</div>
			<div class="wish_sub_title">
				<p>Soie SignaturePerfume Soie SignaturePerfume</p>
				<p>LE LABO</p>
			</div>
			<div class="wish_hide">
				<p>500ml</p>
				<p>100,000 KRW</p>
				<div class="wish_move_btn">
					<button class="material-symbols-outlined">favorite</button>
					<button>장바구니에 추가</button>
				</div>
			</div>
		</div>
		<div class="wishitems">
			<div class="wish_img">
				<img src="resources/jjh-image/projtest.png">
			</div>
			<div class="wish_sub_title">
				<p>Soie SignaturePerfume Soie SignaturePerfume</p>
				<p>LE LABO</p>
			</div>
			<div class="wish_hide">
				<p>500ml</p>
				<p>100,000 KRW</p>
				<div class="wish_move_btn">
					<button class="material-symbols-outlined">favorite</button>
					<button>장바구니에 추가</button>
				</div>
			</div>
		</div>
	</article>
</section>
<script type="text/javascript">
	/* 장바구니 버튼 보이는 애니메이션 효과 */
 	$(".wishitems").hover(
	    function() {
	        $(this).find(".wish_hide").slideDown(300, function() {
	        	$(this).find(".wish_hide").css("display", "block")
			});
	    },
	    function() {
	        $(this).find(".wish_hide").stop(true, true).slideUp(600, function() {
	        	$(this).find(".wish_hide").css("display", "none")
			});
	    }
	);
	/* 글자 생략 보이기 */
	$(".wish_sub_title > p:nth-of-type(1)").hover(
			function() {
				$(this).css("whiteSpace", "wrap")
			},
			function() {
				$(this).css("whiteSpace", "nowrap")
			}
	);
	
	/* 위시리스트 삭제 */
	$(".wish_move_btn button:nth-of-type(1)").click(function() {
		$(this).parent().parent().parent().remove();
	});
	$(".wish_move_btn button:nth-of-type(2)").hover(
		function() {
			$(this).css("backgroundColor", "gray");
		},
		function() {
			$(this).css("backgroundColor", "#bfbfbf");
		}
	);
</script>
</body>
</html>