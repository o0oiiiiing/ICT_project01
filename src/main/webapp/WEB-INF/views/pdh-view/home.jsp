<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>forest</title>
<!-- JQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 구글 아이콘 -->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Judson:ital,wght@0,400;0,700;1,400&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Palanquin:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/avenir" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- CSS 파일 -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/pdh-css/home.css">
<link rel="stylesheet" href="resources/pdh-css/font.css">
<script type="text/javascript">
	// 배경 이미지 변경 스크립트
	window.onload = function() {
	    var images = ['background_01.jpg', 'background_02.jpg', 'background_03.jpg']; // 변경할 배경 이미지들의 파일명
	    var index = 0;
	    
	    function changeBackgroundImage() {
	        var url = 'url("resources/pdh-image/' + images[index] + '")';
	        document.documentElement.style.backgroundImage = url;
	        index = (index + 1) % images.length; // 다음 이미지 인덱스 계산
	    }

	    changeBackgroundImage(); // 페이지 로드 시 초기 배경 이미지 설정

	    // 5초마다 배경 이미지 변경
	    setInterval(changeBackgroundImage, 4000);
	};
</script>
<!-- <style type="text/css">
	#login_btn{
		position: relative;
	}
	#login_page{
		display : none;
		position: absolute;
		top:0px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$("#login_btn").click(function() {
			$("#login_page").fadeIn(500, function() {
				$("#login_page").css("display", "block")
			})
		})
	})
</script> -->
</head>
<body>
	<header>
		<h1 class="title judson-bold"><a href="/">forest</a></h1>
		
		<div class="material-symbols-outlined icons">
			<span><a href="search" class="icon">Search</a></span>
			<span><a href="help" class="icon">headset_mic</a></span>
			<span><a href="cart" class="icon">Shopping_Cart</a></span>
			<span><a href="wish" class="icon">Favorite</a></span>
			<span class="icon">Person</span>
			<span><a href="mypage" class="icon">Person</a></span>
		</div>
		
		<hr class="line">

		<ul class="nav__list">
			<li class="nav__item perfume"><a href="products">perfume</a></li>
			<li class="nav__item hand-body"><a href="products">hand&body</a></li>
			<li class="nav__item home-fragrance"><a href="products">home fragrance</a></li>
			<li class="nav__item"><a href="help">about</a></li>
		</ul>
	</header>
	
	<div class="nav-list__open">
		<ul class="nav-list__category">
			<li> 
				<a href="products">
					<img src="resources/pdh-image/brand/GRANHAND.png" alt="GRANHAND." />
					<div class="nav-list__brand-name">GRANHAND.</div>
				</a>
			</li>
			<li>
				<a href="products">
					<img src="resources/pdh-image/brand/LELABO.png" alt="LE LABO" />
					<div class="nav-list__brand-name">LE LABO</div>
				</a>
			</li>
			<li>
				<a href="products">
					<img src="resources/pdh-image/brand/MaisonMargiela.png" alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
				</a>
			</li>
			<li>
				<a href="products">
					<img src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
				</a>
			</li>
			<li>
				<a href="products">
					<img src="resources/pdh-image/brand/Aesop.png" alt="Aesop" />
					<div class="nav-list__brand-name">Aesop</div>
				</a>
			</li>
		</ul>
	</div>

	<div class="middle-title judson-bold">scent</div>

	<section class="best-seller">
		<div class="best-seller__inner">
			<h2 class="best-seller__title judson-bold">best seller</h2>
			<ul class="best-seller__list">
				<li class="best-seller__item">
					<a href="detailproduct">
						<img class="best-seller__thumbnail" src="resources/pdh-image/LeLabo/ANOTHER13_15ml.jpg" alt="ANOTHER13_15ml" />
						<div class="best-seller__brand">LE LABO</div>
						<div class="best-seller__information"><P>ANOTHER 13</P><P>15ml</P><P>132,000₩</P></div>
					</a>
				</li>
				<li class="best-seller__item">
					<a href="detailproduct">
						<img class="best-seller__thumbnail" src="resources/pdh-image/LeLabo/LAVANDE31_100ml.jpg" alt="LAVANDE31_100ml" />
						<div class="best-seller__brand">LE LABO</div>
						<div class="best-seller__information"><P>LAVANDE 31</P><P>100ml</P><P>440,000₩</P></div>
					</a>
				</li>
				<li class="best-seller__item">
					<a href="detailproduct">
						<img class="best-seller__thumbnail" src="resources/pdh-image/LeLabo/SANTAL33_500ml.jpg" alt="SANTAL33_500ml" />
						<div class="best-seller__brand">LE LABO</div>
						<div class="best-seller__information"><P>SANTAL 33</P><P>500ml</P><P>1,500,000₩</P></div>
					</a>
				</li>
				<li class="best-seller__item">
					<a href="detailproduct">
						<img class="best-seller__thumbnail" src="resources/pdh-image/LeLabo/THEMATCHA26_500ml.jpg" alt="THEMATCHA26_500ml" />
						<div class="best-seller__brand">LE LABO</div>
						<div class="best-seller__information"><P>THÉ MATCHA 26</P><P>500ml</P><P>1,500,000₩</P></div>
					</a>
				</li>
				<li class="best-seller__item">
					<a href="detailproduct">
						<img class="best-seller__thumbnail" src="resources/pdh-image/LeLabo/LAVANDE31_15ml.jpg" alt="LAVANDE31_15ml" />
						<div class="best-seller__brand">LE LABO</div>
						<div class="best-seller__information"><P>LAVANDE 31</P><P>15ml</P><P>132,000₩</P></div>
					</a>
				</li>
			</ul>
		</div>
	</section>
	
	<script type="text/javascript">
		// 메뉴에 mouseenter 하는 경우 하위 카테고리 드롭다운
		// 변수 선언
		let perfume = document.querySelector('.perfume');
		let handBody = document.querySelector('.hand-body');
		let homeFragrance = document.querySelector('.home-fragrance');
		let navListOpen = document.querySelector('.nav-list__open');
		let middleTitle = document.querySelector('.middle-title');
		
		// perfume
		perfume.addEventListener('mouseenter', function() {
			navListOpen.style.display = "block";
		    titleMiddle.style.display = "none";
		});

		navListOpen.addEventListener('mouseleave', function() {
			navListOpen.style.display = "none";
			titleMiddle.style.display = "block";
		});
		
		perfume.addEventListener('mouseleave', function() {
			perfume.style.borderBottomColor = "transparent";
		});
	</script>
</body>
</html>