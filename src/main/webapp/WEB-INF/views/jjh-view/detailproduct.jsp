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
<link href="resources/common-css/reset.css" rel="stylesheet">
<link href="resources/jjh-css/01_01_product.css" rel="stylesheet">
<link href="resources/jjh-css/01_02_exevent.css" rel="stylesheet">
<link href="resources/jjh-css/01_03_recent.css" rel="stylesheet">
<link href="resources/jjh-css/01_04_simreview.css" rel="stylesheet">
<link href="resources/jjh-css/01_05_etc.css" rel="stylesheet">
<link href="resources/jjh-css/01_06_eximg.css" rel="stylesheet">
<link href="resources/jjh-css/01_07_extext.css" rel="stylesheet">
<link href="resources/jjh-css/01_08_totalreview.css" rel="stylesheet">
<link href="resources/jjh-css/02_01_minibuy.css" rel="stylesheet">

<!-- 이모티콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!-- 서버용 함수 -->
<script type="text/javascript">
	function pay(f) {
		f.action = "pay"
		f.submit();
	}
	if (${wish_status == 1}) {
		$(".wish_ajax").css('font-variation-settings', '"FILL" 1, "GRAD" 0, "opsz" 24, "wght" 400');
		$(".wish_ajax").attr("onclick", "wish_del()");
	}else {
		$(".wish_ajax").css('font-variation-settings', '"FILL" 0, "GRAD" 0, "opsz" 24, "wght" 400');
		$(".wish_ajax").attr("onclick", "wish_add()");
	}
	// cart 추가 ajax
		function pick_add() {
			$.ajax({
				url : "cartAjax.do",
				method : "post",
				dataType : "text",
				data : "p_idx="+${pvo.p_idx},
				success : function(data) {
					$(".pick").attr("onclick", "pick_del()");
					$(".pick").text("장바구니 제거");
					$("#cart_ajax").text("("+data+")");
				},
				error: function() {
					alert("읽기 실패")
				}
			})
		}
	// cart 제거 ajax
		function pick_del() {
			$.ajax({
				url : "cartDelAjax.do",
				method : "post",
				dataType : "text",
				data : "p_idx="+${pvo.p_idx},
				success : function(data) {
					$("#cart_ajax").text("("+data+")");
					$(".pick").text("장바구니 추가");
					$(".pick").attr("onclick", "pick_add()");
				},
				error: function() {
					alert("읽기 실패")
				}
			})
		}
		// 위시리스트 추가 ajax
		function wish_add() {
			if (${ssuvo == null}) {
				alert("로그인 후 이용 가능합니다.");
			}else {
				$.ajax({
					url : "wishAjax.do",
					method : "post",
					dataType : "text",
					data : "p_idx="+${pvo.p_idx},
					success : function(data) {
						$(".wish_ajax").css('font-variation-settings', '"FILL" 1, "GRAD" 0, "opsz" 24, "wght" 400');
						$(".wish_ajax").attr("onclick", "wish_del()");
					},
					error: function() {
						alert("읽기 실패")
					}
				})
			}
		}
		// 위시리스트 제거 ajax
		function wish_del() {
			if (${ssuvo == null}) {
				alert("로그인 후 이용 가능합니다.");
			}else {
				$.ajax({
					url : "wishDelAjax.do",
					method : "post",
					dataType : "text",
					data : "p_idx="+${pvo.p_idx},
					success : function(data) {
						$(".wish_ajax").css('font-variation-settings', '"FILL" 0, "GRAD" 0, "opsz" 24, "wght" 400');
						$(".wish_ajax").attr("onclick", "wish_add()");
					},
					error: function() {
						alert("읽기 실패")
					}
				})
			}
		}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%-- 1. 상품 메인 소개 --%>
