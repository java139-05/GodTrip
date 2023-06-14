<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %> 


<h2>교통상품</h2>

<tr>
<td>
출발일 <input type="date" name="startday">
</td>
</tr>

<tr>
	<td>출발지</td>
	<td>
		<select name="departure_code">
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
		</select>
	<td>도착지</td>
	<td>
		<select name="arrival_code">
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
		</select>
</tr>





















<%@ include file="../footer.jsp" %>

