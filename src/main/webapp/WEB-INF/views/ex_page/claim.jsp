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
	function claim_wr() {
		location.href="claim_wr";
	}
</script>
<!-- css -->
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/kch-css/claim.css">
<style type="text/css">
#claim_form table {
	width:850px;
	margin:0 auto;
	margin-top:20px;
	margin-bottom : 20px;
	padding : 5px;
	border: 1px solid black;
	border-radius : 10px;
	border-collapse: collapse;
	font-size: 18px;
}
.claim_title th{
	font-size: 25px;
	padding: 5px;
	padding-bottom: 10px;
}

#claim_form table tr, #claim table th, #claim table td {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
}

/* paging */
table tfoot ol.paging {
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid black;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}

	.no {width:15%; }
	.writer {width:20%; }
	.subject {width:25%;}
	.reg {width:25%; }
	.ree {width:15%; }
	
.content_css{
	height: 15px;
	font-size: 20px;
	margin :10px;
	padding-bottom: 10px;
}	

tbody{
	height: 200px;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="s_menu">
			<a href="qna">QnA</a>
			<a href="faq">FaQ</a>
			<a href="claim">Claim</a>
	</div>
	<div id="claim_form" align="center">
		<table summary="게시판 목록">
			<thead>
				<tr class="claim_title">
					<th class="no">번호</th>
					<th class="writer">글쓴이</th>
					<th class="subject">제목</th>
					<th class="reg">날짜</th>
					<th class="ree">답변상태</th>
				</tr>
			</thead>
			<tbody class="content_css">
				<c:choose>
					<c:when test="${empty claimlist }">
						<tr><td colspan="4"><h3>게시물이 존재하지 않습니다</h3> </td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${claimlist}" varStatus="vs">
							<tr>
								<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index )}</td>
								<td>${k.user_id}</td>
								<td>
								   <a href="claim_detail?claim_idx=${k.claim_idx}&cPage=${paging.nowPage}">${k.claim_subject}</a>
								</td>
								<td>${k.claim_created_date.substring(0,10)}</td>
								<c:choose>
								<c:when test="${k.claim_res == 0}">
								<td style="color: blue;">답변대기</td>
								</c:when>
								<c:otherwise>
									<td style="color: red;">답변완료</td>
								</c:otherwise>
								</c:choose>							
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<!-- 페이지기법 -->
			<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
						    <!-- 이전 -->
						    <c:choose>
						    	<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
						    		<li class="disable">이전으로</li>
						    	</c:when>
						    	<c:otherwise>
						    		<li><a href="claim?cPage=${paging.beginBlock - paging.pagePerBlock }">이전으로</a></li>
						    	</c:otherwise>
						    </c:choose>
						    <!-- 블록안에 들어간 페이지번호들 -->
						    <c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
						    	<%-- 현재 페이지이면 링크 X , 나머지 페이지는 링크 O --%>
						    	<c:if test="${k == paging.nowPage }">
						    		<li class="now">${k }</li>
						    	</c:if>
						    	<c:if test="${k != paging.nowPage }">
						    		<li><a href="claim?cPage=${k}">${k}</a></li>
						    	</c:if>
						    </c:forEach>
							<!-- 다음 -->
							<c:choose>
						    	<c:when test="${paging.endBlock >= paging.totalPage }">
						    		<li class="disable">다음으로</li>
						    	</c:when>
						    	<c:otherwise>
						    		<li><a href="claim?cPage=${paging.beginBlock + paging.pagePerBlock }">다음으로</a></li>
						    	</c:otherwise>
						    </c:choose>
						</ol>
					</td>
				<c:choose>
					<c:when test="${ssuvo.user_type != null}">	
						<td>
							<input type="button" value="글쓰기" onclick="claim_wr()" />
						</td>
					</c:when>
				</c:choose>
				</tr>
			</tfoot>
		</table>
	</div>
	<div>
	<span id="claim_con" style="cursor: pointer;" onclick="if(plain.style.display=='none')
	{plain.style.display=''; claim_con.innerText = '${k.claim_subject}';} 
	else {plain.style.display = 'none'; claim_con.innerText = '${k.claim_subject}';}">
	뭐야양 + ${k.claim_subject}</span>
	</div>
</body>
</html>

















