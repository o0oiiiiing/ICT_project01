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
<script type="text/javascript">
	$(document).ready(function() {
		$("#pay").click(function() {
			if (${ssuvo.login != "true"}) {
				alert("로그인 후 이용해주세요.")
				return
			}else {
				var form = $('<form>');
				form.attr('action', 'pay'); // 폼의 action을 설정합니다.
				form.attr('method', 'post'); 
				$(".f_imgs").find("input:checked").each(function () {
					let test = $(this).parent().parent().find("select, input");
					form.append(test);
				})
				$('body').append(form);
				form.submit();
			}
		})
	})
</script>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<c:set var="test1" value="100000"/>
	<c:set var="test2" value="200000"/>
	<c:set var="test3" value="300000"/>
	<section id="first">
		<div id="buymenu">
			<div>
				<input type="checkbox" id="all_chack">
				<p>상품 전체선택</p>
				<button id="rm_btn">선택 삭제</button>
			</div>
			<p>상품명 및 옵션</p>
			<p>가격</p>
		</div>
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
						<select name="p_option" class="present_ck">
							<option value="1">일반 포장</option>
							<option value="2">선물용 포장</option>
						</select>
					</div>
					<div>
						<span>수량 옵션</span>
						<input type="hidden" name="p_price" value="${k.p_price}">
						<select name="p_count" class="su_ck" >
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${k.p_price}"/></span> KRW</p>
				</div>
			</form>
			</c:forEach>
		</article>
		<article id="f_sum">
			<div>
				<p><span>0</span> KRW + 3,000 KRW = <span>0</span> KRW</p>
				<hr>
				<input type="button" id="pay" value="구매하기">
			</div>
		</article>
	</section>
	
	
<script type="text/javascript">
	/* 총계산 함수 */
	function sum() {
		let res = 0;
		$(".f_imgs").find("input:checked").each(function() {
			let k = $(this).parent().next().find("div:nth-of-type(3)").find(".su_ck")
			let su = k.find("option:selected").val();
			res = parseInt(k.prev().val()*su) + res;
		})
		
		$("#f_sum span:nth-of-type(1)").text(res.toLocaleString("ko-KR"))
		$("#f_sum span:nth-of-type(2)").text((res+3000).toLocaleString("ko-KR"))
	}
	/* 수량 옵션 이벤트 */
	$(".su_ck").change(function() {
		let k = $(this).find("option:selected").val();
		$(this).parent().parent().next().find("p").find("span").text(($(this).prev().val()*k).toLocaleString("ko-KR"))
		sum();
	})
	
	/* 전체 선택 및 헤제, 총계산 함수 실행 */
	$("#all_chack").change(function() {
	    if ($(this).prop("checked")) {
	        $(".f_imgs > input").prop("checked", true);
	    } else {
	        $(".f_imgs > input").prop("checked", false);
	    }
	    sum();
	});
	/* 단일 선택 시 총계산 함수 실행*/
	$(".f_imgs > input").change(function() {
		sum();
	})
	
	/* 글자 보이고 가리기 */
	$(".f_option > div:nth-of-type(1) > p:nth-of-type(2)").hover(
			function() {
				$(this).css("whiteSpace", "wrap")
			},
			function() {
				$(this).css("whiteSpace", "nowrap")
			}
	)
		
	/* 선택 삭제 이벤트 */
	$("#rm_btn").click(function() {
		$(".f_imgs").find("input:checked").each(function() {
			let tag = this;
			let p_idx = $(this).val();
			$.ajax({
				url : "cartDelAjax",
				method : "post",
				dataType : "text",
				data : "p_idx="+p_idx,
				async : false,
				success : function(data) {
					$(tag).parent().parent().remove();
					$("#cart_ajax").text("("+data+")");
				},
				error: function() {
					alert("읽기 실패");
				}
			})
		})
		sum();
	})
	</script>
</body>
</html>