<section id="first">
	<article class="first_items" id="main_img_box">
			<div id="m_img"><img id="t1" src="resources/upload/${pvo.p_main_img}"></div>
			<div id="sub_imgs">
				<c:choose>
					<c:when test="${empty pivo_list}">
						사진이 없습니다.
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${pivo_list}">
							<div class="sub_img"><img src="resources/upload/${k.p_img}"></div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
	</article>
	<article class="first_items" id="main_info">
		<div id="info">
			<p id="info_name">${pvo.p_name}</p>
			<p id="info_hname">${pvo.p_brand}</p>
			<c:choose>
				<c:when test="${pvo.p_volume == 'free'}">
				</c:when>
				<c:otherwise>
					<p>${pvo.p_volume}ml</p>
				</c:otherwise>
			</c:choose>
			<p id="info_hname">${pvo.p_brand}</p>
			<p id="info_price"><span><fmt:formatNumber value="${pvo.p_price}"/></span> KRW</p>
		</div>
			<div id="p_btns">
				<div id="num_btn">
					<button>⟨</button>
					<p>수량 선택</p>
					<button>⟩</button>
				</div>
				<div id="p_btn">
					<input type="checkbox" name="present">
					<p>선물 포장</p>
				</div>
			</div>
			<div id="sum_box">
				<p id="sum_price"><span><fmt:formatNumber value="${pvo.p_price}"/></span> KRW</p>
				<p id="sum_icon">X</p>
				<p id="sum_num">0</p>
				<p id="sum">총 상품 금액 : <span>0</span> KRW</p>
			</div>
		<form method="get">
			<div id="pick_box">
			
				<c:choose>
					<c:when test="${wish_status == 1}">
						<button id="wish" type="button">
							<span class="material-symbols-outlined" class="wish_ajax" name="${pvo.p_idx}" onclick="wish_del()">
							    favorite
							</span>
						</button>
					</c:when>
					<c:otherwise>
						<button id="wish" type="button">
							<span class="material-symbols-outlined" class="wish_ajax" name="${pvo.p_idx}" onclick="wish_add()">
							    favorite
							</span>
						</button>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cart_status == 1}">
						<button type="button" class="pick" class="${pvo.p_idx}" onclick="pick_del()">장바구니 제거</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="pick" class="${pvo.p_idx}" onclick="pick_add()">장바구니 담기</button>	
					</c:otherwise>
				</c:choose>
				<button type="button" id="sell_btn" onclick="pay(this.form)">구매하기</button>
			</div>
		</form>
	</article>	
</section>
<%-- 상품 설명 이벤트 --%>
<section id="second">
	<article id="sec_artbox">
		<article id="sec_art_1">
			<div id = "s_event01">
				<p>+</p>
				<p>상품 효과</p>
			</div>
			<div>
				<p>
					${pvo.p_content}
				</p>
			</div>
		</article>
		<article id="sec_art_2">
			<div id = "s_event02">
				<p>+</p>
				<p>상품 정보 요약</p>
			</div>
			<ul>
				<li>상품 타입 : ${pvo.p_type}</li>
				<li>브랜드명 : ${pvo.p_brand}</li>
				<li>상품명 : ${pvo.p_name}</li>
				<c:choose>
					<c:when test="${pvo.p_type=='perfume'}">
						<li>사용법 : 피부에 분사해서 사용</li>
					</c:when>
					<c:when test="${pvo.p_type=='hand_body'}">
						<li>사용법 : 손에 고르게 펴서 바르세요</li>
					</c:when>
					<c:when test="${pvo.p_type=='home_fragrance'}">
						<li>사용법 : 주변이 틔인 장소에 올려두세요</li>
					</c:when>
				</c:choose>
				<li>총 평점 : 4.0</li>
			</ul>
		</article>
	</article>
</section>
<%-- 최근 본 상품 --%>
<section id="third" >
	<p style="font-size: 40px; margin-bottom: 30px;">최근 본 상품</p>
	<article id="recent_box">
		<c:choose>
			<c:when test="${empty recent || recent.size() == 1}">
				최근 본 상품이 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${recent}" varStatus="vs">
					<c:choose>
						<c:when test="${vs.index != 0}">
							<div>
								<div><img src="resources/upload/${k.p_main_img}"></div>
								<p style="border-bottom: 1px solid black;">${k.p_name}</p>
								<p>${k.p_volume}ml</p>
								<p>${k.p_price} KRW</p>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</article>
</section>
<!-- 최근 리뷰 -->
<section id="fourth">
	<p>최근 리뷰</p>
	<article id="rec_view">
		<c:choose>
			<c:when test="${empty review_list}">
				최근 리뷰가 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach begin="1" end="4" var="k" items="review_list">
				<div class="review_box">
					<div>
						<img src="resources/upload/k.review_img">
					</div>
					<div>
						<p>★★★★☆${k.score}</p>
						<p>${k.review_title}</p>
						<p>${k.review_content}</p>
					</div>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</article>
</section>
<section id="seven">
	<div id="sev_img_box">
		<img src="resources/jjh-image/sevenimg1.png">
	</div>
	<article id="sev_text">
		<p>scent  Type</p>
		<p>화이트 플로럴, 튜베로즈, 아로마틱</p>
	</article>
	<article>
		<table id="sev_tab1">
			<tr>
				<th>TOP : </th>
				<td>아프리칸 오렌즈 플라워, 아이리스, 아로마틱</td>
			</tr>
			<tr>
				<th>MIDDLE : </th>
				<td>튜베로즈, 핑크 페퍼</td>
			</tr>
			<tr>
				<th>BASE : </th>
				<td>머스크</td>
			</tr>
		</table>
	</article>
	<article>
		<table id="sev_tab2">
			<tr>
				<th>지속력 : </th>
				<td> 7~12시간</td>
			</tr>
			<tr>
				<th>확산력 : </th>
				<td>●●●●○</td>
			</tr>
		</table>
	</article>
