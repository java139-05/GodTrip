<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %> 

<h3>관광지소개수정</h3>
<form name="attraction" id="attraction" method="post" action="attractionupdate" enctype="multipart/form-data" >
 <table class="table table-hover">
<tr>
	<td>지역</td>
	<td>
		<select name="area_code">
			<option value="G0001">제주</option>
			<option value="G0002">서울</option>
			<option value="G0003">인천</option>
			<option value="G0004">수원</option>
			<option value="G0005">용인</option>
			<option value="G0006">가평</option>
			<option value="G0007">강릉</option>
			<option value="G0008">속초</option>
			<option value="G0009">추천</option>
			<option value="G0010">홍천</option>
			<option value="G0011">인제</option>
			<option value="G0012">태안</option>
			<option value="G0013">부여</option>
			<option value="G0014">서천</option>
			<option value="G0015">단양</option>
			<option value="G0016">부산</option>
			<option value="G0017">대구</option>
			<option value="G0018">경주</option>
			<option value="G0019">포항</option>
			<option value="G0020">통영거제</option>
			<option value="G0021">광주</option>
			<option value="G0022">해남</option>
			<option value="G0023">목포</option>
			<option value="G0024">여수</option>
			<option value="G0025">순천</option>
			<option value="G0026">담양</option>
			<option value="G00207">전주</option>
		</select>
</tr>
<tr>
	<td>관광지명</td>
	<td><input type="text" name="tour_name"></td>
</tr>
<tr>
	<td>키워드</td>
	<td>
		<select name="keyword">
			<option value="1">역사</option>
			<option value="2">액티비티</option>
			<option value="3">트래킹</option>
			<option value="4">관광</option>
			<option value="5">휴식</option>
			<option value="6">바다</option>
			<option value="7">자연</option>
		</select>
	</td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea name="content" rows="10" cols="20"></textarea></td>
</tr>
<tr>
	<td>관광지사진</td>
	<td><input type="file" name="img"></td>
</tr>
<tr>
	<td colsapn="2" align="center">
		<input type="button" value="취소" onclick="location.href='/attraction/attractionList'">
		<input type="submit" value="수정">
	</td>
</tr>


</table>
</form>
<!-- action취해짐-> insert라는 명령어 들어오면 insert함수 호출 -->


<%@ include file="../footer.jsp" %>