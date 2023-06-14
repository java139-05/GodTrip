<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<div class="container">
    <h3 class="display-5">고객센터 상세</h3>
    <table class="table">
        <thead class="thead-light">
        <tr>
        <th>${service.cno}</th>
        <th>
            <c:choose>
                <c:when test="${service.c_code == '0'}">
                    공지사항
                </c:when>
                <c:when test="${service.c_code == '1'}">
                    자주묻는질문
                </c:when>
                <c:otherwise>
                    ${service.c_code}
                </c:otherwise>
            </c:choose>
        </th>
        <th>${service.title}</th>
        <th><fmt:formatDate value="${service.regdate}" pattern="yyyy년 MM월 dd일" /></th>
        </tr>
        </thead>
        <tbody>
        <tr>
        	<td colspan='4'>${service.content}</td>
        </tr>
    </tbody>
    </table>
    <div class="text-center mt-4">
    <%-- 관리자만 수정,삭제버튼보임/전체코딩후수정예정 <c:if test="${sessionScope.member.mlevel == 'A1'}"></c:if> --%>
    <button onclick="location.href='/service/serviceUpdate/${service.cno}'">수정</button>
    <button onclick="location.href='/service/serviceDelete/${service.cno}'">삭제</button>
    <input type="button" value="목록" onclick="location.href='/service/serviceList'">
    </div>
</div>

<%@ include file="../footer.jsp" %>