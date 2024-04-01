<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 0 auto;">
	<h2>상품 입력 예시</h2>
	<form action="product_insert" method="post">
		<label for="p_name">상품명 : </label>
		<input type="text" id="p_name" name="p_name">
		<br>
		<label for="p_name">상품 종류 : </label>
		<input type="radio" name="p_type" value="perfume">perfume
		<input type="radio" name="p_type" value="hand_body">hand_body
		<input type="radio" name="p_type" value="home_fragrance">home_fragrance
		<br>
		<label for="p_brand">브랜드 : </label>
		<input type="text" id="p_brand" name="p_brand">
		<br>
		<label for="p_name">상품 용량 : </label>
		<input type="radio" name="p_volume" value="15">15ml
		<input type="radio" name="p_volume" value="100">100ml
		<input type="radio" name="p_volume" value="500">500ml
		<br>
		<label for="p_price">상품가격 : </label>
		<input type="number" id="p_price" name="p_price">
		<br>
		<label for="p_saleprice">할인가격 : </label>
		<input type="text" id="p_saleprice" name="p_saleprice">
		<br>
		<label for="total_quatity">총수량 : </label>
		<input type="text" id="total_quatity" name="total_quatity">
		<br>
		<input type="submit" value="상품 등록">
		
		<label>상품 이미지 등록 :</label>
		<input type="file" name="main_img">
		<br>
		<label>상품 서브 이미지 등록 :</label>
		<input type="file" name="sub_img" multiple>
	</form>
</div>
</body>
</html>