</section>
<!-- 상품 상세 정보 -->
<section id ="six">
	<article id="simg_box">
		<div id="simg_1"><img src="resources/jjh-image/siximg1.png"></div>
		<div id="simg_2"><img src="resources/jjh-image/siximg2.png"></div>
		<div class="stext_box" id="stext_box_1">
			<p>
				몸에 좋고 맛도 좋고 안정되는 뭔가 그런 향기
			</p>
		</div>
		<div class="stext_box" id="stext_box_2">
			<p>
				몸에 좋고 맛도 좋고 안정되는 뭔가 그런 향기
			</p>
		</div>
	</article>
</section>
<section id="fifth">
	<p>상품 정보</p>
	<table>
		<tr>
			<th>상품명</th>
			<td>Soie SignaturePerfume</td>
		</tr>
		<tr>
			<th>제품 주의사항</th>
			<td>상품 상세 참조</td>
		</tr>
		<tr>
			<th>사용 기간</th>
			<td>상품 하단 참조</td>
		</tr>
		<tr>
			<th>사용 방법</th>
			<td>피부에 분사하여 사용</td>
		</tr>
		<tr>
			<th>제조업체, 유통업체</th>
			<td>Forest, ICTADM</td>
		</tr>
		<tr>
			<th>모든 성분</th>
			<td>상품 상세 참조</td>
		</tr>
		<tr>
			<th>주의 사항</th>
			<td>화장품 사용시 또는 사용 후 직사광선에 의하여 사용부위가 붉은 반점, 부어오름 또는 가려움증 등의 이상 증상이나 부작용이 있는 경우 전문의 등과 상담할 것 상처가 있는 부의등에는 사용을 자제할 것. 사용시 화기에 주의할 것 보관 및 취급시의 주의사항 가) 어린이의 손이 닿지 않는 곳에 보관할 것 나) 직사광선을 피해서 보관할 것</td>
		</tr>
		<tr>
			<th>품질보증기준</th>
			<td>본 제품은 외용 전용 화장품으로서, 이상이 있을 경우 품목별 소비자 분쟁 해결 기준에 의거 교환 또는 보상받을 수 있습니다.</td>
		</tr>
		<tr>
			<th>소비자 상담 전화번호</th>
			<td>02-1111-2222</td>
		</tr>
	</table>
</section>
<section id="eighth">
	<article id="re_info">
		<p>총 리 뷰 : 4.0</p>
		<p>★★★★☆</p>
	</article>
	<article id="re_btn">
		<button>최신순</button>
		<button>평점순</button>
	</article>
	<article id="t_view">
		<c:choose>
			<c:when test="${empty review_list}">
				리뷰가 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="review_list">
					<div class="rev1">
						<p>${k.score}★★★★☆</p>
						<p>${k.review_title}</p>
						<p>${k.regdate}</p>
						<div><img src="resources/upload/${k.review_img}"></div>
						<p>
							${k.review_title}
						</p>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</article>
</section>
	<!-- 빠른 구매 이벤트 버튼-->
<div id="mini_btn">
	<div>
		<div><img src="resources/jjh-image/projtest.png"></div>
		<div><p>빠른구매</p></div>	
	</div>
</div>
<!-- 빠른 구매 창 -->
<section id="mini">
	<article>
		<button id="cancel">x</button>
		<div id="mini_img">
			<img src="resources/upload/${pvo.p_main_img}">
		</div>
		<div id="mini_btns">
			<div id="mini_info">
				<p>${pvo.p_name}</p>
				<p><span><fmt:formatNumber value="${pvo.p_price}"/></span> KRW</p>
			</div>
			<div id="p_btn">
				<input type="checkbox" name="present">
				<p>선물 포장</p>
			</div>
			<div id="num_btn">
				<button>⟨</button>
				<p>수량 선택</p>
				<button>⟩</button>
			</div>
		</div>
		<div id="sum_box">
			<p><span><fmt:formatNumber value="${pvo.p_price}"/></span> KRW</p>
			<p>X</p>
			<p>수량 선택</p>
			<p>총 상품 금액 : <span>0</span> KRW</p>
		</div>
		<form method="get" id="mini_form">
			<div id="pick_box">
				<button>
					<span class="material-symbols-outlined">
						favorite
					</span>
				</button>
				<button type="button" id="m_pick" name="${pvo.p_idx}">장바구니 담기</button>
				<button onclick="pay(this.form)">구매하기</button>
			</div>
		</form>
	</article>
