<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/03_01_main_mypage.css" rel="stylesheet">
<!-- 아이콘들 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<header></header>
	<section id="first">
		<article id="f_menu">
			<button>내프로필</button>
			<button>회원 정보 수정</button>
			<button>장바구니</button>
			<button>위시리스트</button>
		</article>
		<article id="f_info">
			<div id="info_pro">
				<p>프로필</p>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">person</span>
					</p>
					<p>이름 : 아무개</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">how_to_reg</span>
					</p>
					<p>아이디 : 아무개</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">smartphone</span>
					</p>
					<p>번호 : 010-8888-8888</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">alternate_email</span>
					</p>
					<p>이메일 : ww1234@naver.com</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">home</span>
					</p>
					<p>주소 : 서울특별시 마포구</p>
				</div>
			</div>
			<div id="info_addr">
				<p>배송지 주소</p>
				<div>
					<p>배송지 주소1 : </p>
					<p>서울특별시 마포구 xx동</p>
				</div>
				<div>
					<p>배송지 주소2 :</p>
					<p>저장된 주소가 없습니다.</p>
				</div>
			</div>
			<div id="info_qna">
				<p>QnA 문의 결과</p>
				<div>
					<p>환불 요청</p>
					<p>답변 완료</p>
				</div>
				<div>
					<p>반품 요청</p>
					<p>답변 대기중</p>
				</div>
			</div>
		</article>
	</section>
	<script type="text/javascript">
		$("#f_menu > button:nth-of-type(1)").hover(
			    function() {
			        $(this).css("backgroundColor", "#bfbfbf");
			    },
			    function() {
			        $(this).css("backgroundColor", "transparent");
			    }
			);
		$("#f_menu > button:nth-of-type(2)").hover(
			    function() {
			        $(this).css("backgroundColor", "#bfbfbf");
			    },
			    function() {
			        $(this).css("backgroundColor", "transparent");
			    }
			);
		$("#f_menu > button:nth-of-type(3)").hover(
			    function() {
			        $(this).css("backgroundColor", "#bfbfbf");
			    },
			    function() {
			        $(this).css("backgroundColor", "transparent");
			    }
			);
		$("#f_menu > button:nth-of-type(4)").hover(
			    function() {
			        $(this).css("backgroundColor", "#bfbfbf");
			    },
			    function() {
			        $(this).css("backgroundColor", "transparent");
			    }
			);
	</script>
</body>
</html>