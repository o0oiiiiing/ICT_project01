<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/common-css/header.css">
<link rel="stylesheet" href="resources/pdh-css/font.css">
<script defer src="resources/common-js/header.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").on("click", function() {
		    if ($(this).data("clicked")) {
		        $("#login_page").css("display", "none"); // 다시 초기 상태로 설정
		        $(this).data("clicked", false); // 다시 초기 상태로 설정
		    } else {
		        $(this).data("clicked", true); // 클릭 상태를 true로 변경
		        $("#login_page").css("display", "block"); // 다시 초기 상태로 설정
		    }
		});
	})
</script>
</head>
<body>
	<div class="overlay"></div>
	<header>
		<section class="header-wrapper">
			<div class="title judson-bold">
				<a href="">forest</a>
			</div>

			<ul class="nav__list">
				<li class="nav__item perfume">perfume</li>
				<li class="nav__item hand-body">hand&body</li>
				<li class="nav__item home-fragrance">home fragrance</li>
				<li class="nav__item">about</li>
			</ul>

			<div class="material-symbols-outlined icons">
				<span><a href="search" class="icon">Search</a></span>
				<span><a href="help" class="icon">headset_mic</a></span>
				<span><a href="cart" class="icon">Shopping_Cart</a></span>
				<span><a href="wish" class="icon">Favorite</a></span>
				<span class="icon" id="login_btn">Person</span>
				<span><a href="mypage" class="icon">house</a></span>
				<div id="login_page"><%@ include file="/WEB-INF/views/kch-view/login.jsp" %></div>
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
			<li><a href="products"> <img
					src="resources/pdh-image/brand/LELABO.png" alt="LE LABO" />
					<div class="nav-list__brand-name">LE LABO</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/MaisonMargiela.png"
					alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/Aesop.png" alt="Aesop" />
					<div class="nav-list__brand-name">Aesop</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="location.href='products'">
	</div>
	<div class="handBody-nav-list__open">
		<ul class="handBody-nav-list__category">
			<li><a href="products"> <img
					src="resources/pdh-image/brand/GRANHAND.png" alt="GRANHAND." />
					<div class="nav-list__brand-name">GRANHAND.</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/LELABO.png" alt="LE LABO" />
					<div class="nav-list__brand-name">LE LABO</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/MaisonMargiela.png"
					alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="location.href='products'">
	</div>
	<div class="homeFragrance-nav-list__open">
		<ul class="homeFragrance-nav-list__category">
			<li><a href="products"> <img
					src="resources/pdh-image/brand/LELABO.png" alt="LE LABO" />
					<div class="nav-list__brand-name">LE LABO</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/MaisonMargiela.png"
					alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
			<li><a href="products"> <img
					src="resources/pdh-image/brand/Aesop.png" alt="Aesop" />
					<div class="nav-list__brand-name">Aesop</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="location.href='products'">
	</div>
</body>
</html>