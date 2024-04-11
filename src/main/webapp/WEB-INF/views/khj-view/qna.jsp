<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/khj-css/qna.css">

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div id="s_menu">
		<a>QnA</a>
		<a href="faq">FaQ</a>
		<a href="claim">Claim</a>
	</div>
	<div id="dis_but">
		<div id="s_display">
			<p>QnA</p>
			<button type="button" onclick="qna_write()">문의 글쓰기</button>
		</div>
	</div>
	<div id="qna_block">
		<c:choose>
			<c:when test="${empty qna_list}">
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
							<c:set var="qna_reply_status2" value="${k.qna_reply_status}"></c:set>
							<div class="qna_reply_status">
								<p>${k.qna_reply_status }</p>
							</div>
						</article>
						<article class="qna_body">
							<div class="qna_content">
								<p>
								<c:set var="qna_idx2" value="${k.qna_idx}"></c:set>
									<span>질문글 : </span>${k.qna_content } <br> <input
										type="button" onclick="reply_write_go()" value="답글작성">
									<button class="close" type="button" name="close">닫기</button>
								</p>
								<div class="qna_reply">
									<hr>
									<p>
										<span>답글 : </span>${k.qna_reply }</p>
								</div>
							</div>
						</article>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<article class="qna_page_body">
			<div id="sel_qna_page">
				<c:choose>
					<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
						<button type="button" class="disable">&lt;</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="entity"
							onclick="location.href='qna?cPage=${paging.beginBlock - paging.pagePerBlock }'">&lt;</button>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}"
					step="1" var="k">
					<c:choose>
						<c:when test="${k == paging.nowPage }">
							<button type="button" class="page_num">${k}</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="page_num"
								onclick="location.href='qna?cPage=${k}'">${k}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${paging.endBlock >= paging.totalPage}">
						<button class="disable">&gt;</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="page_num"
							onclick="location.href='qna?cPage=${paging.beginBlock + paging.pagePerBlock }'"></button>
					</c:otherwise>
				</c:choose>
			</div>
		</article>


		<!-- <article class="qna_page_body">
			<div id="sel_qna_page">
				<button class="entity">&lt;</button>
				<button class="page_num">1</button>
				<button class="page_num">2</button>
				<button class="page_num">3</button>
				<button class="entity">&gt;</button>
			</div>
		</article> -->
	</div>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".qna_head").click(function() {
					$(this).parent().find("article:nth-of-type(2)").toggle();		
			});		
	});
	</script>
	<script type="text/javascript">
	function qna_write() {
		location.href = "qna_write";
	}
	function reply_write_go() {
		if(${suvo.user_type } == 2){
			
		if(${qna_reply_status2} == 1){
			alert("답글은 하나만 가능합니다!!!!!!!!!");
			return;
		}
		location.href = "qna_reply_write?qna_idx2=${qna_idx2}";
		}else{
			alert("관리자만 답글을 작성 가능합니다.");
			return;
		}
		
	}
</script>
</body>
</html>