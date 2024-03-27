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
<link href="https://fonts.googleapis.com/css2?family=Judson:ital,wght@0,400;0,700;1,400&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Palanquin:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/avenir" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- CSS 파일 -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/pdh-css/products.css">
<link rel="stylesheet" href="resources/pdh-css/font.css">
<link rel="stylesheet" href="resources/pdh-css/scroll-to-top-button.css">
</head>
<body>
	<header>
		<section class="header-wrapper">
			<div class="title judson-bold"><a href="/">forest</a></div>
			
			<ul class="nav__list">
				<li class="nav__item"><a href="products">perfume</a></li>
				<li class="nav__item"><a href="products">hand&body</a></li>
				<li class="nav__item"><a href="products">home fragrance</a></li>
				<li class="nav__item"><a href="help">about</a></li>
			</ul>
			
			<div class="material-symbols-outlined icons">
				<span><a href="search" class="icon">Search</a></span>
				<span><a href="help" class="icon">headset_mic</a></span>
				<span><a href="cart" class="icon">Shopping_Cart</a></span>
				<span><a href="wish" class="icon">Favorite</a></span>
				<span><a href="mypage" class="icon">Person</a></span>
				<span><a href="login" class="icon">Person</a></span>
			</div>
		</section>
		<hr class="line">
	</header>
	
	<main>
		<div class="select-box">
		<select class="select">
			<option value="alphabetical-order">이름순</option>
			<option value="price-order">가격순</option>
			<option value="popularity-order">인기순</option>
		</select>
		</div>
		
		<ul class="product-wrapper">
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/ANOTHER13_15ml.jpg" alt="ANOTHER13_15ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>ANOTHER 13</P><P>15ml</P><P>132,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/ANOTHER13_100ml.jpg" alt="ANOTHER13_100ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>ANOTHER 13</P><P>100ml</P><P>440,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/ANOTHER13_500ml.jpg" alt="ANOTHER13_500ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>ANOTHER 13</P><P>500ml</P><P>1,500,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/LAVANDE31_15ml.jpg" alt="LAVANDE31_15ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>LAVANDE 31</P><P>15ml</P><P>132,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/LAVANDE31_100ml.jpg" alt="LAVANDE31_100ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>LAVANDE 31</P><P>100ml</P><P>440,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/LAVANDE31_500ml.jpg" alt="LAVANDE31_500ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>LAVANDE 31</P><P>500ml</P><P>1,500,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/SANTAL33_15ml.jpg" alt="SANTAL33_15ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>SANTAL 33</P><P>15ml</P><P>132,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/SANTAL33_100ml.jpg" alt="SANTAL33_100ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>SANTAL 33</P><P>100ml</P><P>440,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/SANTAL33_500ml.jpg" alt="SANTAL33_500ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>SANTAL 33</P><P>500ml</P><P>1,500,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/THEMATCHA26_15ml.jpg" alt="THEMATCHA26_15ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>THÉ MATCHA 26</P><P>15ml</P><P>132,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/THEMATCHA26_100ml.jpg" alt="THEMATCHA26_100ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>THÉ MATCHA 26</P><P>100ml</P><P>440,000₩</P></div>
			</li>
			<li class="product">
				<img class="product-thumbnail" src="resources/pdh-image/LeLabo/THEMATCHA26_500ml.jpg" alt="THEMATCHA26_500ml" />
				<div class="product-brand">LE LABO</div>
				<div class="product-information"><P>THÉ MATCHA 26</P><P>500ml</P><P>1,500,000₩</P></div>
			</li>
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
	
	
</body>
</html>