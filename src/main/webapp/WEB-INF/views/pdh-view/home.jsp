<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>forest</title>
<!-- JQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Judson:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Palanquin:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/avenir" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<!-- CSS 파일 -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/common-css/font.css">
<link rel="stylesheet" href="resources/pdh-css/home.css">
<script type="text/javascript" defer>
	function openPopup() {
	    let width = 620;
	    let height = 400;
	    let left = 0;
	    let top = 0;
	
	    // 새로운 창을 엽니다.
	    let popup = window.open('popup_go', '팝업창', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
	
	    // 차단된 팝업 창을 대비하여 예외 처리합니다.
	    if (popup == null || typeof(popup)=='undefined') {
	        alert('팝업 차단이 감지되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	        popup.focus();
	    }
	}
	if (${cookie.popup_chk.value != 1}) {
		openPopup()
	}	
	// 로그인 유무 검사 후 위시리스트
	function loginchk() {
		if (${ssuvo == null}) {
			alert("로그인 후 이용 가능합니다.")
			return false;
		}else {
			return true;
		}
	}
	
	// 배경 이미지 변경 스크립트
	window.onload = function() {
		var images = [ 'background_01.jpg', 'background_02.jpg', 'background_03.jpg' ]; // 변경할 배경 이미지들의 파일명
		var index = 0;
	
		function changeBackgroundImage() {
			var url = 'url("resources/pdh-image/' + images[index] + '")';
			document.documentElement.style.backgroundImage = url;
			index = (index + 1) % images.length; // 다음 이미지 인덱스 계산
		}
	
		changeBackgroundImage(); // 페이지 로드 시 초기 배경 이미지 설정
	
		// 5초마다 배경 이미지 변경
		setInterval(changeBackgroundImage, 4000);
	};
	
	$(document).ready(function() {
		// 마우스 휠 이벤트 핸들러 등록
		$(window).on('scroll', function windowScrollHandler() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		        // 윈도우 스크롤 이벤트 해제
		        $(window).off('scroll', windowScrollHandler);

		        // #best-seller__inner 영역에서 마우스휠 이벤트 핸들러 등록
		        $("#best-seller__inner").on('mousewheel', function mousewheelHandler(e) {
		            e.preventDefault();
		            var wheelDelta = e.originalEvent.wheelDelta;
		            $(this).scrollLeft($(this).scrollLeft() - (wheelDelta));
		            
		            // #best-seller__inner 영역의 scrollLeft() 값이 0이면 window 스크롤 이벤트 재등록
		            if ($(this).scrollLeft() == 0) {
		                $(window).on('scroll', windowScrollHandler);
		                $(this).off('mousewheel', mousewheelHandler);
		            }
		        });
		    }
		});
		
		// 로그인 페이지 버튼
 		$("#login_btn").on("click", function() {
			if ($(this).data("clicked")) {

				$("#login_page").css("display", "none"); 
				$(this).data("clicked", false); 
			} else {
				$(this).data("clicked", true);
				$("#login_page").css("display", "block");
			}
		});

		// 검색창 활성화
		$("#search_btn").click(function() {
			$("#search-page").css("backgroundColor", "#F5F5F5");
			$("#search-page").css("display", "block");
		})
		$("#s-close").click(function() {
			$("#search-page").css("backgroundColor", "none");
			$("#search-page").css("display", "none");
		})
		
		// 회원가입 성공 메세지
		let join_ok = "${join_ok}";
		if (join_ok == "true") {
			alert("회원가입을 축하합니다.");
		}
		
		// 로그인 실패시
		let login_false = "${login_false}";
		console.log(login_false)
		if (login_false == "false") {
			alert("아이디 또는 비밀번호가 틀립니다.");
		}
		
		
	});
</script>
<script type="text/javascript">
function products_list_perfume() {
	location.href = "products_list?p_type=perfume";
}

function products_list_handBody() {
	location.href = "products_list?p_type=hand_body";
}

