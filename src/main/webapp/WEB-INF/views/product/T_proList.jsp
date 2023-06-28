<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>                                                                                                                                                                                                                                                                                                                                                                                                                          
<%@ include file="../pheader.jsp" %>  
<!-- 본문시작 -->

<style>
	table {
		border-collapse: separate;
		border-spacing: 0 1rem;
	}
	
	th, td {
		padding-top: 10px;
		padding-right: 20px;
	}
	
	.wrap {
		  width: 100%;
		  height: 80vh;
		  display: flex;
		  background: rgba(0, 0, 0, 0);
	}
</style>

<div>
<div class="col-sm-12">
	<div class="container" style="padding-top: 30px">
	 <br>
	 <h3><strong>기차 상품목록</strong></h3>
	</div>
		
	
	<div class="container" style="padding-top: 20px">	
	 <table class="table">
	  <thead>
	   <tr>
		<th class="text-center">항공/기차편명</th>
		<th class="text-center">항공/기차이름</th>
		<th class="text-center">출발일</th>
		<th class="text-center">출발지</th>
		<th class="text-center">도착지</th>
		<th class="text-center">출발시간</th>
		<th class="text-center">도착시간</th>		
		<th class="text-center">가격</th>
		<th class="text-center">잔여좌석</th>			
		<th class="text-center">삭제</th>
	   </tr>
	  </thead>
	  
	  <tbody>
	   <c:forEach var="T_pro" items="${T_proList}">
	   <tr class="text-center">		
		<td>${T_pro.trans_code}</td>
		<td>${T_pro.trans_name}</td>
		<td>${T_pro.departure_Date}</td>
		
		<td>
			<c:choose>
				<c:when test="${T_pro.departure_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${T_pro.departure_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${T_pro.departure_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${T_pro.departure_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${T_pro.departure_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${T_pro.departure_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0009'}">
					대전
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0010'}">
					남원
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${T_pro.departure_code == 'G0019'}">
					전주
				</c:when>
				<c:otherwise>
					${T_pro.departure_code}
				</c:otherwise>
			</c:choose>
		</td>		
		<td>
			<c:choose>
				<c:when test="${T_pro.arrival_code == 'G0001'}">
					제주
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0002'}">
					서울
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0003'}">
					인천
				</c:when>	
				<c:when test="${T_pro.arrival_code == 'G0004'}">
					수원
				</c:when>	
				<c:when test="${T_pro.arrival_code == 'G0005'}">
					가평
				</c:when>	
				<c:when test="${T_pro.arrival_code == 'G0006'}">
					강릉
				</c:when>	
				<c:when test="${T_pro.arrival_code == 'G0007'}">
					춘천
				</c:when>	
				<c:when test="${T_pro.arrival_code == 'G0008'}">
					제천
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0009'}">
					대전
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0010'}">
					남원
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0011'}">
					군산
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0012'}">
					영월
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0013'}">
					부산
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0014'}">
					경주
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0015'}">
					포항
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0016'}">
					통영거제
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0017'}">
					목포
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0018'}">
					여수
				</c:when>
				<c:when test="${T_pro.arrival_code == 'G0019'}">
					전주
				</c:when>
				<c:otherwise>
					${T_pro.arrival_code}
				</c:otherwise>
			</c:choose>		
		</td>		
		<td>${T_pro.departure_Time}</td>
		<td>${T_pro.arrival_Time}</td>
		<td>${T_pro.Price}</td>
		<td>${T_pro.seat}</td>		
		<td>
			<!-- 삭제버튼은 판매자에게만 노출될 수 있게 해야함! -->
			<input type="button" class="btn btn-danger" value="삭제" onclick="confirmDelete('${T_pro.transpro_code}')">
		</td>		
	   </tr>	   
	   </c:forEach>
	  </tbody> 	
	 </table>	 	
	</div>		
</div>
</div>

<script>
	function confirmDelete(transpro_code){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href='/partner/T_proDelete?transpro_code='+transpro_code;
		}//if end
	}//confirmDelete() end
</script>

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>