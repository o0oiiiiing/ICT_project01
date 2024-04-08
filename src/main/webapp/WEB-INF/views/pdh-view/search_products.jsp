<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>products | forest</title>
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 구글 아이콘 -->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />

<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Judson:ital,wght@0,400;0,700;1,400&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Palanquin:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/avenir" rel="stylesheet">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">

<!-- CSS 파일 -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/common-css/font.css">
<link rel="stylesheet" href="resources/pdh-css/products.css">
<link rel="stylesheet" href="resources/pdh-css/scroll-to-top-button.css">
<link rel="stylesheet" href="resources/pdh-css/paging.css">
<script type="text/javascript">

	function before() {
		let form = $('<form>');
		let map = ${map};
		let cpage = ${paging.beginBlock - paging.pagePerBlock};
		let ctag = $('<input>');
		ctag.attr('type', 'hidden');
		ctag.attr('name', "cPage");
		ctag.attr('value', cpage);
		form.append(ctag)
		form.attr('action', 'pay');
		form.attr('method', 'post'); 
		$.each(map, function (k,v) {
			$.each(v, function(index, value) {
	       	let input = $('<input>');
	       	input.attr('type', 'hidden');
	        input.attr('name', k);
	        input.attr('value', value);
	        form.append(input)
			})
		})
		$('body').append(form);
		form.submit();
	}
	function after() {
		let form = $('<form>');
		let map = ${map};
		let cpage = ${paging.beginBlock + paging.pagePerBlock};
		let ctag = $('<input>');
		ctag.attr('type', 'hidden');
		ctag.attr('name', "cPage");
		ctag.attr('value', cpage);
		form.append(ctag)
		form.attr('action', 'pay');
		form.attr('method', 'post'); 
		$.each(map, function (k,v) {
			$.each(v, function(index, value) {
	       	let input = $('<input>');
	       	input.attr('type', 'hidden');
	        input.attr('name', k);
	        input.attr('value', value);
	        form.append(input)
			})
		})
		$('body').append(form);
		form.submit();
	}
	function page() {
		let form = $('<form>');
		let map = ${map};
		let cpage = $(this).attr("name");
		let ctag = $('<input>');
		ctag.attr('type', 'hidden');
		ctag.attr('name', "cPage");
		ctag.attr('value', cpage);
		form.append(ctag)
		form.attr('action', 'pay');
		form.attr('method', 'post'); 
		$.each(map, function (k,v) {
			$.each(v, function(index, value) {
	       	let input = $('<input>');
	       	input.attr('type', 'hidden');
	        input.attr('name', k);
	        input.attr('value', value);
	        form.append(input)
			})
		})
		$('body').append(form);
		form.submit();
	}
</script>
</head>
<body>
	<!-- 메뉴바 -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<!-- 상품 리스트 -->
	<main>
		<c:choose>
			<c:when test="${p_type == 'perfume'}">
				<div class="product-category judson-bold">perfume</div>
			</c:when>
			<c:when test="${p_type == 'hand_body'}">
				<div class="product-category judson-bold">hand&body</div>
			</c:when>
			<c:otherwise>
					<div class="product-category judson-bold">home fragrance</div>
			</c:otherwise>
		</c:choose>
		
		<div class="select-box">
			<select class="select" id="sort-option">
				<option value="alphabetical-order">이름순</option>
				<option value="price-order">가격순</option>
				<option value="popularity-order">인기순</option>
			</select>
		</div>
		
		<ul class="product-wrapper">
			<c:choose>
				<c:when test="${empty products_list}">
					<p>상품이 존재하지 않습니다.</p>
				</c:when>
				<c:when test="${p_type == 'perfume'}">
					<c:forEach var="k" items="${products_list}">
							<li class="product">
								<a class="product-link" href="detailproduct?p_idx=${k.p_idx}">
								<img class="product-thumbnail" src="resources/upload/${k.p_main_img}" alt="${k.p_name}" />
								<div class="product-brand">${k.p_brand}</div>
								<div class="product-information">
									<P>${k.p_name}</P>
									<P>${k.p_volume}ml</P>
									<P><fmt:formatNumber value="${k.p_price}" pattern="#,##0" />₩</P>
								</div>
								</a>
							</li>
						</c:forEach>
				</c:when>
				<c:otherwise>
						<c:forEach var="k" items="${products_list}">
								<li class="product">
									<a class="product-link" href="detailproduct?p_idx=${k.p_idx}">
									<img class="product-thumbnail" src="resources/upload/${k.p_main_img}" alt="${k.p_name}" />
									<div class="product-brand">${k.p_brand}</div>
									<div class="product-information">
										<P>${k.p_name}</P>
										<P><fmt:formatNumber value="${k.p_price}" pattern="#,##0" />₩</P>
									</div>
									</a>
								</li>
						</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
	</main>

	<!-- 페이징 -->
	<ol class="paging">
		<!-- 이전 버튼 -->
		<c:choose>
			<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
				<li class="disable">이전</li>
			</c:when>
			<c:otherwise>
				<li>
					<span class="able" onclick="before()">이전</a>
				</li>
			</c:otherwise>
		</c:choose>

		<!-- 페이지번호들 -->
		<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
			<c:choose>
				<c:when test="${k == paging.nowPage}">
					<li class="now">${k}</li>
				</c:when>
				<c:otherwise>
					<li>
						<span class="other_page" name="${k}" onclick="page()">${k}</span>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 이후 버튼 -->
		<c:choose>
			<c:when test="${paging.endBlock >= paging.totalPage}">
				<li class="disable">다음</li>
			</c:when>
			<c:otherwise>
				<li>
					<span class="able" onclick="after()">다음</span>
				</li>
			</c:otherwise>
		</c:choose>
	</ol>

	<div>
		<button id="scrollToTopButton">
			<span class="material-symbols-outlined">expand_less</span>
		</button>
	</div>
	
	<script type="text/javascript">
		// 누르면 한 번에 위로 올라가는 버튼
		window.onscroll = function() { scrollFunction() };
	
		function scrollFunction() {
			if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
				document.getElementById("scrollToTopButton").style.display = "block";
			} else {
				document.getElementById("scrollToTopButton").style.display = "none";
			}
		}
	
		document.getElementById("scrollToTopButton").addEventListener("click", () => {
			window.scrollTo({
				top: 0,
				left: 0,
				behavior: 'smooth'
			});
		})
	</script>
</body>
</html>