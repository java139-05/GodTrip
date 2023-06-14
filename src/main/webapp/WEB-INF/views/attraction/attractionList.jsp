<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %> 

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
<p>
검색창넣기
</p>
<div class="container">
<h3>관광지소개</h3>
  <table class="table table-hover">
<thead>
<tr>
	<th><a href="detail/${row.tour_code}">${row.tour_name}</a>관광지명</th>
	<th>지역</th>
	<th>작성일</th>
	<th>조회수</th>
	<th>키워드</th>
</tr>	
</thead>
	
<c:forEach var="dto" items="${attractionList}">
	<tr>
		<td>${dto.tour_name}</td>
		<td>${dto.area_code}</td>
		<td>${dto.regdate}</td>
		<td>${dto.view_count}</td>
		<td>${dto.keyword}</td> 
	</tr>
</c:forEach>
</table>
</div>

<p>
<button type="button" onclick="location.href='attractionForm'">등록</button>
</p>
</body>
</html>
