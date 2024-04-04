<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Judson:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Palanquin:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/avenir" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/common-css/header.css">
<link rel="stylesheet" href="resources/common-css/font.css">
<script defer src="resources/common-js/header.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 로그인 페이지 버튼
 		$("#login_btn").on("click", function() {
			if ($(this).data("clicked")) {

				$("#login_page").css("display", "none"); 
				$(this).data("clicked", false); 
			} else {
				$(this).data("clicked", true);
				$("#login_page").css("display", "block");
			}
		});

		// 검색창 활성화
		$("#search_btn").click(function() {
			$("#search-page").css("backgroundColor", "#F5F5F5");
			$("#search-page").css("display", "block");
		})
		$("#s-close").click(function() {
			$("#search-page").css("backgroundColor", "none");
			$("#search-page").css("display", "none");
		})
		
	});
</script>
<script type="text/javascript">
	function products_list_perfume() {
		location.href = "products_list?p_type=perfume";
	}
	
	function products_list_handBody() {
		location.href = "products_list?p_type=hand_body";
	}
	
	function products_list_homeFragrance() {
		location.href = "products_list?p_type=home_fragrance";
	}
</script>
</head>
<body>
	<div id="search-page">
		<%@ include file="/WEB-INF/views/common/search.jsp"%>
	</div>
	<div class="overlay"></div>
	<header>
		<section class="header-wrapper">
			<div class="title judson-bold">
				<a href="home" class="a_tag">forest</a>
			</div>

			<ul class="nav__list">
				<li class="nav__item perfume">perfume</li>
				<li class="nav__item hand-body">hand&body</li>
				<li class="nav__item home-fragrance">home fragrance</li>
				<li class="nav__item">about</li>
			</ul>

			<div class="material-symbols-outlined icons">
				<span><a class="icon a_tag" id="search_btn">Search</a></span>
				<span><a href="faq" class="icon a_tag">headset_mic</a></span>
				<span id="cart_ajax"><a href="cart" class="icon a_tag">Shopping_Cart</a>(${cart.size()})</span>
				<span><a href="wish" class="icon a_tag">Favorite</a></span>
				<span id="login_btn">
					<c:choose>
						<c:when test="${ssuvo.login == 'true'}">
							<a class="icon a_tag">Person
							<span style="font-size: 12px;">${ssuvo.user_id}님 환영합니다.</span>
							</a>
						</c:when>
						<c:otherwise>
							<a class="icon a_tag">Person
							<span style="font-size: 12px;">로그인/회원가입</span>
							</a>
						</c:otherwise>
					</c:choose>
				</span>
				<div id="login_page">
					<c:choose>
						<c:when test="${ssuvo.login == 'true'}">
							<%@ include file="/WEB-INF/views/common/logout.jsp" %>
						</c:when>
						<c:otherwise>
							<%@ include file="/WEB-INF/views/common/login.jsp" %>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</section>
		<hr class="line">
	</header>

	<div class="perfume-nav-list__open">
		<ul class="perfume-nav-list__category">
			<li><a href="products"> <img
					src="resources/pdh-image/brand/GRANHAND.png" alt="GRANHAND." />
					<div class="nav-list__brand-name">GRANHAND.</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/LELABO.png" alt="LE LABO" />
					<div class="nav-list__brand-name">LE LABO</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/MaisonMargiela.png"
					alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/Aesop.png" alt="Aesop" />
					<div class="nav-list__brand-name">Aesop</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="products_list_perfume()">
	</div>
	<div class="handBody-nav-list__open">
		<ul class="handBody-nav-list__category">
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/LELABO.png" alt="LE LABO" />
					<div class="nav-list__brand-name">LE LABO</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/Aesop.png" alt="Aesop" />
					<div class="nav-list__brand-name">Aesop</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="products_list_handBody()">
	</div>
	<div class="homeFragrance-nav-list__open">
		<ul class="homeFragrance-nav-list__category">
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/GRANHAND.png" alt="GRANHAND." />
					<div class="nav-list__brand-name">GRANHAND.</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/MaisonMargiela.png"
					alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
			<li><a href="products" class="a_tag"> <img
					src="resources/pdh-image/brand/Aesop.png" alt="Aesop" />
					<div class="nav-list__brand-name">Aesop</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="products_list_homeFragrance()">
	</div>
</body>
</html>