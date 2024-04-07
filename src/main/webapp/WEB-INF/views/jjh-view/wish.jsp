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
<script type="text/javascript">

// cart 추가 ajax
$(document).ready(function() {
	$(".cart").click(function name() {
		let p_idx = $(this).attr("name");
		let tag = this;
		console.log(p_idx);
		if ($(this).val()=="0") {
			$.ajax({
				url : "cartAjax",
				method : "post",
				dataType : "text",
				data : "p_idx="+p_idx,
				success : function(data) {
					$(tag).val("1");
					$(tag).text("장바구니 제거");
					$("#cart_ajax").text("("+data+")");
					alert("장바구니에 추가했습니다.");
				},
				error: function() {
					alert("읽기 실패")
				}
			})
		}else if ($(this).val()=="1") {
			$.ajax({
				url : "cartDelAjax",
				method : "post",
				dataType : "text",
				data : "p_idx="+p_idx,
				success : function(data) {
					$(tag).val("0");
					$(tag).text("장바구니 추가");
					$("#cart_ajax").text("("+data+")");
					alert("장바구니에서 제거했습니다.");
				},
				error: function() {
					alert("읽기 실패");
				}
			})
		}
	})
	
	$(".wish").click(function() {
		let p_idx = $(this).attr("name");
		$.ajax({
			url : "wishDelAjax",
			method : "post",
			dataType : "text",
			data : "p_idx="+p_idx,
			success : function(data) {
				alert("위시리스트에서 제거했습니다.");
			},
			error: function() {
				alert("읽기 실패")
			}
		});
		$(this).parent().parent().parent().remove();
	})
})

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id="wishlist">
	<article id="lists">
		<c:forEach var="k" items="${list_wvo}">
		<div class="wishitems">
			<div class="wish_img">
				<img src="resources/upload/${k.p_main_img}">
			</div>
			<div class="wish_sub_title">
				<p>${k.p_name}</p>
				<p>${k.p_brand}</p>
			</div>
			<div class="wish_hide">
				<p>${k.p_volume}ml</p>
				<p>${k.p_price} KRW</p>
				<div class="wish_move_btn">
					<button class="material-symbols-outlined wish" name="${k.p_idx}"
					style="font-variation-settings: '"FILL" 1, "GRAD" 0, "opsz" 24, "wght" 400'">
					favorite</button>
					<c:choose>
						<c:when test="${k.cart_status == 1}">
							<button class="cart" name="${k.p_idx}" value="1">장바구니에서 제거</button>
						</c:when>
						<c:otherwise>
							<button class="cart" name="${k.p_idx}" value="0">장바구니에 추가</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		</c:forEach>
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