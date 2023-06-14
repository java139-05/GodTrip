<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
  color: #007bff;
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

.container {
    padding-bottom: 50px;  /* 아래 패딩을 50px로 설정 */
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

<header class="w3-display-container w3-wide" id="home">
<img src="../images/header2.jpg" alt="header" class="w3-image" style="width:100%; max-height: 50vh;">
<div class="w3-display-middle w3-padding-large">
    <div class="w3-black w3-opacity w3-hover-opacity-off w3-padding-large w3-round-large ">
      <h1 class="w3-xlarge">나만의 여행패키지를 만들어보세요</h1>
      <hr class="w3-opacity">
      <p><button class="w3-button w3-block w3-green w3-round"  onclick="location.href='/memberForm'">바로가기</button></p>
    </div>
  </div>
</div>
      
  
</header>

<!-- area Section -->
<section id="projects" class="w3-container w3-padding-32">
  <div class="container">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">인기여행지</h3>
    <div class="row">
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <div class="card-header">강릉</div>
          <a href="#">
            <img src="../images/gangneung.png" alt="gangneung" class="card-img-top">
          </a>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <div class="card-header">제주</div>
          <a href="#">
            <img src="../images/jeju.png" alt="jeju" class="card-img-top">
          </a>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <div class="card-header">부산</div>
          <a href="#">
            <img src="../images/busan.png" alt="busan" class="card-img-top">
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- reviews Section -->
<section id="reviews" class="w3-container w3-padding-32">
  <div class="container">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">여행후기</h3>
    <div class="row">
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <a href="#">
            <img src="../images/review_gn.png" alt="House" class="card-img-top">
          </a>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <a href="#">
            <img src="../images/review_gj.png" alt="House" class="card-img-top">
          </a>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 mb-4">
        <div class="card">
          <a href="#">
            <img src="../images/review_hc.png" alt="House" class="card-img-top">
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="w3-container w3-center w3-opacity w3-margin-bottom">
  <h5>Find Us On</h5>
  <div class="w3-xlarge w3-padding-16">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" class="w3-hover-text-green">w3.css</a></p>
</footer>

<script>
// Tabs
function openLink(evt, linkName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("myLink");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(linkName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}

</script>

</body>
</html>

