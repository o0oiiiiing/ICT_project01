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
<!-- css -->
<link href="resources/common-css/reset.css" rel="stylesheet">
<link href="resources/jjh-css/03_01_main_mypage.css" rel="stylesheet">
<!-- 아이콘들 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script type="text/javascript">
	function order() {
		location.href="order"
	}
	function buy() {
		location.href="buy"
	}
	function point() {
		location.href="point"
	}
	function update() {
		location.href="update"
	}
	function addrplus() {
		location.href="addrplus"
	}
	function qna() {
		location.href="qna"
	}
	function help() {
		location.href="help"
	}
</script>
</head>
<body>
	<header></header>
	<section id="first">
		<article id="f_menu">
			<button class="menu_btn" onclick="order()">주문리스트</button>
			<button class="menu_btn" onclick="buy()">구매리스트</button>
			<button class="menu_btn" onclick="point()">내 포인트 관리</button>
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
				<button class="move_btn" onclick="update()">회원정보 수정</button>
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
				<button class="move_btn" onclick="addr()">배송지 추가</button>
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
				<button class="move_btn" onclick="qna()">내 QnA로 이동</button>
			</div>
			<div id="info_help">
				<p>신고 결과</p>
				<div>
					<p>짝퉁 팔고 있어요</p>
					<p>답변 완료</p>
				</div>
				<div>
					<p>환불금액 미입금</p>
					<p>답변 대기중</p>
				</div>
				<button class="move_btn" onclick="help()">내 신고로 이동</button>
			</div>
		</article>
	</section>
	<script type="text/javascript">
		$(".menu_btn").hover(
			    function() {
			        $(this).css("fontWeight", "bold");
			        $(this).css("borderBottom", "2px solid black");
			        
			    },
			    function() {
			        $(this).css("fontWeight", "normal");
			        $(this).css("border", "none");
			    }
			);
		$(".move_btn").hover(
			    function() {
			        $(this).css("fontWeight", "bold");
			        $(this).css("backgroundColor", "lightgray");
			        
			    },
			    function() {
			        $(this).css("fontWeight", "normal");
			        $(this).css("backgroundColor", "transparent");
			    }
			);
		
	</script>
</body>
</html>