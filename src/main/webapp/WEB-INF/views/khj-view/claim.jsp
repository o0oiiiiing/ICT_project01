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
<link rel="stylesheet" href="resources/khj-css/claim.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="s_menu">
			<a href="qna">QnA</a>
			<a href="faq">FaQ</a>
			<a href="claim">Claim</a>
	</div>
	<div id="bbs" align="center">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty claim_list }">
						<tr><td colspan="5"><h3>게시물이 존재하지 않습니다</h3> </td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${bbs_list}" varStatus="vs">
							<tr>
								<td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + vs.index )}</td>
								<td>
								    <c:choose>
								    	<c:when test="${k.active == 1 }">
								    		<span style="color: lightgray">삭제된 게시물</span>
								    	</c:when>
								    	<c:otherwise>
								    	    <a href="bbs_detail.do?b_idx=${k.b_idx}&cPage=${paging.nowPage}">${k.subject}</a>
								    	 </c:otherwise>
								    </c:choose> 
								</td>
								<td>${k.writer}</td>
								<td>${k.write_date.substring(0,10)}</td>
								<td>${k.hit}</td>
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
						    		<li><a href="bbs_list.do?cPage=${paging.beginBlock - paging.pagePerBlock }">이전으로</a></li>
						    	</c:otherwise>
						    </c:choose>
						    <!-- 블록안에 들어간 페이지번호들 -->
						    <c:forEach begin="${paging.beginBlock }" end="${paging.endBlock }" step="1" var="k">
						    	<%-- 현재 페이지이면 링크 X , 나머지 페이지는 링크 O --%>
						    	<c:if test="${k == paging.nowPage }">
						    		<li class="now">${k }</li>
						    	</c:if>
						    	<c:if test="${k != paging.nowPage }">
						    		<li><a href="bbs_list.do?cPage=${k}">${k}</a></li>
						    	</c:if>
						    </c:forEach>
							<!-- 다음 -->
							<c:choose>
						    	<c:when test="${paging.endBlock >= paging.totalPage }">
						    		<li class="disable">다음으로</li>
						    	</c:when>
						    	<c:otherwise>
						    		<li><a href="bbs_list.do?cPage=${paging.beginBlock + paging.pagePerBlock }">다음으로</a></li>
						    	</c:otherwise>
						    </c:choose>
						</ol>
					</td>
					<td>
						<input type="button" value="글쓰기" onclick="claim_wr()" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>