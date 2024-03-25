<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>forest</title>
<!-- 구글 아이콘 -->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Judson:ital,wght@0,400;0,700;1,400&display=swap"
	rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/avenir" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- CSS 파일 -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/home.css">
<link rel="stylesheet" href="../css/font.css">
<script type="text/javascript">
	// 배경 이미지 변경 스크립트
	window.onload = function() {
	    var images = ['background_01.jpg', 'background_02.jpg', 'background_03.jpg']; // 변경할 배경 이미지들의 파일명
	    var index = 0;
	    
	    function changeBackgroundImage() {
	        var url = 'url("../image/' + images[index] + '")';
	        document.documentElement.style.backgroundImage = url;
	        index = (index + 1) % images.length; // 다음 이미지 인덱스 계산
	    }

	    changeBackgroundImage(); // 페이지 로드 시 초기 배경 이미지 설정

	    // 5초마다 배경 이미지 변경
	    setInterval(changeBackgroundImage, 4000);
	};
</script>
</head>
<body>
	<header>
		<div class="title judson-bold text-center color-white"><a href="#">forest</a></div>
		
		<div class="material-symbols-outlined icons color-white">
			<span><a href="../main/search.jsp" class="icon">Search</a></span>
			<span><a href="#" class="icon">headset_mic</a></span>
			<span><a href="#" class="icon">Shopping_Cart</a></span>
			<span><a href="#" class="icon">Favorite</a></span>
			<span><a href="#" class="icon">Person</a></span>
		</div>
		
		<hr class="hr-style">

		<ul class="menu-frame">
			<li class="menu perfume"><a href="../main/products.jsp">perfume</a></li>
			<li class="menu hand-body"><a href="#">hand&body</a></li>
			<li class="menu home-fragrance"><a href="#">home fragrance</a></li>
			<li class="menu"><a href="#">about</a></li>
		</ul>
	</header>
	
	<div class="menu-hover">
		<ul class="show-brand">
			<li>
				<img class="" src="../image/brand/GRANHAND.png" alt="GRANHAND." />
				<div class="brand-name">GRANHAND.</div>
			</li>
			<li>
				<img class="" src="../image/brand/LELABO.png" alt="LE LABO" />
				<div class="brand-name">LE LABO</div>
			</li>
			<li>
				<img class="" src="../image/brand/MaisonMargiela.png" alt="Maison Margiela" />
				<div class="brand-name">Maison Margiela</div>
			</li>
			<li>
				<img class="" src="../image/brand/SHIRO.png" alt="SHIRO" />
				<div class="brand-name">SHIRO</div>
			</li>
			<li>
				<img class="" src="../image/brand/Aesop.png" alt="Aesop" />
				<div class="brand-name">Aesop</div>
			</li>
		</ul>
	</div>

	<div class="judson-bold title-middle text-center color-white">scent</div>

	<div class="best-seller"></div>
	
	<script type="text/javascript">
		// 메뉴에 마우스 올리면 하위 카테고리 보여주기
		// 변수 선언
		let perfume = document.querySelector('.perfume');
		let handBody = document.querySelector('.hand-body');
		let homeFragrance = document.querySelector('.home-fragrance');
		let menuHover = document.querySelector('.menu-hover');
		let titleMiddle = document.querySelector('.title-middle');
		
		// perfume
		perfume.addEventListener('mouseenter', function() {
		    menuHover.style.display = "block";
		    titleMiddle.style.display = "none";
		    event.target.style.borderBottomColor = "#1E1E1E";
		});

		menuHover.addEventListener('mouseleave', function() {
			menuHover.style.display = "none";
		    document.querySelector('.title-middle').style.display = "block";
		});
		
		perfume.addEventListener('mouseleave', function() {
			perfume.style.borderBottomColor = "transparent";
		});
	</script>
</body>
</html>