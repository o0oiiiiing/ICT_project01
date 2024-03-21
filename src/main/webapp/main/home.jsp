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
</head>
<body>
	<script type="text/javascript">
		window.onload = function() {
		    var images = ['background_01.jpg', 'background_02.jpg', 'background_04.jpg']; // 변경할 배경 이미지들의 파일명
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
			<li class="menu"><a href="../main/products.jsp">perfume</a></li>
			<li class="menu"><a href="#">hand&body</a></li>
			<li class="menu"><a href="#">home fragrance</a></li>
			<li class="menu"><a href="#">about</a></li>
		</ul>
	</header>
	
		<br><br><br><br><br><br><br><br><br><br><br>
		<div class="judson-bold title-middle text-center color-white">scent</div>

	<!-- <div class="glassmorphism"></div> -->
</body>
</html>