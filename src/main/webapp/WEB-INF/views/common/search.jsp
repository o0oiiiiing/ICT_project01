<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>search | forest</title>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Judson:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/avenir" rel="stylesheet">

<!-- CSS 파일 -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/common-css/font.css">
<link rel="stylesheet" href="resources/common-css/search.css">
<script type="text/javascript">
	function search_go(f) {
		f.action = "search";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post" action="search" id="search_form">
		<section id="search_section">
		 	<div class="search">
				<input type="submit" class="material-symbols-outlined search-icon icon" value="Search">
				<input type="text" class="search-field" name="p_name">
			</div> 
	
			<!-- 카테고리 -->
			<div class="judson-bold category">category</div>
	
			<ul class="category-wrapper">
				<li class="categories">
					<label><input type="checkbox" class="top-category" id="product-all"> PRODUCT</label>
					<ul class="subcategory">
						<li><label><input type="checkbox" class="product" name="p_type" value="perfume"> perfume</label></li>
						<li><label><input type="checkbox" class="product" name="p_type" value="hand_body"> hand&body</label></li>
						<li><label><input type="checkbox" class="product" name="p_type" value="home_fragrance"> home fragrance</label></li>
					</ul>
				</li>
				<li class="categories">
					<label><input type="checkbox" class="top-category" id="brand-all"> BRAND</label>
					<ul class="subcategory">
						<li><label><input type="checkbox" class="brand" name="p_brand" value="GRANHAND."> GRANHAND.</label></li>
						<li><label><input type="checkbox" class="brand" name="p_brand" value="LE LABO"> LE LABO</label></li>
						<li><label><input type="checkbox" class="brand" name="p_brand" value="Maison Margiela"> Maison Margiela</label></li>
						<li><label><input type="checkbox" class="brand" name="p_brand" value="SHIRO"> SHIRO</label></li>
						<li><label><input type="checkbox" class="brand" name="p_brand" value="Aesop"> Aesop</label></li>
					</ul>
				</li>
				
				<li class="categories">
				<label><input type="checkbox" class="top-category" id="capacity-all"> CAPACITY ( perfume only )</label>
					<ul class="subcategory">
						<li><label><input type="checkbox" class="capacity" name="p_volume" value="10"> 10ml</label></li>
						<li><label><input type="checkbox" class="capacity" name="p_volume" value="15"> 15ml</label></li>
						<li><label><input type="checkbox" class="capacity" name="p_volume" value="30"> 30ml</label></li>
						<li><label><input type="checkbox" class="capacity" name="p_volume" value="40"> 40ml</label></li>
						<li><label><input type="checkbox" class="capacity" name="p_volume" value="50"> 50ml</label></li>
						<li><label><input type="checkbox" class="capacity" name="p_volume" value="100"> 100ml</label></li>
						<li><label><input type="checkbox" class="capacity" name="p_volume" value="500"> 500ml</label></li>
					</ul>
				</li>
			</ul>
		
			<script>
		        // "전체 선택" 체크박스 요소 가져오기
		        var selectAllProduct = document.getElementById('product-all');
		        var selectAllBrand = document.getElementById('brand-all');
		        var selectAllCapacity = document.getElementById('capacity-all');
		        
		        // 모든 체크박스 요소 가져오기
		        var products = document.querySelectorAll('.product');
		        var brands = document.querySelectorAll('.brand');
		        var capacities = document.querySelectorAll('.capacity');
		
		        // "전체 선택" 체크박스의 변경 이벤트 리스너 추가
		        selectAllProduct.addEventListener('change', function() {
		            // "전체 선택" 체크박스의 상태에 따라 모든 체크박스를 선택 또는 선택 해제
		            products.forEach(function(checkbox) {
		                checkbox.checked = selectAllProduct.checked;
		            });
		        });
		        
		        selectAllBrand.addEventListener('change', function() {
		        	brands.forEach(function(checkbox) {
		                checkbox.checked = selectAllBrand.checked;
		            });
		        });
		        
		        selectAllCapacity.addEventListener('change', function() {
		        	capacities.forEach(function(checkbox) {
		                checkbox.checked = selectAllCapacity.checked;
		            });
		        });
	    	</script>
			
			<span class="material-symbols-outlined icon" id="s-close">close</span>
		</section>
	</form>
</body>
</html>