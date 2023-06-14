<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!DOCTYPE html>
<html>
<head>
<title>관광지 소개 리스트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<!-- <a href="url"><img src="이미지경로" border="0"></a>   -->

<h3>관광지소개</h3>
<form method="post" action="search">
		<input type="text" name="tour_name" value="${tour_name}">
		 <input type="submit" value="검색">
</form>
<table border="1">
	<tr>
		<!-- varStatus="상태용 변수" -->
		<c:forEach var="row" items="${list}" varStatus="vs">
			<td>
				<c:choose>
					<c:when test="${row.FILENAME != '-'}">
						<img src="/storage/${row.FILENAME}" width="100px">
					</c:when>
					<c:otherwise>
						등록된 사진 없음!<br>
					</c:otherwise>
				</c:choose>
				<br>
				관광지명 : <a href="attractionDetail/${row.TOUR_CODE}">${row.TOUR_NAME}</a>
			
			<!-- 테이블 한 줄에 5행씩 -->
			<c:if test="${vs.count mod 3 == 0}">
				<tr></tr>
			</c:if>
		</c:forEach>
	</tr>
	</table>





<button type="button" onclick="location.href='attractionForm'">등록</button>



</body>
</html>