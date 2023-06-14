<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
.frmcontainer {
  margin-top: 50px;
  max-width: 500px;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f7f7f7;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


#title {
  font-size: 30px;
  margin-bottom: 20px;
}

#subtitle {
  font-size: 24px;
  margin-bottom: 20px;
  color: #555;
}

.btn {
  margin-top: 10px;
}

.btn-success {
  background-color: #28a745;
  border-color: #28a745;
}

.btn-warning {
  background-color: #ffc107;
  border-color: #ffc107;
}

.btn-success:hover {
  background-color: #218838;
  border-color: #1e7e34;
}

.btn-warning:hover {
  background-color: #e0a800;
  border-color: #d39e00;
}

.btn-primary:disabled {
  background-color: #6c757d;
  border-color: #6c757d;
  cursor: not-allowed;
}

input[type="text"],
select {
  width: 100%;
  padding: 8px;
  border-radius: 3px;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

input[type="submit"] {
  margin-top: 20px;
  padding: 10px 20px;
  background-color: #28a745;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}
</style>
</head>
<body>
		
		
  <div class="frmcontainer">
    <div id="title">결제</div>
    <div id="subtitle">결제수단</div>

    <form id="payment-form">
      <div class="form-group">
        <label for="payment-method">결제수단 선택</label>
        <div class="btn-group">
          <button type="button" class="btn btn-success disabled">신용카드</button>
          <button type="button" class="btn btn-warning disabled">KAKAOPAY</button>
        </div>
      </div>
      <div class="form-group">
        <label for="card-type">카드종류</label>
        <select class="form-control" id="card-type">
          <option value="">선택하세요</option>
          <option value="sh">신한</option>
          <option value="kb">국민</option>
          <option value="wr">우리</option>
        </select>
      </div>
      <div class="form-group">
        <label for="installments">할부기간</label>
        <select class="form-control" id="installments">
          <option value="">선택하세요</option>
          <option value="1">일시불</option>
          <option value="2">2개월</option>
          <option value="3">3개월</option>
          <option value="4">4개월</option>
          <option value="5">5개월</option>
          <option value="6">6개월</option>
        </select>
      </div>
      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" id="name" class="form-control">
      </div>
      <div class="form-group">
        <label for="booker-name">예약자 이름</label>
        <input type="text" id="booker-name" class="form-control">
      </div>
      <div class="form-group">
        <input type="submit" value="결제하기" class="btn btn-primary disabled">
      </div>
    </form>
  </div>
</body>
</html>
<script>
function iamport(){
	//가맹점 식별코드
	IMP.init('imp30544481');
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '항공권' , //결제창에서 보여질 이름
	    amount : 100000, //실제 결제되는 가격
	    buyer_email : 'yma1289@naver.com',
	    buyer_name : '김하윤',
	    buyer_tel : '010-7706-4231',
	    buyer_addr : '서울 강남구 역삼동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>
  

<%@ include file="../footer.jsp" %>
