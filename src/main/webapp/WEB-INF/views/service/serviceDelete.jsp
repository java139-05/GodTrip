<div class="title">고객센터 게시글 삭제</div>
	
	<form name='frm' method="post" action="/service/serviceDelete">
		<input type="hidden" name="cno" value="${requestScope.cno}">
		<div class="content">
			<p>고객센터 게시글을 삭제하시겠습니까?</p>
		</div>
		
	    <div class='bottom'>
	    	<input type='submit' value='삭제'>
	    	<input type='button' value='목록' onclick="location.href='serviceList'">
	    </div>
	</form>