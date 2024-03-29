<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>products | forest</title>
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
<link rel="stylesheet" href="resources/pdh-css/products.css">
<link rel="stylesheet" href="resources/pdh-css/font.css">
<link rel="stylesheet" href="resources/pdh-css/scroll-to-top-button.css">
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
				<span><a href="login" class="icon">Person</a></span>
				<span><a href="mypage" class="icon">house</a></span>
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

	<main>
		<div class="select-box">
			<select class="select">
				<option value="alphabetical-order">이름순</option>
				<option value="price-order">가격순</option>
				<option value="popularity-order">인기순</option>
			</select>
		</div>

		<ul class="product-wrapper">
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/ANOTHER13_15ml.jpg"
				alt="ANOTHER13_15ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>ANOTHER 13</P>
					<P>15ml</P>
					<P>132,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/ANOTHER13_100ml.jpg"
				alt="ANOTHER13_100ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>ANOTHER 13</P>
					<P>100ml</P>
					<P>440,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/ANOTHER13_500ml.jpg"
				alt="ANOTHER13_500ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>ANOTHER 13</P>
					<P>500ml</P>
					<P>1,500,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/LAVANDE31_15ml.jpg"
				alt="LAVANDE31_15ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>LAVANDE 31</P>
					<P>15ml</P>
					<P>132,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/LAVANDE31_100ml.jpg"
				alt="LAVANDE31_100ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>LAVANDE 31</P>
					<P>100ml</P>
					<P>440,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/LAVANDE31_500ml.jpg"
				alt="LAVANDE31_500ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>LAVANDE 31</P>
					<P>500ml</P>
					<P>1,500,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/SANTAL33_15ml.jpg"
				alt="SANTAL33_15ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>SANTAL 33</P>
					<P>15ml</P>
					<P>132,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/SANTAL33_100ml.jpg"
				alt="SANTAL33_100ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>SANTAL 33</P>
					<P>100ml</P>
					<P>440,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/SANTAL33_500ml.jpg"
				alt="SANTAL33_500ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>SANTAL 33</P>
					<P>500ml</P>
					<P>1,500,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/THEMATCHA26_15ml.jpg"
				alt="THEMATCHA26_15ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>THÉ MATCHA 26</P>
					<P>15ml</P>
					<P>132,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/THEMATCHA26_100ml.jpg"
				alt="THEMATCHA26_100ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>THÉ MATCHA 26</P>
					<P>100ml</P>
					<P>440,000₩</P>
				</div></li>
			<li class="product"><img class="product-thumbnail"
				src="resources/pdh-image/LeLabo/THEMATCHA26_500ml.jpg"
				alt="THEMATCHA26_500ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information">
					<P>THÉ MATCHA 26</P>
					<P>500ml</P>
					<P>1,500,000₩</P>
				</div></li>
		</ul>
	</main>

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
	<script type="text/javascript">
		// 메뉴를 클릭하는 경우 하위 카테고리 드롭다운
		// 변수 선언
		let perfume = document.querySelector('.perfume');
		let handBody = document.querySelector('.hand-body');
		let homeFragrance = document.querySelector('.home-fragrance');

		let perfumeNavListOpen = document
				.querySelector('.perfume-nav-list__open');
		let handBodyNavListOpen = document
				.querySelector('.handBody-nav-list__open');
		let homeFragranceNavListOpen = document
				.querySelector('.homeFragrance-nav-list__open');

		let navItem = document.querySelectorAll('.nav__item');
		let overlay = document.querySelector('.overlay');

		// perfume
		// perfume 클릭했을 때
		perfume.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				handBody.classList.remove('clicked');
				homeFragrance.classList.remove('clicked');
				perfumeNavListOpen.style.display = "block";
				handBodyNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "";
				overlay.style.display = "block";
				this.style.borderBottomColor = "#1E1E1E";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 0) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (perfume.classList.contains('clicked')) {
				perfumeNavListOpen.style.display = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
				perfume.classList.remove('clicked');
			}
		});

		// handBody 클릭했을 때
		handBody.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				handBodyNavListOpen.style.display = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				perfume.classList.remove('clicked');
				homeFragrance.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "";
				handBodyNavListOpen.style.display = "block";
				overlay.style.display = "block";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 1) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (handBody.classList.contains('clicked')) {
				handBodyNavListOpen.style.display = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
				handBody.classList.remove('clicked');
			}
		});

		// homeFragrance 클릭했을 때
		homeFragrance.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				homeFragranceNavListOpen.style.display = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				perfume.classList.remove('clicked');
				handBody.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				handBodyNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "block";
				overlay.style.display = "block";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 2) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (homeFragrance.classList.contains('clicked')) {
				homeFragranceNavListOpen.style.display = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
				homeFragrance.classList.remove('clicked');
			}
		});

		// 메뉴 클릭한 상태 - mouseenter
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseenter', function() {
				if (homeFragrance.classList.contains('clicked')) {
					this.style.borderBottomColor = "#1E1E1E";
				}
			});
		}

		// 메뉴 클릭한 상태 - mouseleave
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseleave', function() {
				if (homeFragrance.classList.contains('clicked')) {
					this.style.borderBottomColor = "transparent";
				}
			});
		}
	</script>
</body>
</html>