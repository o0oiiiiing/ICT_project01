<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/khj-css/customer_center.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div id="frame">
<section id="ccenter">
	<article id="sel">
		<div id="s_menu">
			<a href="">QnA</a>
			<a href="">FaQ</a>
			<a href="">Claim</a>
		</div>
		<div id="s_display"><p>FAQ(s_menu 누르면 창 바뀌고 누른거 표시)</p></div>
	</article>
	<article id="sel_main">
		<button id="sm1">향수</button>
		<button id="sm2">향초</button>
		<button id="sm3">배송</button>
		<button id="sm4">기타</button>
	</article>
	<article id="main">
	<div>
		<div class="m_div">
			<div class="m_num">num</div>
			<div class="m_type">type</div>
			<div class="m_content">faq질문~~~~~</div>
		</div>
		<div class="m_reply">
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">num</div>
			<div class="m_type">type</div>
			<div class="m_content">faq질문~~~~~</div>
		</div>
		<div class="m_reply">
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">num</div>
			<div class="m_type">type</div>
			<div class="m_content">faq질문~~~~~</div>
		</div>
		<div class="m_reply">
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">num</div>
			<div class="m_type">type</div>
			<div class="m_content">faq질문~~~~~</div>
		</div>
		<div class="m_reply">
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">num</div>
			<div class="m_type">type</div>
			<div class="m_content">faq질문~~~~~</div>
		</div>
		<div class="m_reply">
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">num</div>
			<div class="m_type">type</div>
			<div class="m_content">faq질문~~~~~</div>
		</div>
		<div class="m_reply">
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">num</div>
			<div class="m_type">type</div>
			<div class="m_content">faq질문~~~~~</div>
		</div>
		<div class="m_reply">
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
		</div>
	</div>
	<div>
		<div class="m_div">
			<div class="m_num">num</div>
			<div class="m_type">type</div>
			<div class="m_content">faq질문~~~~~</div>
		</div>
		<div class="m_reply">
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
			<p>faq답글~~~~faq답글~~~~faq답글~~~~faq답글~~~~</p>
		</div>
	</div>
		
		<div id="sel_faq_page"> 
			<button class="entity">&lt;</button>
			<button class="page_num">1</button>
			<button class="page_num">2</button>
			<button class="page_num">3</button>
			<button class="entity">&gt;</button>
		</div>
	</article>

</section>
</div>	
<script type="text/javascript">
	$(".m_div").click(
			
			function() {
				console.log($(this).next())
				$(this).next().fadeToggle(
						200, function() {$(this).css("display", "block")
					})
				
				}
			
			)
	$(".m_reply").click(function() {
		$(this).fadeOut(200, function() {
			$(this).css("display", "none")
		})
	})
</script>
</body>
</html>