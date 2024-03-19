<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>search | forest</title>
<!-- 구글 아이콘 -->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Judson:ital,wght@0,400;0,700;1,400&display=swap"
	rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/br-segma" rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/avenir" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<!-- CSS 파일 -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/font.css">
<link rel="stylesheet" href="../css/search.css">
</head>
<body>
	<div class="search">
		<input type="text" class="search-field">
		<span class="material-symbols-outlined icon search-icon">Search</span>
	</div>
	
	<!-- 카테고리 -->
	<div class="judson-bold category">category</div>
	
	<ul class="category-wrapper">
		<li class="categories"><label><input type="checkbox" class="top-category"> PRODUCT</label>
			<ul  class="subcategory">
				<li><label><input type="checkbox"> perfume</label></li>
				<li><label><input type="checkbox"> hand&body</label></li>
				<li><label><input type="checkbox"> home fragrance</label></li>
			</ul>
		</li>
		<li  class="categories"><label><input type="checkbox" class="top-category"> BRAND</label>
			<ul  class="subcategory">
				<li><label><input type="checkbox"> GRANHAND.</label></li>
				<li><label><input type="checkbox"> LE LABO</label></li>
				<li><label><input type="checkbox"> Maison Margiela</label></li>
				<li><label><input type="checkbox"> SHIRO</label></li>
				<li><label><input type="checkbox"> Aēsop</label></li>
			</ul>
		</li>
		<li  class="categories"><label><input type="checkbox" class="top-category"> CAPACITY</label>
			<ul  class="subcategory">
				<li><label><input type="checkbox"> 15ml</label></li>
				<li><label><input type="checkbox"> 50ml</label></li>
				<li><label><input type="checkbox"> 100ml</label></li>
				<li><label><input type="checkbox"> 500ml</label></li>
			</ul>
		</li>
	</ul>
	
	<span class="material-symbols-outlined icon">close</span>
</body>
</html>