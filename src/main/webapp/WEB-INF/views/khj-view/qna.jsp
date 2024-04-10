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
<script type="text/javascript">
	function qna_write() {
		location.href = "qna_write";
	}
	function reply_write_go() {
		location.href = "qna_reply_write";
	}
</script>
<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/khj-css/qna.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="s_menu">
			<a>QnA</a>
			<a href="faq_list">FaQ</a>
			<a href="claim_list">Claim</a>
	</div>
	<div id="dis_but">
		<div id="s_display">
			<p>QnA</p>
			<button type="button" onclick="qna_write()">문의 글쓰기</button>
		</div>
	</div>
	<div id="qna_block">
	<c:choose>
		<c:when test="${empty qna_list }">
			<h1>게시물이 존재하지 않습니다.</h1>
		</c:when>
		<c:otherwise>
			<c:forEach var="k" items="${qna_list}" varStatus="vs">
			<div>
			<article class="qna_head">
				<div class="qna_num">
					<p>${k.qna_idx }</p>
				</div>	
					<div class="user_id">
					<p>${k.user_id }</p>
				</div>
				<div class="qna_created_date">
					<p>${k.qna_created_date }</p>
				</div>
				<div class="qna_subject">
					<p>${k.qna_subject }</p>
				</div>
				<div class="qna_reply_status">
					<p>${k.qna_reply_status }</p>
				</div>
			</article>
			<article class="qna_body">
				<div class="qna_content">
					<p>
						<span>질문글 : </span>${k.qna_content } 
						<input type="button" onclick="reply_write_go" value="답글작성"> 
						<button id="close" type="button" name="close" value="닫기"> 
					</p>
					<div class="qna_reply">
						<hr>
					<p><span>답글 : </span>${k.qna_reply }</p>
					</div>
				</div>
			</article>
		</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
		
		
		
		
		<article class="qna_page_body">
			<div id="sel_qna_page">
				<button class="entity">&lt;</button>
				<button class="page_num">1</button>
				<button class="page_num">2</button>
				<button class="page_num">3</button>
				<button class="entity">&gt;</button>
			</div>
		</article>
	</div>
	<script type="text/javascript">
		$(".qna_head").click(
				function() {
					$(this).parent().find("article:nth-of-type(2)").fadeToggle(
							200, function() {$(this).css("display", "block")
						})
						$(this).fadeOut(200, function() {
				$(this).$(".qna_body").css("display", "block")
			})
					})
		$("#close").click(function() {
			$(this).fadeOut(200, function() {
				$(this).$(".qna_body").css("display", "none")
			})
		})
	</script>
</body>
</html>