<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<div class="container">
    <h3 class="display-5">고객센터</h3>
    <table class="table table-hover">
        <thead class="thead-light">
            <tr>
                <th>번호</th>
                <th>분류</th>
                <th>제목</th>
                <th>등록일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="service">
                <tr>
                    <td>${service.cno}</td>
                    <td>
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
                    </td>
                    <td><a href="<c:url value='/service/serviceDetail/${service.cno}' />">${service.title}</a></td>
                    <td><fmt:formatDate value="${service.regdate}" pattern="yyyy년 MM월 dd일" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == page}">
                    <button class="btn btn-info">${i}</button>
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/service/serviceList/${i}' />" class="btn btn-secondary">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
    <div class="text-center mt-4">
        <button onclick="location.href='/service/serviceUpdate'">글쓰기</button>
    </div>
</div>

<%@ include file="../footer.jsp" %>