</section>
<script type="text/javascript">
		/* 버튼 위치일때 나오기 */
 		$(window).scroll(function() {
		    if ($(this).scrollTop() >= 1000) {
		        $("#mini_btn").fadeIn(1000)
		    } else {
		        $("#mini_btn").fadeOut(1000);
		    }
		});
		
		/* 빠른 구매 버튼 */
		$("#mini_btn").on("click", function() {
			$("#mini").fadeIn(600, function() {
				$("#mini").css("display","block");
			});
		});
		$("#mini #cancel").on("click", function() {
			$("#mini").fadeOut(600, function() {
				$("#mini").css("display","none");
			});
		});
		
		
		/* 간편 설명 슬라이드 이벤트 */
		$("#s_event01").click(function() {
			$("#sec_art_1 > div:nth-of-type(2)").slideToggle(600)
		});
		$("#s_event02").click(function() {
			$("#sec_art_2 > ul").slideToggle(600)
		});
		
		/* 수량 버튼 이벤트 및 계산 이벤트 */
		$("#first #num_btn > button:nth-of-type(1)").click(function() {
			if ($("#first #num_btn > p").text()=="수량 선택") {
				$("#first #num_btn > p").text("수량 선택");
			}else {
				let k = parseInt($("#first #num_btn > p").text())-1;
				if (k==0) {
					k = "수량 선택";
				}
				$("#first #num_btn > p").text(k);
			}
			$("#first #sum_box p:nth-of-type(3)").text($("#first #num_btn > p").text());
			let k = ($("#first #num_btn > p").text()*${pvo.p_price}).toLocaleString("ko-KR")
			if (k=="NaN") {
				k = 0
			}
			$("#first #sum_box p:nth-of-type(4) span").text(k);
		});
		$("#first #num_btn >button:nth-of-type(2)").click(function() {
			if ($("#first #num_btn > p").text()=="수량 선택") {
				$("#first #num_btn > p").text("1");
			}else {
				$("#first #num_btn > p").text(parseInt($("#first #num_btn > p").text())+1)
			};
			$("#first #sum_box p:nth-of-type(3)").text($("#first #num_btn > p").text());
			$("#first #sum_box p:nth-of-type(4) span").text(($("#first #num_btn > p").text()*${pvo.p_price}).toLocaleString("ko-KR"))
		});
		
		/* 바로구매 수량 버튼 이벤트 및 계산 이벤트 */
		$("#mini #num_btn > button:nth-of-type(1)").click(function() {
			if ($("#mini #num_btn > p").text()=="수량 선택") {
				$("#mini #num_btn > p").text("수량 선택");
			}else {
				let k = parseInt($("#mini #num_btn > p").text())-1;
				if (k==0) {
					k = "수량 선택";
				}
				$("#mini #num_btn > p").text(k);
			}
			$("#mini #sum_box p:nth-of-type(3)").text($("#mini #num_btn > p").text());
			let k = ($("#mini #num_btn > p").text()*${pvo.p_price}).toLocaleString("ko-KR")
			if (k=="NaN") {
				k = 0
			}
			$("#mini #sum_box p:nth-of-type(4) span").text(k);
		});
		$("#mini #num_btn >button:nth-of-type(2)").click(function() {
			if ($("#mini #num_btn > p").text()=="수량 선택") {
				$("#mini #num_btn > p").text("1");
			}else {
				$("#mini #num_btn > p").text(parseInt($("#mini #num_btn > p").text())+1)
			};
			$("#mini #sum_box p:nth-of-type(3)").text($("#mini #num_btn > p").text());
			$("#mini #sum_box p:nth-of-type(4) span").text(($("#mini #num_btn > p").text()*${pvo.p_price}).toLocaleString("ko-KR"))
		});
		
		/* 이미지 변경 이벤트 */
		$(".sub_img:nth-of-type(1)").click(function() {
			let k = $(".sub_img:nth-of-type(1) img").attr("src");
			$("#t1").fadeOut(0, function() {
				$("#t1").attr("src", k)
				$("#t1").fadeIn(1000)
			})
		});
		$(".sub_img:nth-of-type(2)").click(function() {
			let k = $(".sub_img:nth-of-type(2) img").attr("src");
			$("#t1").fadeOut(0, function() {
				$("#t1").attr("src", k)
				$("#t1").fadeIn(1000)
			})
		});
		$(".sub_img:nth-of-type(3)").click(function() {
			let k = $(".sub_img:nth-of-type(3) img").attr("src");
			$("#t1").fadeOut(0, function() {
				$("#t1").attr("src", k)
				$("#t1").fadeIn(1000)
			})
		});
</script>
</body>
</html>