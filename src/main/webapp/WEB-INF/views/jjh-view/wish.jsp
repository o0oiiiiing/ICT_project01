<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/common-css/reset.css" rel="stylesheet">
<link href="resources/jjh-css/05_01_wish.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="wishlist">
	<article id="lists">
		<div class="wishitems">
			<div>
				<img src="resources/jjh-image/projtest.png">
			</div>
			<p>Soie SignaturePerfume Soie SignaturePerfume</p>
			<p>기본향 : rose</p>
			<div>
				<p>100,000 KRW</p>
				<button>장바구니로 이동</button>
				<button>위시리스트 제거</button>
			</div>
		</div>
		<div class="wishitems">
			<div>
				<img src="resources/jjh-image/projtest.png">
			</div>
			<p>Soie SignaturePerfume Soie SignaturePerfume</p>
			<p>기본향 : rose</p>
			<div>
				<p>100,000 KRW</p>
				<button>장바구니로 이동</button>
				<button>위시리스트 제거</button>
			</div>
		</div>
		<div class="wishitems">
			<div>
				<img src="resources/jjh-image/projtest.png">
			</div>
			<p>Soie SignaturePerfume Soie SignaturePerfume</p>
			<p>기본향 : rose</p>
			<div>
				<p>100,000 KRW</p>
				<button>장바구니로 이동</button>
				<button>위시리스트 제거</button>
			</div>
		</div>
		<div class="wishitems">
			<div>
				<img src="resources/jjh-image/projtest.png">
			</div>
			<p>Soie SignaturePerfume Soie SignaturePerfume</p>
			<p>기본향 : rose</p>
			<div>
				<p>100,000 KRW</p>
				<button>장바구니로 이동</button>
				<button>위시리스트 제거</button>
			</div>
		</div>
		<div class="wishitems">
			<div>
				<img src="resources/jjh-image/projtest.png">
			</div>
			<p>Soie SignaturePerfume Soie SignaturePerfume</p>
			<p>기본향 : rose</p>
			<div>
				<p>100,000 KRW</p>
				<button>장바구니로 이동</button>
				<button>위시리스트 제거</button>
			</div>
		</div>
		<div class="wishitems">
			<div>
				<img src="resources/jjh-image/projtest.png">
			</div>
			<p>Soie SignaturePerfume Soie SignaturePerfume</p>
			<p>기본향 : rose</p>
			<div>
				<p>100,000 KRW</p>
				<button>장바구니로 이동</button>
				<button>위시리스트 제거</button>
			</div>
		</div>
	</article>
</section>
<script type="text/javascript">
	/* 장바구니 버튼 보이는 애니메이션 효과 */
	$(".wishitems").hover(
	    function() {
	        $(this).find("div:nth-of-type(2)").slideDown(600, function() {
	        	$(this).find("div:nth-of-type(2)").css("display", "block")
			});
	    },
	    function() {
	        $(this).find("div:nth-of-type(2)").slideUp(600, function() {
	        	$(this).find("div:nth-of-type(2)").css("display", "none")
			});
	    }
	);
	/* 글자 생략 미 보이기 */
	$(".wishitems > p:nth-of-type(1)").hover(
			function() {
				$(this).css("whiteSpace", "wrap")
			},
			function() {
				$(this).css("whiteSpace", "nowrap")
			}
	);
	
	/* 위시리스트 삭제 */
	$(".wishitems > div:nth-of-type(2) button:nth-of-type(2)").click(function() {
		$(this).parent().parent().remove();
	});
	$(".wishitems > div:nth-of-type(2) button:nth-of-type(2)").hover(
		function() {
			$(this).css("backgroundColor", "gray");
		},
		function() {
			$(this).css("backgroundColor", "#bfbfbf");
		}
	);
</script>
</body>
</html>