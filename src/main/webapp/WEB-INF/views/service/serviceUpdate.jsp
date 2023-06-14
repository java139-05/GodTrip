<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>

<h3 class="display-5">고객센터 게시글 수정</h3>

<c:if test="${sessionScope.member.mlevel == 'A1'}">
	<form action="/service/serviceInsert" method="post">
        <table>
            <tr>
                <td>분류</td>
                <td><input type="text" name="c_code" /></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content"></textarea></td>
            </tr>
            <tr>
                <td>등록일</td>
                <td><input type="text" name="regdate" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="update" /></td>
            </tr>
        </table>
    </form>
</c:if>

<c:if test="${sessionScope.member.mlevel != 'A1'}">
    <p>죄송합니다. 관리자만 게시할 수 있습니다.</p>
</c:if>


<a href="serviceList">목록</a>

</body>
</html>