function products_list_homeFragrance() {
	location.href = "products_list?p_type=home_fragrance";
}
</script>
</head>
<body>
	<div id="search-page">
		<%@ include file="/WEB-INF/views/common/search.jsp"%>
	</div>
	<div class="overlay"></div>
	<header>
		<h1 class="title judson-bold">
			<a href="home" class="a_tag">forest</a>
		</h1>

		<div class="material-symbols-outlined icons">
			<span><a class="icon a_tag" id="search_btn">Search</a></span>
			<span><a href="faq" class="icon a_tag">headset_mic</a></span>
			<span><a href="cart" class="icon a_tag">Shopping_Cart<span id="cart_ajax">(${cart.size()})</span></a></span>
			<span><a href="wish" class="icon a_tag" onclick="return loginchk()">Favorite</a></span>
			<span id="login_btn">
				<c:choose>
					<c:when test="${ssuvo.login == 'true'}">
						<a class="icon a_tag">Person
						<span class="login-state">${ssuvo.user_id}님 환영합니다.</span>
						</a>
					</c:when>
					<c:otherwise>
						<a class="icon a_tag">Person
						<span class="login-state">로그인 | 회원가입</span>
						</a>
					</c:otherwise>
				</c:choose>
			</span>
			<div id="login_page">
				<c:choose>
					<c:when test="${ssuvo.login == 'true'}">
						<%@ include file="/WEB-INF/views/common/logout.jsp" %>
					</c:when>
				<c:otherwise>
					<%@ include file="/WEB-INF/views/common/login.jsp" %>
				</c:otherwise>
				</c:choose>
			</div>
		</div>

		<hr class="line">

		<ul class="nav__list">
			<li class="nav__item perfume">perfume</li>
			<li class="nav__item hand-body">hand&body</li>
			<li class="nav__item home-fragrance">home fragrance</li>
			<li class="nav__item">about</li>
		</ul>
	</header>

	<div class="perfume-nav-list__open">
		<ul class="perfume-nav-list__category">
			<li><a href="products_list_brand?p_type=perfume&p_brand=GRANHAND." class="a_tag"> <img
					src="resources/pdh-image/brand/GRANHAND.png" alt="GRANHAND." />
					<div class="nav-list__brand-name">GRANHAND.</div>
			</a></li>
			<li><a href="products_list_brand?p_type=perfume&p_brand=LE LABO" class="a_tag"> <img
					src="resources/pdh-image/brand/LELABO.png" alt="LE LABO" />
					<div class="nav-list__brand-name">LE LABO</div>
			</a></li>
			<li><a href="products_list_brand?p_type=perfume&p_brand=Maison Margiela" class="a_tag"> <img
					src="resources/pdh-image/brand/MaisonMargiela.png" alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
			</a></li>
			<li><a href="products_list_brand?p_type=perfume&p_brand=SHIRO" class="a_tag"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
			<li><a href="products_list_brand?p_type=perfume&p_brand=Aesop" class="a_tag"> <img
					src="resources/pdh-image/brand/Aesop.png" alt="Aesop" />
					<div class="nav-list__brand-name">Aesop</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="products_list_perfume()">
	</div>
	<div class="handBody-nav-list__open">
		<ul class="handBody-nav-list__category">
			<li><a href="products_list_brand?p_type=hand_body&p_brand=LE LABO" class="a_tag"> <img
					src="resources/pdh-image/brand/LELABO.png" alt="LE LABO" />
					<div class="nav-list__brand-name">LE LABO</div>
			</a></li>
			<li><a href="products_list_brand?p_type=hand_body&p_brand=Maison Margiela" class="a_tag"> <img
					src="resources/pdh-image/brand/MaisonMargiela.png"
					alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
			</a></li>
			<li><a href="products_list_brand?p_type=hand_body&p_brand=SHIRO" class="a_tag"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="products_list_handBody()">
	</div>
	<div class="homeFragrance-nav-list__open">
		<ul class="homeFragrance-nav-list__category">
			<li><a href="products_list_brand?p_type=home_fragrance&p_brand=GRANHAND." class="a_tag"> <img
					src="resources/pdh-image/brand/GRANHAND.png" alt="GRANHAND." />
					<div class="nav-list__brand-name">GRANHAND.</div>
			</a></li>
			<li><a href="products_list_brand?p_type=home_fragrance&p_brand=Maison Margiela" class="a_tag"> <img
					src="resources/pdh-image/brand/MaisonMargiela.png"
					alt="Maison Margiela" />
					<div class="nav-list__brand-name">Maison Margiela</div>
			</a></li>
			<li><a href="products_list_brand?p_type=home_fragrance&p_brand=SHIRO" class="a_tag"> <img
					src="resources/pdh-image/brand/SHIRO.png" alt="SHIRO" />
					<div class="nav-list__brand-name">SHIRO</div>
			</a></li>
			<li><a href="products_list_brand?p_type=home_fragrance&p_brand=Aesop" class="a_tag"> <img
					src="resources/pdh-image/brand/Aesop.png" alt="Aesop" />
					<div class="nav-list__brand-name">Aesop</div>
			</a></li>
		</ul>
		<input type="button" class="nav-list__all" value="all"
			onclick="products_list_homeFragrance()">
	</div>

	<div class="middle-title judson-bold">scent</div>

	<section class="best-seller">
		<div id="best-seller__inner">
			<h2 class="best-seller__title judson-bold">best seller</h2>
			
			<ul class="best-seller__list">
				<c:choose>
					<c:when test="${empty best_seller}">
						<p>상품이 존재하지 않습니다.</p>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${best_seller}">
							<li class="best-seller__item">
								<a href="detailproduct?p_idx=${k.p_idx}" class="a_tag">
									<img class="best-seller__thumbnail" src="resources/upload/${k.p_main_img}" alt="${k.p_name}" />
									<div class="best-seller__brand">${k.p_brand}</div>
									<div class="best-seller__information">
										<P>${k.p_name}</P>
									<c:choose>
										<c:when test="${k.p_type == 'perfume'}">
											<P>${k.p_volume}ml</P>
										</c:when>
									</c:choose>
										<P><fmt:formatNumber value="${k.p_price}" pattern="#,##0" />₩</P>
									</div>
								</a>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
			
			<ul class="best-seller__footer">
				<li>회사정보</li>
				<li>이용약관</li>
				<li>개인정보처리방침</li>
				<li>고객센터</li>
			</ul>
		</div>
	</section>

	<script type="text/javascript">
		// 메뉴를 클릭하는 경우 하위 카테고리 드롭다운
		// 변수 선언
		let perfume = document.querySelector('.perfume');
		let handBody = document.querySelector('.hand-body');
		let homeFragrance = document.querySelector('.home-fragrance');

		let perfumeNavListOpen = document
				.querySelector('.perfume-nav-list__open');
		let handBodyNavListOpen = document
				.querySelector('.handBody-nav-list__open');
		let homeFragranceNavListOpen = document
				.querySelector('.homeFragrance-nav-list__open');

		let navItem = document.querySelectorAll('.nav__item');
		let transitonA = document.getElementsByTagName('a');
		let middleTitle = document.querySelector('.middle-title');
		let line = document.querySelector('.line');
		let overlay = document.querySelector('.overlay');

		// perfume
		// perfume 클릭했을 때
		perfume.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				middleTitle.style.display = "";
				line.style.backgroundColor = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
					navItem.item(i).style.borderBottomColor = "";
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				handBody.classList.remove('clicked');
				homeFragrance.classList.remove('clicked');
				perfumeNavListOpen.style.display = "block";
				handBodyNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "";
				middleTitle.style.display = "none";
				line.style.backgroundColor = "#1E1E1E";
				overlay.style.display = "block";
				this.style.borderBottomColor = "#1E1E1E";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 0) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "#1E1E1E";
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (perfume.classList.contains('clicked')) {
				perfumeNavListOpen.style.display = "";
				middleTitle.style.display = "";
				line.style.backgroundColor = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
					navItem.item(i).style.borderBottomColor = "";
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "";
				}
				perfume.classList.remove('clicked');
			}
		});

		// 메뉴 클릭한 상태 - mouseenter
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseenter', function() {
				if (perfume.classList.contains('clicked')) {
					this.style.borderBottomColor = "#1E1E1E";
				}
			});
		}

		// 메뉴 클릭한 상태 - mouseleave
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseleave', function() {
				if (perfume.classList.contains('clicked')) {
					this.style.borderBottomColor = "transparent";
				}
			});
		}

		// handBody 클릭했을 때
		handBody.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				handBodyNavListOpen.style.display = "";
				middleTitle.style.display = "";
				line.style.backgroundColor = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
					navItem.item(i).style.borderBottomColor = "";
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				perfume.classList.remove('clicked');
				homeFragrance.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "";
				handBodyNavListOpen.style.display = "block";
				middleTitle.style.display = "none";
				line.style.backgroundColor = "#1E1E1E";
				overlay.style.display = "block";
				this.style.borderBottomColor = "#1E1E1E";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 1) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "#1E1E1E";
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (handBody.classList.contains('clicked')) {
				handBodyNavListOpen.style.display = "";
				middleTitle.style.display = "";
				line.style.backgroundColor = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
					navItem.item(i).style.borderBottomColor = "";
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "";
				}
				handBody.classList.remove('clicked');
			}
		});

		// 메뉴 클릭한 상태 - mouseenter
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseenter', function() {
				if (handBody.classList.contains('clicked')) {
					this.style.borderBottomColor = "#1E1E1E";
				}
			});
		}

		// 메뉴 클릭한 상태 - mouseleave
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseleave', function() {
				if (handBody.classList.contains('clicked')) {
					this.style.borderBottomColor = "transparent";
				}
			});
		}

		// homeFragrance 클릭했을 때
		homeFragrance.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				homeFragranceNavListOpen.style.display = "";
				middleTitle.style.display = "";
				line.style.backgroundColor = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
					navItem.item(i).style.borderBottomColor = "";
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				perfume.classList.remove('clicked');
				handBody.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				handBodyNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "block";
				middleTitle.style.display = "none";
				line.style.backgroundColor = "#1E1E1E";
				overlay.style.display = "block";
				this.style.borderBottomColor = "#1E1E1E";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 2) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "#1E1E1E";
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (homeFragrance.classList.contains('clicked')) {
				homeFragranceNavListOpen.style.display = "";
				middleTitle.style.display = "";
				line.style.backgroundColor = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
					navItem.item(i).style.borderBottomColor = "";
				}
				for (var i = 0; i < transitonA.length; i++) {
					transitonA.item(i).style.color = "";
				}
				homeFragrance.classList.remove('clicked');
			}
		});

		// 메뉴 클릭한 상태 - mouseenter
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseenter', function() {
				if (homeFragrance.classList.contains('clicked')) {
					this.style.borderBottomColor = "#1E1E1E";
				}
			});
		}

		// 메뉴 클릭한 상태 - mouseleave
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseleave', function() {
				if (homeFragrance.classList.contains('clicked')) {
					this.style.borderBottomColor = "transparent";
				}
			});
		}
	</script>
</body>
</html>