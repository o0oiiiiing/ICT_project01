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
	<div id="t_menu">
		<a>문의하기</a>
	</div>
	<div id="s_menu">
		<a style="font-size: 32px;">QnA</a>
		<a style="font-size: 32px;" href="faq" >FaQ</a>
		<a style="font-size: 32px;" href="claim">Claim</a>
	</div>
	<div id="dis_but">
		<div id="s_display">
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
					<c:choose>
						<c:when test="${k.secret == '1'}">
							<div class="secret_div">
								<span>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index )}</span>
								<span>${k.user_id}</span>
								<div>${k.qna_created_date.substring(0,10)}</div>
								<span>비밀글입니다.</span>
								<input type="password" placeholder="비밀번호를 입력해주세요"
								style="width: 20%; padding: 3px;">
								<button type="button" class="secret_btn">확인</button>
								<input type="hidden" value="${k.qna_idx}">
								<c:choose>
									<c:when test="${k.qna_reply_status == '0'}">
										<span style="color: red;">답변 대기</span>
									</c:when>
									<c:otherwise>
										<span style="color: blue;">답변 완료</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="secret_res" style="display: none;">
								<article class="qna_head">
									<div class="qna_num">
										<p>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index )}</p>
									</div>
									<div class="user_id">
										<p>${k.user_id}</p>
									</div>
									<div class="qna_created_date">
										<p>${k.qna_created_date.substring(0,10)}</p>
									</div>
									<div class="user_id">
										<p>비밀글</p>
									</div>
									<div class="qna_subject">
										<p>${k.qna_subject}</p>
									</div>
									<div class="qna_reply_status">
										<p>
											<c:choose>
												<c:when test="${k.qna_reply_status == '0'}">
													<span style="color: red;">답변 대기</span>
												</c:when>
												<c:otherwise>
													<span style="color: blue;">답변 완료</span>
												</c:otherwise>
											</c:choose>
										</p>
									</div>
								</article>
								<c:choose>
									<c:when test="${empty k.reply_list}">
										<article class="qna_body">
											<div class="qna_content">
												<p>
												<span>질문글 : </span>${k.qna_content } <br>
													<input type="button" onclick="reply_write_go(${k.qna_idx})" value="답글작성">
												</p>
											</div>
										</article>
									</c:when>
									<c:otherwise>
										<article class="qna_body">
											<div class="qna_content">
												<p>
												<span>질문글 : </span>${k.qna_content } <br>
												<span>답변 : ${k.reply_list[0].user_id}</span>
												<span>답변일자 : ${k.reply_list[0].qna_reply_date.substring(0,10)}</span>
												</p>
												<div class="qna_reply">
													<hr>
													<p>
														<span>답글 : </span>${k.reply_list[0].qna_reply_content}
													</p>
												</div>
											</div>
										</article>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:otherwise>
							<div class="reply_res">
								<article class="qna_head">
									<div class="qna_num">
										<p>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index )}</p>
									</div>
									<div class="user_id">
										<p>${k.user_id}</p>
									</div>
									<div class="qna_created_date">
										<p>${k.qna_created_date.substring(0,10)}</p>
									</div>
									<div class="qna_subject">
										<p>${k.qna_subject}</p>
									</div>
									<div class="qna_reply_status">
										<p>
											<c:choose>
												<c:when test="${k.qna_reply_status == '0'}">
													<span style="color: red;">답변 대기</span>
												</c:when>
												<c:otherwise>
													<span style="color: blue;">답변 완료</span>
												</c:otherwise>
											</c:choose>						
										</p>
									</div>
								</article>
								<c:choose>
									<c:when test="${empty k.reply_list}">
										<article class="qna_body">
											<div class="qna_content">
												<p>
												<span>질문글 : </span>${k.qna_content} <br>
													<input type="button" onclick="reply_write_go(${k.qna_idx})" value="답글작성">
												</p>
											</div>
										</article>
									</c:when>
									<c:otherwise>
										<article class="qna_body">
											<div class="qna_content">
												<p>
												<span>질문글 : </span>${k.qna_content } <br>
												<span>답변 : ${k.reply_list[0].user_id}</span>
												<span>답변일자 : ${k.reply_list[0].qna_reply_date.substring(0,10)}</span>
												</p>
												<div class="qna_reply">
													<hr>
													<p>
														<span>답글 : </span>${k.reply_list[0].qna_reply_content}
													</p>
												</div>
											</div>
										</article>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
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
								onclick="location.href='qna?cPage=${k}'">${k}
							</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${paging.endBlock >= paging.totalPage}">
						<button class="disable">&gt;</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="page_num"
							onclick="location.href='qna?cPage=${paging.beginBlock + paging.pagePerBlock }'">
						</button>
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
		if (${ssuvo == null}) {
			alert("로그인 후 이용 가능합니다.")
			return false;
		}else {
			location.href = "qna_write";
		}
	}
	function reply_write_go(qna_idx) {
		if(${ssuvo == null }){
			alert("로그인 후 이용해주세요")
		}else if (${ssuvo.user_type != '2'}) {
			alert("관리자만 작성 가능합니다.");
			return;
		}else{
			location.href = "qna_reply_write?qna_idx="+qna_idx;
		}
		
	}
</script>
<script type="text/javascript">
$(document).ready(function() {
	$(".secret_btn").on("click", function() {
		let tag = this;
		let qna_idx = $(this).next().val();
		let pwd = $(this).prev().val();
		console.log(qna_idx);
		console.log(pwd);
		$.ajax({
			url : "secret",
			method : "post",
			dataType : "text",
			data : "qna_idx="+qna_idx+"&user_pwd="+pwd,
			success : function(data) {
				if (data == "1") {
					$(tag).parent().next().css("display", "block")
					
					$(tag).parent().css("display", "none")
					
				}else {
					alert("비밀번호가 틀립니다.")
				}
			},
			error: function() {
				alert("읽기 실패");
			}
		})
	})
	
	
})
</script>
</body>
</html>