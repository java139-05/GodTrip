<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form name="memfrm" id="memfrm" method="post" action="insert" >
<table class="table">
<tr>
	<th>*아이디</th>
	<td style="text-align: left">
	<input type="text" name="p_ID" id="p_ID" size="10" maxlength="10" >
	<input type="button" value="ID중복확인">
	</td>
</tr>
<tr>
	<th>*비밀번호</th>
	<td style="text-align: left">
		<input type="password" name="p_passwd" id="p_passwd" size="10" maxlength="10" required>
	</td>
</tr>

<tr>
	<th>*이름</th>
	<td style="text-align: left">
	<input type="text" name="p_name" id="p_name" size="20" maxlength="20" required>
	</td>
</tr>

<tr>
	<th>*이메일</th>
	<td style="text-align: left">
	<input type="text" name="p_email" id="p_email" size="10" maxlength="50" >
	<input type="button" value="Email중복확인" >
	</td>
</tr>

<tr>
	<th>전화번호</th>
	<td style="text-align: left">
	<input type="text" name="p_tel" id="p_tel" size="15" maxlength="14">
	</td>
</tr>

<tr>
	<th>사업자번호</th>
	<td style="text-align: left">
	<input type="text" name="p_info" id="p_info" size="15" >
	</td>
</tr>

<tr>  
  <th>판매자 카태고리</th>
  <td style="text-align: left">
        <select name="p_grade"  id="p_grade">
          <option value="B">기차</option>
          <option value="D">숙박</option>
          <option value="C" selected>비행기</option>
        </select>
  </td>
</tr>


<tr>
<td colspan="2">
	<input type="submit" value="회원가입" class="btn btn-primary"/>
	<input type="reset" value="취소" class="btn btn-primary"/>
</td>
</tr>
</table>
</form>

<%@ include file="../footer.jsp" %>