<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>intro</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body, h1, h2, h3, h4, h5, h6 {
  font-family: "Raleway", sans-serif;
}

html {
  scroll-behavior: smooth;
}

body, html {
  height: 100%;
  line-height: 1.8;
}

.w3-bar .w3-button {
  padding: 16px;
}

.navbar {
  background-color: #f8f9fa !important;
}

.navbar-brand {
  font-weight: bold;
  color: #1cc3ff;
}

.navbar-nav .nav-item .nav-link {
  color: #008bbe;
}

.card {
  border-radius: 0;
  box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.card-header {
  background-color: #1cc2ff;
  color: white;
}

.card-img-top {
  height: 200px;
  object-fit: cover;
}

h3 {
  color: #19b3eb;
  font-weight: bold;
}

footer {
  background-color: #f8f9fa;
}

footer p {
  color: #ffffff;
  font-weight: bold;
}

/* Custom styling for the "내만패 시작하기" button */
.w3-custom-button {
  background-color: #008bbe;
  color: white;
  border-radius: 8px;
  padding: 16px 24px;
  font-size: 18px;
  transition: background-color 0.3s ease;
}

.w3-custom-button:hover {
  background-color: #1cc3ff;
}

</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-md navbar-light">
  <div class="container">
    <a class="navbar-brand" href="/home.do">God 지은여행</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#myNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="../product/">내만패</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">여행추천</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../attraction/attractionList">관광지소개</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../review/reviewList">여행후기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../service/serviceList">고객센터</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../member/memberList">마이페이지</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">로그인</a>
          <div class="dropdown-menu dropdown-menu-right">
            <a class="dropdown-item" href="../partner/partnerlogin">판매자로그인</a>
            <a class="dropdown-item" href="../member/memberlogin">회원로그인</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Header -->
