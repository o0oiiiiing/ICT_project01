<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/04_01_buylist.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="test1" value="100000"/>
	<c:set var="test2" value="200000"/>
	<c:set var="test3" value="300000"/>
	<section id="first">
		<div id="buymenu">
			<div>
				<input type="checkbox" id="all_chack">
				<p>상품 전체선택</p>
			</div>
			<p>상품명 및 옵션</p>
			<p>가격</p>
		</div>
		<article id="f_list">
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img">
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test1}</span>
						<select name="su" class="su_ck" >
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test1}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img" z>
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test2}</span>
						<select name="su" class="su_ck">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test2}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img">
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test3}</span>
						<select name="su" class="su_ck">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test3}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img">
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test3}</span>
						<select name="su" class="su_ck">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test3}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img">
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test3}</span>
						<select name="su" class="su_ck">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test3}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img">
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test3}</span>
						<select name="su" class="su_ck">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test3}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img">
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test3}</span>
						<select name="su" class="su_ck">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test3}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img">
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test3}</span>
						<select name="su" class="su_ck">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test3}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
			<div class="f_items">
				<input type="checkbox">
				<div class="f_img">
					<img src="../testimg/projtest.png">
				</div>
				<div class="f_option">
					<p>Soie SignaturePerfume</p>
					<div>
						<p>선물 옵션 선택</p>
						<select name="present" class="present_ck">
							<option value="0">선택해주세요</option>
							<option value="1">선물용 포장</option>
							<option value="2">일반 포장</option>
						</select>
					</div>
					<div>
						<p>수량 선택</p>
						<span style="display: none;">${test3}</span>
						<select name="su" class="su_ck">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
						</select>
					</div>
				</div>
				<div>
					<p><span><fmt:formatNumber value="${test3}"/></span> KRW</p>
				</div>
				<button>장바구니 제외</button>
			</div>
		</article>
		<article id="f_sum">
			<div>
				<p><span>0</span> KRW + 3,000 KRW = <span>0</span> KRW</p>
				<hr>
				<input type="button" value="구매하기">
			</div>
		</article>
	</section>
	
	
	<script type="text/javascript">
	/* 총계산 함수 */
	function sum() {
		let res = 0;
		$(".f_items").find("input:checked").each(function() {
			let k = $(this).next().next().find("div:nth-of-type(2)").find(".su_ck")
			let su = k.find("option:selected").val();
			res = parseInt(k.prev().text()*su) + res;
		})
		
		$("#f_sum span:nth-of-type(1)").text(res.toLocaleString("ko-KR"))
		$("#f_sum span:nth-of-type(2)").text((res+3000).toLocaleString("ko-KR"))
	}
	
	/* 전체 선택 및 헤제, 총계산 함수 실행 */
	$("#all_chack").change(function() {
	    if ($(this).prop("checked")) {
	        $(".f_items > input").prop("checked", true);
	    } else {
	        $(".f_items > input").prop("checked", false);
	    }
	    sum();
	});
	
	/* 수량 옵션 이벤트 */
	$(".su_ck").change(function() {
		let k = $(this).find("option:selected").val();
		$(this).parent().parent().next().find("p").find("span").text(($(this).prev().text()*k).toLocaleString("ko-KR"))
	})
	
	/* 단일 선택 시 총계산 함수 실행*/
	$(".f_items > input").change(function() {
		sum();
	})
	
	/* 장바구니 제거 */
	$(".f_items button").click(function() {
		$(this).parent().remove();
	})
	$(".f_items button").hover(
			    function() {
			        $(this).css("backgroundColor", "#bfbfbf");
			    },
			    function() {
			        $(this).css("backgroundColor", "transparent");
			    }
			);
	
	/* 글자 보이고 가리기 */
	$(".f_option > p:nth-of-type(1)").hover(
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