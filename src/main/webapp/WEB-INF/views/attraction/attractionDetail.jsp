<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관광지소개 상세보기</title>
<script>
	
		function attraction_update() {
			document.productfrm.action="/attraction/update";
			document.productfrm.submit();
		}//product_update() end

		
		function attraction_delete() {
			if(confirm("영구히 삭제됩니다\n진행할까요?")){
				document.productfrm.action="/attraction/delete";
				document.productfrm.submit();
			}//if end
		}//product_delete() end
	</script>


</head>
<body>
<form name="attractionfrm" id="attractionfrm" method="post" enctype="multipart/form-data">
	    <table border="1">
	     <tr>
	        <td>관광지명</td>
	        <td> <input type="text" name="tour_name" value="${attraction.tour_name}"> </td>
	    </tr>
	    <tr>
	    	<td>작성일</td>
	    	<td><input type="text" name="rgdate" value=""></td>
	    </tr>
	     <tr>
	    	<td>조회수</td>
	    	<td><input type="text" name="view_count" value=""></td>
	    </tr>
	     <tr>
	        <td>관광지사진사진</td>
	        <td>
	            <c:if test="${attraction.FILENAME != '-'}">
                	<img src="/storage/${attraction.FILENAME}" width="100px">
            	</c:if>
            	<br>
	         	<input type="file" name="img"> 
	        </td>
	    </tr>
	   
	    <tr>
	        <td>내용</td>
	        <td> <input type="text" name="content" value="${attraction.content}"> </td>
	    </tr>
	   
	   
	    <tr>
	        <td colspan="2" align="center">
	            <!-- <input type="hidden" name="tour_code" value="${attraction.tour_code}">-->
	            <input type="button" value="수정"    onclick="attraction_update()"> 
	            <input type="button" value="삭제"    onclick="attraction_delete()"> 
	        </td>
	    </tr>    
	    </table>  
	</form>
	
	
	
	
	
	
	
	
	
	
	
	<hr>

	
	<!-- 댓글 -->
	<div>
		<label for="content">댓글</label>
		<form name="commentInsertForm" id="commentInsertForm">
			<div>
				<!-- 부모글번호 -->
				<input type="hidden" name="tour_code" id="tour_cide" value="${attraction.tour_code}">
				<input type="text" name="content" id="content" placeholder="내용을 입력해 주세요">
				<button type="button"  name="commentInsertBtn" id="commentInsertBtn">등록</button>
			</div>
		</form>
	</div>	
	
	<div>
		<!-- 댓글목록 -->
		<div class="commentList"></div>
	</div>
	
	
	<!-- 댓글 관련 자바스크립트 -->
	<script>
	
		let product_code = '${product.PRODUCT_CODE}'; //부모글 번호
	
		//댓글 등록버튼 클릭했을때
		$("#commentInsertBtn").click(function(){
			//alert($);
			//<form id="commentInsertForm"></form>의 내용을 전부 가져옴
			let insertData=$("#commentInsertForm").serialize();
			//alert(insertData);//product_code=2&content=apple
			commentInsert(insertData);//댓글등록 함수 호출
		});//click() end
		
		function commentInsert(insertData) { //댓글 등록 함수
			//alert("댓글등록함수호출" + insertData);
			$.ajax({
				  url:'/comment/insert'  //요청명령어
				, type:'post'
				, data:insertData        //요청정보
				, error:function(error){
					alert(error);
				}//error end
			    , success:function(data){
			    	//alert(data);
			    	if(data==1){ //댓글 등록 성공
			    		commentList(); //댓글 작성후 댓글 목록 함수 호출
			    		//기존 댓글 내용을 빈 문자열로 대입
			    		$("#content").val('');
			    	}//if end
			    }//success end
			});//ajax() end
		}//commentInsert() end
function commentList() {
			//alert("댓글 목록 함수 호출");
			$.ajax({
				  url:'/comment/list'
				, type:'get'
				, data:{'product_code' : product_code } // data:{파라미터이름:담기는값} => 담기는 값은 
			    , success:function(data){
			    	//alert(data);
			    	let a=''; //출력할 결과값
			    	$.each(data, function(key, value){
			    		//alert(key);   //순서 0 1 2
			    		//alert(value); //[object Object]
			    		//alert(value.cno);
			    		//alert(value.content);
			    		//alert(value.wname);
			    		//alert(value.regdate);
			    		//alert(value.product_code);
			    		
			    		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">'
			    		a += '     <div class="commentInfo' + value.cno + '">';
			    		a += '          댓글번호:' + value.cno + ' / 작성자:' + value.wname + " " + value.regdate;			    		
			    		a += '          <a href="javascript:commentUpdate(' + value.cno + ',\'' + value.content + '\')">[수정]</a>';
			    		a += '          <a href="javascript:commentDelete(' + value.cno + ')">[삭제]</a>';
			    		a += '     </div>';
			    		a += '     <div class="commentContent' + value.cno + '">';			    		
			    		a += '          <p>내용:' + value.content + "</p>";
			    		a += '     </div>';			    		
			    		a += '</div>';

			    		
			    	});//each() end
			    	
			    	
			    	$(".commentList").html(a);		
			    	
			    }
			}); //ajax() end
			
		}//commentList() end
		
		
		//댓글수정 - 댓글 내용 출력을 input 폼으로 변경
		function commentUpdate(cno, content) {
			//alert(cno + content);
			let a='';
			a += '<div class="input-group">';
			a += '    <input type="text" value="' + content + '" id="content_' + cno + '">';
			a += '    <button type="button" onclick="commentUpdateProc(' + cno + ')">수정</button>';
			a += '</div>';
			//alert(a);
			$(".commentContent" + cno).html(a);
		}//commentUpdate() end
		
		//댓글수정
		function commentUpdateProc(cno) {
			//alert("댓글수정"+cno);
			let updateContent=$('#content_' + cno).val();
			//alert(updateContent);
			
			$.ajax({
				  url:'/comment/update'
				, type:'post'
				, data:{'cno':cno, 'content':updateContent}
			    , success:function(data){
			    	if(data==1){
			    		commentList(); //댓글 수정후 목록 출력
			    	}//if end
			    }//if end
			 });//ajax() end
			
		}//commentUpdateProc() end
		
		
		
		//댓글삭제
		function commentDelete(cno) {
			//alert("댓글삭제" + cno);
			$.ajax({
				  url:'/comment/delete/' + cno
				, type:'post'
				, success:function(data){ //콜백함수
					//alert(data);
					if(data==1){
						alert("댓글이 삭제되었습니다");
						commentList(); //댓글 삭제후 목록 출력
					}//if end
				}//success end
			});//ajax() end
		}//commentDelete() end
		
		
		
		
        $(document).ready(function(){ //페이지 로딩시 댓글 목록 출력
            commentList(); 
        });//ready() end
		
		
	</script>



</body>
</html>