<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 -->
<div class="col-sm-12">

	<script>
		function attraction_update() {
			document.attractionDetail.action="/attraction/attractionUpdate";
			document.attractionDetail.submit();
			//location.href='/attraction/attractionUpdate';
		}//attraction_update() end

		function attraction_delete(){
			if(confirm("영구히 삭제됩니다\n진행할까요?")){
				document.attractionDetail.action="/attraction/attractionDelete";
				document.attractionDetail.submit();
			}//if end
		}//attraction_delete() end
	</script>
	
	
<div class="container">
	
	<h3 class="display-5">관광지소개상세</h3> 

	<table class="table">
	    <thead class="thead-light">
	    
	  <tr>
	  	<td>지역</td>
	  	<td>${attraction.area_code}</td>
	  </tr>
	  <tr>
        <td>관광지명</td>
        <td>${attraction.tour_name}</td>
    </tr>
      <tr>
        <td>키워드</td>
        <td>${attraction.keyword}</td>
    </tr>
     <tr>
        <td>내용</td>
        <td>${attraction.content}</td>
    </tr>
        <tr>
	        <td>관광지사진</td>
	        <td>
	            <c:if test="${attraction.filename != '-'}">
                	<img src="/storage/${attraction.filename}" width="100px">
            	</c:if> 
	        </td>
	    </tr>

	  </table>  
	
	
	 <div class="text-center mt-4">
    <%-- 관리자만 수정,삭제버튼보임/전체코딩후수정예정 <c:if test="${sessionScope.member.mlevel == 'A1'}"></c:if> --%>
    
	 <tr>
	        <td colspan="2" align="center">
	             <input type="hidden" name="tour_code" value="${attraction.tour_code}">
	            <input type="button" value="수정"    onclick="attraction_update()"> 
	            <input type="button" value="삭제"    onclick="attraction_delete()"> 
	        </td>
	    </tr>  
    
    
    
    </div>
</div>
	  
	
	
	
	<hr>

	
	<!-- 댓글 -->
	<div>
		<label for="content">댓글</label>
		<form name="commentInsertForm" id="commentInsertForm">
			<div>
				<!-- 부모글번호 -->
				<input type="hidden" name="tour_code" id="tour_code" value="${attraction.tour_code}">
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
	
		let tour_code = '${attraction.tour_code}'; //부모글 번호
	
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
				, data:{'tour_code' : tour_code } // data:{파라미터이름:담기는값} => 담기는 값은 
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
			    		a += '     <div class="commentInfo' + value.commentno + '">';
			    		a += '          댓글번호:' + value.commentno + ' / 작성자:' + value.id + " " + value.regdate;			    		
			    		a += '          <a href="javascript:commentUpdate(' + value.commentno + ',\'' + value.content + '\')">[수정]</a>';
			    		a += '          <a href="javascript:commentDelete(' + value.commentno + ')">[삭제]</a>';
			    		a += '     </div>';
			    		a += '     <div class="commentContent' + value.commentno + '">';			    		
			    		a += '          <p>내용:' + value.content + "</p>";
			    		a += '     </div>';			    		
			    		a += '</div>';

			    		
			    	});//each() end
			    	
			    	
			    	$(".commentList").html(a);		
			    	
			    }
			}); //ajax() end
			
		}//commentList() end
		
		
		//댓글수정 - 댓글 내용 출력을 input 폼으로 변경
		function commentUpdate(commentno, content) {
			//alert(commentno + content);
			let a='';
			a += '<div class="input-group">';
			a += '    <input type="text" value="' + content + '" id="content_' + commentno + '">';
			a += '    <button type="button" onclick="commentUpdateProc(' + commentno + ')">수정</button>';
			a += '</div>';
			//alert(a);
			$(".commentContent" + commentno).html(a);
		}//commentUpdate() end
		
		//댓글수정
		function commentUpdateProc(commentno) {
			//alert("댓글수정"+cno);
			let updateContent=$('#content_' + commentno).val();
			//alert(updateContent);
			
			$.ajax({
				  url:'/comment/update'
				, type:'post'
				, data:{'commentno':commentno, 'content':updateContent}
			    , success:function(data){
			    	if(data==1){
			    		commentList(); //댓글 수정후 목록 출력
			    	}//if end
			    }//if end
			 });//ajax() end
			
		}//commentUpdateProc() end
		
		
		
		//댓글삭제
		function commentDelete(commentno) {
			//alert("댓글삭제" + commentno);
			$.ajax({
				  url:'/comment/delete/' + commentno
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


</div><!-- col-sm-12 끝 -->
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>