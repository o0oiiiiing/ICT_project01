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
	function update() {
		location.href="update"
	}
	function update_pwd() {
		location.href="update_pwd"
	}
	function qna() {
		location.href="qna"
	}
	function claim() {
		location.href="claim"
	}
	function addrplus() {
		location.href="addrplus"
	}
	function point() {
		location.href="point"
	}
	function mypage() {
		location.href="mypage"
	}
	function buy_list(){
		location.href="buy_list"
	}
	function product_write(){
		location.href="product_write"
	}
	function order(){
		location.href="order"
	}
	function openPopup() {
	    let width = 400;
	    let height = 400;
	    let left = (screen.width - width) / 2;
	    let top = (screen.height - height) / 2;

	    let popup = window.open('point_go', '포인트 충전', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);

	    if (popup == null || typeof(popup)=='undefined') {
	        alert('팝업을 해제해주세요.');
	    } else {
	        popup.focus();
	    }
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section id="first">
		<article id="f_menu">
			<button class="menu_btn" onclick="mypage()">마이페이지</button>
			<button class="menu_btn" onclick="order()">주문리스트</button>
			<button class="menu_btn" onclick="buy_list()">구매리스트</button>
			<c:choose>
				<c:when test="${ssuvo.user_type==0}">
					<button class="menu_btn" onclick="product_write()">상품 등록</button>
				</c:when>
			</c:choose>
		</article>
		<article id="f_info">
			<div id="info_pro">
				<p>프로필</p>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">person</span>
					</p>
					<p>이름 : ${uvo.user_name}</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">how_to_reg</span>
					</p>
					<p>아이디 : ${uvo.user_id}</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">smartphone</span>
					</p>
					<p>번호 : ${uvo.user_phone}</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">alternate_email</span>
					</p>
					<p>이메일 : ${uvo.user_f_email}@${uvo.user_b_email}</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">home</span>
					</p>
					<p>주소 : ${uvo.main_addr}
						<c:choose>
							<c:when test="${!empty uvo.detail_addr}">, ${uvo.detail_addr}</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!empty uvo.ex_addr}">, ${uvo.ex_addr}</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</p>
				</div>
				<div class="infos">
					<p>
						<span class="material-symbols-outlined">Paid</span>
					</p>
					<p>내 포인트 : <fmt:formatNumber value="${uvo.user_point}" />P <button id="point" type="button" onclick="openPopup()">충전하기</button> </p>
				</div>
				<button class="move_btn" onclick="update()">회원정보 수정</button>
				<button class="move_btn" onclick="update_pwd()">비밀번호 수정</button>
			</div>
			<div id="info_addr">
				<p>배송지 주소</p>
				<c:forEach var="k" items="${uaddrlist}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.index==0}">
							<div>
								<p>메인 배송지 주소 : </p>
								<p>${k.main_addr}
									<c:choose>
										<c:when test="${!empty k.detail_addr}">, ${k.detail_addr}</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${!empty k.ex_addr}">, ${k.ex_addr}</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</p>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<p>기타 배송지 주소${vs.index} : </p>
								<p>${k.main_addr}
									<c:choose>
										<c:when test="${!empty k.detail_addr}">, ${k.detail_addr}</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${!empty k.ex_addr}">, ${k.ex_addr}</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</p>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<button class="move_btn" onclick="addrplus()">배송지 추가</button>
			</div>
			<div id="info_qna">
				<p>QnA 문의 결과</p>
				<c:choose>
					<c:when test="${empty qna_list}">
						<div>
							<p style="margin: 0 auto;">문의하신 내역이 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${qna_list}">
							<div>
								<p>${k.qna_subject}</p>
								<c:choose>
									<c:when test="${k.qna_reply_status == '0'}">
										<p style="color: red;">답변 대기</p>
									</c:when>
									<c:otherwise>
										<p style="color: blue;">답변 완료</p>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<button class="move_btn" onclick="qna()">QnA 게시판 이동</button>
			</div>
			<div id="info_help">
				<p>신고 결과</p>
				<c:choose>
					<c:when test="${empty claim_list}">
						<div>
							<p style="margin: 0 auto;">문의하신 내역이 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${claim_list}">
							<div>
								<p>${k.claim_subject}</p>
								<c:choose>
									<c:when test="${k.claim_res == '0'}">
										<p style="color: red;">답변 대기</p>
									</c:when>
									<c:otherwise>
										<p style="color: blue;">답변 완료</p>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<button class="move_btn" onclick="claim()">신고게시판 이동</button>
			</div>
		</article>
	</section>
	<script type="text/javascript">
		$(".menu_btn").hover(
		    function() {
		    	$(this).css("color", "#878787");
		    },
		    function() {
		    	$(this).css("color", "#1E1E1E");
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