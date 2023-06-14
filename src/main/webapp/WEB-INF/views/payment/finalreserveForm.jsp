<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<style>
#reservation-header {
  color: dodgerblue;
  font-size: 30px;
  text-align: center;
  margin-top: 30px;
}
</style>
</head>
<body>
<h3>최종예약확인</h3>
<div id="reservation-header">예약이 완료되었습니다</div>

<div class="container mt-4">
<table class="table">
  <tbody>
    <c:forEach items="${list}" var="finalreserve">
      <tr class="thead-light">
        <th>예약번호</th>
        <td>${finalreserve.fno}</td>
      </tr>
      <tr class="thead-light">
        <th>아이디</th>
        <td>${finalreserve.paycode}</td>
      </tr>
      <tr class="thead-light">
        <th>결제일자</th>
        <td>${finalreserve.transpro_code}</td>
      </tr>
      <tr class="thead-light">
        <th>여행지</th>
        <td>${finalreserve.transinfo}</td>
      </tr>
      <tr class="thead-light">
        <th>일정</th>
        <td>${finalreserve.room_code}</td>
      </tr>
      <tr class="thead-light">
        <th>예약내역</th>
        <td>
          항공편: 제주항공 08:40 - 09:40<br>
          좌석번호: A04<br>
          숙소: 홈스랜드 펜션 102동
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>
</div>
<div class="form-group d-flex justify-content-center">
  <input type="button" value="홈으로" class="btn btn-info disabled" onclick="location.href='/home.do'">
  <input type="button" value="마이페이지" class="btn btn-warning disabled" onclick="location.href=''">
</div>

</body>
</html>

<%@ include file="../footer.jsp" %>
