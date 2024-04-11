<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/common-css/reset.css">
<link rel="stylesheet" href="resources/kch-css/claim_write.css">
<script type="text/javascript">
	function commentInsert(f) {
		console.log="${claimvo.claim_idx}";
		f.action="commentInsert";
		f.submit();
	}
	function commentDelete(f) {
		f.action="commentDelete";
		f.submit();
	}
</script>
</head>
<body>


		<form method="post">
		<div class="container">
			<div class="insert">
				<table>
					<caption>
						<h2>신고내용</h2>
					</caption>
					<tr>
						<td class="menu">아이디</td>
						<td class="userin">${claimvo.user_id}</td>
					</tr>
					<tr>
						<td class="menu">제목</td>
						<td class="userin">${claimvo.claim_subject }
						</td>
					</tr>
					<tr>
						<td class="menu">내용</td>
						<td><textarea rows="10" cols="60" id="claim_content" name="claim_content" 
						style="background-color: #f5f5f5" readonly>${claimvo.claim_content }</textarea>
						</td>
					</tr>
				</table>
				

			</div>

			<div class="create">
				<input type="hidden" name="claim_idx" value="${claimvo.claim_idx}">
				<input type="hidden" name="cPage" value="${cPage}">
				<input class="but4" type="button" value="목록" onclick="location.href='claim'"/>
			</div>
		</div>
		</form>
	
	
	<c:choose>
		<c:when test="${ssuvo.user_type==2}">	
		<%-- 댓글 입력 --%>
	<div style="padding: 10px; width: 580px; margin: 0 auto">
		<form method="post">
			<fieldset>
				<p>이름 : <input style="padding: 5px" type="text" name="cc_writer" value="${ssuvo.user_id}" readonly></p>
				<p>내용 : <textarea rows="3" cols="40" name="cc_content"></textarea>
				<input style="float: right;" type="button" value="저장" onclick="commentInsert(this.form)">
				</p>
				<!-- 댓글 저장시 어떤 원글의 댓글인지 저장해야 한다. -->
				<input type="hidden" name = "claim_idx" value="${claimvo.claim_idx}" >
			</fieldset>
		</form>
	</div>
	</c:when>
	</c:choose>
	
	<%-- 댓글 출력 --%>
	<div style="display: table; margin: 0 auto;">
		<c:forEach var="k" items="${comm_list}">
			<div style="border: 1px solid #cc00cc; width: 580px; margin: 5px; padding: 5px;" >
				<form method="post">
					<p>이름 : ${k.cc_writer}</p>
					<p>내용 : <pre>${k.cc_content}</pre></p>
					<p>날짜 : ${k.cc_date.substring(0,10)}
					<!-- 실제은 로그인 성공 && 글쓴 사람만 삭제할 수 있어야 한다. -->
				<c:choose>
					<c:when test="${ssuvo.user_type==2}">		
					<input style="float: right;" type="button" value="댓글삭제" onclick="commentDelete(this.form)">
					<input type="hidden" name = "cc_idx" value="${k.cc_idx}" >
					<input type="hidden" name = "claim_idx" value="${k.claim_idx}" >
				</c:when>
			</c:choose>
					</p>
				</form>
			</div>
		</c:forEach>
	</div>	
	
</body>
</html>













