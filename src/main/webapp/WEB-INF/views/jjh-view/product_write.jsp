<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/seller-css/product_write.css" rel="stylesheet">
</head>
<body>
<div style="margin: 0 auto;">
<h2>상품 입력 예시</h2>
	<button onclick="perfume()">perfume</button>
	<button onclick="hand_body()">hand_body</button>
	<button onclick="home_fragrance()">home_fragrance</button>
<div id="perfume">
	<form action="product_insert" method="post" enctype="multipart/form-data">
		<label for="p_name">상품명 : </label>
		<input type="text" id="p_name" name="p_name">
		<br>
		<label for="p_name">상품 종류 : </label>
		<input type="radio" name="p_type" value="perfume" checked>perfume
		<br>
		<label for="p_brand">브랜드 : </label>
		<input type="radio" name="p_brand" value="GRANHAND.">GRANHAND.
		<input type="radio" name="p_brand" value="LE LABO">LE LABO
		<input type="radio" name="p_brand" value="Maison Margiela">Maison Margiela
		<input type="radio" name="p_brand" value="SHIRO">SHIRO
		<input type="radio" name="p_brand" value="Aesop">Aesop
		<br>
		<label for="p_name">상품 용량 : </label>
		<input type="radio" name="p_volume" value="10">10ml
		<input type="radio" name="p_volume" value="15">15ml
		<input type="radio" name="p_volume" value="30">30ml
		<input type="radio" name="p_volume" value="40">40ml
		<input type="radio" name="p_volume" value="50">50ml
		<input type="radio" name="p_volume" value="100">100ml
		<input type="radio" name="p_volume" value="500">500ml
		<br>
		<label for="p_price">상품가격 : </label>
		<input type="number" id="p_price" name="p_price">
		<br>
		<label for="total_quatity">총수량 : </label>
		<input type="text" id="total_quatity" name="total_quatity">
		<br>
		<label>상품 메인 이미지 등록 :</label>
		<input type="file" name="main_img">
		<br>
		<label>상품 서브 이미지 등록 :</label>
		<input type="file" name="sub_imgs" multiple>
		<textarea rows="6" cols="40" name="p_content"></textarea>
		<br>
		<input type="submit" value="상품 등록">
		<input class="but5" type="button" value="취소" onclick="location.href='mypage'"> 
	</form>
</div>
<div id="hand_body">
	<form action="product_insert" method="post" enctype="multipart/form-data">
		<label for="p_name">상품명 : </label>
		<input type="text" id="p_name" name="p_name">
		<br>
		<label for="p_name">상품 종류 : </label>
		<input type="radio" name="p_type" value="hand_body" checked>hand_body
		<br>
		<label for="p_brand">브랜드 : </label>
		<input type="radio" name="p_brand" value="LE LABO">LE LABO
		<input type="radio" name="p_brand" value="SHIRO">SHIRO
		<input type="radio" name="p_brand" value="Aesop">Aesop
		<br>
		<input type="hidden" name="p_volume" value="free">
		<label for="p_price">상품가격 : </label>
		<input type="number" id="p_price" name="p_price">
		<br>
		<label for="total_quatity">총수량 : </label>
		<input type="text" id="total_quatity" name="total_quatity">
		<br>
		<label>상품 메인 이미지 등록 :</label>
		<input type="file" name="main_img">
		<br>
		<label>상품 서브 이미지 등록 :</label>
		<input type="file" name="sub_imgs" multiple>
		<textarea rows="6" cols="40" name="p_content"></textarea>
		<br>
		<input type="submit" value="상품 등록">
		<input class="but5" type="button" value="취소" onclick="location.href='mypage'"> 
	</form>
</div>
<div id="home_fragrance">
	<form action="product_insert" method="post" enctype="multipart/form-data">
		<label for="p_name">상품명 : </label>
		<input type="text" id="p_name" name="p_name">
		<br>
		<label for="p_name">상품 종류 : </label>
		<input type="radio" name="p_type" value="home_fragrance" checked>home_fragrance
		<br>
		<label for="p_brand">브랜드 : </label>
		<input type="radio" name="p_brand" value="GRANHAND.">GRANHAND.
		<input type="radio" name="p_brand" value="Maison Margiela">Maison Margiela
		<input type="radio" name="p_brand" value="SHIRO">SHIRO
		<input type="radio" name="p_brand" value="Aesop">Aesop
		<br>
		<input type="hidden" name="p_volume" value="free">
		<label for="p_price">상품가격 : </label>
		<input type="number" id="p_price" name="p_price">
		<br>
		<label for="total_quatity">총수량 : </label>
		<input type="text" id="total_quatity" name="total_quatity">
		<br>
		<label>상품 메인 이미지 등록 :</label>
		<input type="file" name="main_img">
		<br>
		<label>상품 서브 이미지 등록 :</label>
		<input type="file" name="sub_imgs" multiple>
		<textarea rows="6" cols="40" name="p_content"></textarea>
		<br>
		<input type="submit" value="상품 등록">
		<input class="but5" type="button" value="취소" onclick="location.href='mypage'"> 
	</form>
</div>
<script type="text/javascript">
	function perfume() {
		$("#perfume").css("display", "block")
		$("#hand_body").css("display", "none")
		$("#home_fragrance").css("display", "none")
	}
	function hand_body() {
		$("#hand_body").css("display", "block")
		$("#perfume").css("display", "none")
		$("#home_fragrance").css("display", "none")
	}
	function home_fragrance() {
		$("#home_fragrance").css("display", "block")
		$("#hand_body").css("display", "none")
		$("#perfume").css("display", "none")
	}
	</script>
</div>
</body>
</html>