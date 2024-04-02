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
<link rel="stylesheet" href="resources/khj-css/claim.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="s_menu">
			<a href="qna">QnA</a>
			<a href="faq">FaQ</a>
			<a href="clail">Claim</a>
	</div>
	<div id="s_display"><p>Claim(s_menu 누르면 창 바뀌고 누른거 표시)</p></div>
	<div id="claim_block">
		<div>
			<article class="claim_head">
				<div class="claim_num">
					<a>num</a>
				</div>
				<div class="user_id">
					<a>아이디</a>
				</div>
				<div class="claim_created_date">
					<a>작성일</a>
				</div>
				<div class="claim_subject">
					<p>향수가 부서져서 왔어요.</p>
				</div>
				<div class="claim_reply_status">
					<a>답변상태</a>
				</div>
			</article>
			<article class="claim_body">
				<div class="claim_content">
					<p><span>신고글 : </span>포장을 뜯어보니 향수 병이 깨졌는데 포장 상태가 충격 
					방지 폼이 없이 에어캡으로만 돼있어요. 새 제품 보내주세요. 꼭 안 깨지게 포장 부탁드려요. </p>
					<div class="claim_reply">
						<hr>
					<p><span>답글 : </span>죄송합니다. 바로 포장해서 새 제품으로 보내드리겠습니다. 
					저희도 포장의 문제점을 인지하고 현재 충격방지 폼을 제작하고 있는 중입니다. 불편 드린점
					다시 한번 사과드립니다.  다시 문제가 생기지 않도록 최대한 빠른 시일내에 개선 하겠습니다.</p>
					</div>
				</div>
			</article>
		</div>
		
	
		<div>
			<article class="claim_head">
				<div class="claim_num">
					<a>num</a>
				</div>
				<div class="user_id">
					<a>아이디</a>
				</div>
				<div class="claim_created_date">
					<a>작성일</a>
				</div>
				<div class="claim_subject">
					<p>향수가 부서져서 왔어요.</p>
				</div>
				<div class="claim_reply_status">
					<a>답변상태</a>
				</div>
			</article>
			<article class="claim_body">
				<div class="claim_content">
					<p><span>신고글 : </span>포장을 뜯어보니 향수 병이 깨졌는데 포장 상태가 충격 
					방지 폼이 없이 에어캡으로만 돼있어요. 새 제품 보내주세요. 꼭 안 깨지게 포장 부탁드려요. </p>
					<div class="claim_reply">
						<hr>
					<p><span>답글 : </span>죄송합니다. 바로 포장해서 새 제품으로 보내드리겠습니다. 
					저희도 포장의 문제점을 인지하고 현재 충격방지 폼을 제작하고 있는 중입니다. 불편 드린점
					다시 한번 사과드립니다.  다시 문제가 생기지 않도록 최대한 빠른 시일내에 개선 하겠습니다.</p>
					</div>
				</div>
			</article>
		</div>
		
	
		<div>
			<article class="claim_head">
				<div class="claim_num">
					<a>num</a>
				</div>
				<div class="user_id">
					<a>아이디</a>
				</div>
				<div class="claim_created_date">
					<a>작성일</a>
				</div>
				<div class="claim_subject">
					<p>향수가 부서져서 왔어요.</p>
				</div>
				<div class="claim_reply_status">
					<a>답변상태</a>
				</div>
			</article>
			<article class="claim_body">
				<div class="claim_content">
					<p><span>신고글 : </span>포장을 뜯어보니 향수 병이 깨졌는데 포장 상태가 충격 
					방지 폼이 없이 에어캡으로만 돼있어요. 새 제품 보내주세요. 꼭 안 깨지게 포장 부탁드려요. </p>
					<div class="claim_reply">
						<hr>
					<p><span>답글 : </span>죄송합니다. 바로 포장해서 새 제품으로 보내드리겠습니다. 
					저희도 포장의 문제점을 인지하고 현재 충격방지 폼을 제작하고 있는 중입니다. 불편 드린점
					다시 한번 사과드립니다.  다시 문제가 생기지 않도록 최대한 빠른 시일내에 개선 하겠습니다.</p>
					</div>
				</div>
			</article>
		</div>
		
	
		<div>
			<article class="claim_head">
				<div class="claim_num">
					<a>num</a>
				</div>
				<div class="user_id">
					<a>아이디</a>
				</div>
				<div class="claim_created_date">
					<a>작성일</a>
				</div>
				<div class="claim_subject">
					<p>향수가 부서져서 왔어요.</p>
				</div>
				<div class="claim_reply_status">
					<a>답변상태</a>
				</div>
			</article>
			<article class="claim_body">
				<div class="claim_content">
					<p><span>신고글 : </span>포장을 뜯어보니 향수 병이 깨졌는데 포장 상태가 충격 
					방지 폼이 없이 에어캡으로만 돼있어요. 새 제품 보내주세요. 꼭 안 깨지게 포장 부탁드려요. </p>
					<div class="claim_reply">
						<hr>
					<p><span>답글 : </span>죄송합니다. 바로 포장해서 새 제품으로 보내드리겠습니다. 
					저희도 포장의 문제점을 인지하고 현재 충격방지 폼을 제작하고 있는 중입니다. 불편 드린점
					다시 한번 사과드립니다.  다시 문제가 생기지 않도록 최대한 빠른 시일내에 개선 하겠습니다.</p>
					</div>
				</div>
			</article>
		</div>
		
	
		<div>
			<article class="claim_head">
				<div class="claim_num">
					<a>num</a>
				</div>
				<div class="user_id">
					<a>아이디</a>
				</div>
				<div class="claim_created_date">
					<a>작성일</a>
				</div>
				<div class="claim_subject">
					<p>향수가 부서져서 왔어요.</p>
				</div>
				<div class="claim_reply_status">
					<a>답변상태</a>
				</div>
			</article>
			<article class="claim_body">
				<div class="claim_content">
					<p><span>신고글 : </span>포장을 뜯어보니 향수 병이 깨졌는데 포장 상태가 충격 
					방지 폼이 없이 에어캡으로만 돼있어요. 새 제품 보내주세요. 꼭 안 깨지게 포장 부탁드려요. </p>
					<div class="claim_reply">
						<hr>
					<p><span>답글 : </span>죄송합니다. 바로 포장해서 새 제품으로 보내드리겠습니다. 
					저희도 포장의 문제점을 인지하고 현재 충격방지 폼을 제작하고 있는 중입니다. 불편 드린점
					다시 한번 사과드립니다.  다시 문제가 생기지 않도록 최대한 빠른 시일내에 개선 하겠습니다.</p>
					</div>
				</div>
			</article>
		</div>
		
	
		<div>
			<article class="claim_head">
				<div class="claim_num">
					<a>num</a>
				</div>
				<div class="user_id">
					<a>아이디</a>
				</div>
				<div class="claim_created_date">
					<a>작성일</a>
				</div>
				<div class="claim_subject">
					<p>향수가 부서져서 왔어요.</p>
				</div>
				<div class="claim_reply_status">
					<a>답변상태</a>
				</div>
			</article>
			<article class="claim_body">
				<div class="claim_content">
					<p><span>신고글 : </span>포장을 뜯어보니 향수 병이 깨졌는데 포장 상태가 충격 
					방지 폼이 없이 에어캡으로만 돼있어요. 새 제품 보내주세요. 꼭 안 깨지게 포장 부탁드려요. </p>
					<div class="claim_reply">
						<hr>
					<p><span>답글 : </span>죄송합니다. 바로 포장해서 새 제품으로 보내드리겠습니다. 
					저희도 포장의 문제점을 인지하고 현재 충격방지 폼을 제작하고 있는 중입니다. 불편 드린점
					다시 한번 사과드립니다.  다시 문제가 생기지 않도록 최대한 빠른 시일내에 개선 하겠습니다.</p>
					</div>
				</div>
			</article>
		</div>
		
	
		<div>
			<article class="claim_head">
				<div class="claim_num">
					<a>num</a>
				</div>
				<div class="user_id">
					<a>아이디</a>
				</div>
				<div class="claim_created_date">
					<a>작성일</a>
				</div>
				<div class="claim_subject">
					<p>향수가 부서져서 왔어요.</p>
				</div>
				<div class="claim_reply_status">
					<a>답변상태</a>
				</div>
			</article>
			<article class="claim_body">
				<div class="claim_content">
					<p><span>신고글 : </span>포장을 뜯어보니 향수 병이 깨졌는데 포장 상태가 충격 
					방지 폼이 없이 에어캡으로만 돼있어요. 새 제품 보내주세요. 꼭 안 깨지게 포장 부탁드려요. </p>
					<div class="claim_reply">
						<hr>
					<p><span>답글 : </span>죄송합니다. 바로 포장해서 새 제품으로 보내드리겠습니다. 
					저희도 포장의 문제점을 인지하고 현재 충격방지 폼을 제작하고 있는 중입니다. 불편 드린점
					다시 한번 사과드립니다.  다시 문제가 생기지 않도록 최대한 빠른 시일내에 개선 하겠습니다.</p>
					</div>
				</div>
			</article>
		</div>
		
	
		<div>
			<article class="claim_head">
				<div class="claim_num">
					<a>num</a>
				</div>
				<div class="user_id">
					<a>아이디</a>
				</div>
				<div class="claim_created_date">
					<a>작성일</a>
				</div>
				<div class="claim_subject">
					<p>향수가 부서져서 왔어요.</p>
				</div>
				<div class="claim_reply_status">
					<a>답변상태</a>
				</div>
			</article>
			<article class="claim_body">
				<div class="claim_content">
					<p><span>신고글 : </span>포장을 뜯어보니 향수 병이 깨졌는데 포장 상태가 충격 
					방지 폼이 없이 에어캡으로만 돼있어요. 새 제품 보내주세요. 꼭 안 깨지게 포장 부탁드려요. </p>
					<div class="claim_reply">
						<hr>
					<p><span>답글 : </span>죄송합니다. 바로 포장해서 새 제품으로 보내드리겠습니다. 
					저희도 포장의 문제점을 인지하고 현재 충격방지 폼을 제작하고 있는 중입니다. 불편 드린점
					다시 한번 사과드립니다.  다시 문제가 생기지 않도록 최대한 빠른 시일내에 개선 하겠습니다.</p>
					</div>
				</div>
			</article>
		</div>
	</div>
	<div id="sel_claim_page"> 
			<button class="entity">&lt;</button>
			<button class="page_num">1</button>
			<button class="page_num">2</button>
			<button class="page_num">3</button>
			<button class="entity">&gt;</button>
		</div>
	<script type="text/javascript">
		$(".claim_head").click(
				function() {
					$(this).parent().find("article:nth-of-type(2)").fadeToggle(
							500, function() {$(this).css("display", "block")
						})
					})
		$(".claim_body").click(function() {
			$(this).fadeOut(500, function() {
				$(this).css("display", "none")
			})
		})
	</script>
</body>
</html>