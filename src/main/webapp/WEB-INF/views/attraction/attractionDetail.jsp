<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������Ұ� �󼼺���</title>
<script>
	
		function attraction_update() {
			document.productfrm.action="/attraction/update";
			document.productfrm.submit();
		}//product_update() end

		
		function attraction_delete() {
			if(confirm("������ �����˴ϴ�\n�����ұ��?")){
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
	        <td>��������</td>
	        <td> <input type="text" name="tour_name" value="${attraction.tour_name}"> </td>
	    </tr>
	    <tr>
	    	<td>�ۼ���</td>
	    	<td><input type="text" name="rgdate" value=""></td>
	    </tr>
	     <tr>
	    	<td>��ȸ��</td>
	    	<td><input type="text" name="view_count" value=""></td>
	    </tr>
	     <tr>
	        <td>��������������</td>
	        <td>
	            <c:if test="${attraction.FILENAME != '-'}">
                	<img src="/storage/${attraction.FILENAME}" width="100px">
            	</c:if>
            	<br>
	         	<input type="file" name="img"> 
	        </td>
	    </tr>
	   
	    <tr>
	        <td>����</td>
	        <td> <input type="text" name="content" value="${attraction.content}"> </td>
	    </tr>
	   
	   
	    <tr>
	        <td colspan="2" align="center">
	            <!-- <input type="hidden" name="tour_code" value="${attraction.tour_code}">-->
	            <input type="button" value="����"    onclick="attraction_update()"> 
	            <input type="button" value="����"    onclick="attraction_delete()"> 
	        </td>
	    </tr>    
	    </table>  
	</form>
	
	
	
	
	
	
	
	
	
	
	
	<hr>

	
	<!-- ��� -->
	<div>
		<label for="content">���</label>
		<form name="commentInsertForm" id="commentInsertForm">
			<div>
				<!-- �θ�۹�ȣ -->
				<input type="hidden" name="tour_code" id="tour_cide" value="${attraction.tour_code}">
				<input type="text" name="content" id="content" placeholder="������ �Է��� �ּ���">
				<button type="button"  name="commentInsertBtn" id="commentInsertBtn">���</button>
			</div>
		</form>
	</div>	
	
	<div>
		<!-- ��۸�� -->
		<div class="commentList"></div>
	</div>
	
	
	<!-- ��� ���� �ڹٽ�ũ��Ʈ -->
	<script>
	
		let product_code = '${product.PRODUCT_CODE}'; //�θ�� ��ȣ
	
		//��� ��Ϲ�ư Ŭ��������
		$("#commentInsertBtn").click(function(){
			//alert($);
			//<form id="commentInsertForm"></form>�� ������ ���� ������
			let insertData=$("#commentInsertForm").serialize();
			//alert(insertData);//product_code=2&content=apple
			commentInsert(insertData);//��۵�� �Լ� ȣ��
		});//click() end
		
		function commentInsert(insertData) { //��� ��� �Լ�
			//alert("��۵���Լ�ȣ��" + insertData);
			$.ajax({
				  url:'/comment/insert'  //��û��ɾ�
				, type:'post'
				, data:insertData        //��û����
				, error:function(error){
					alert(error);
				}//error end
			    , success:function(data){
			    	//alert(data);
			    	if(data==1){ //��� ��� ����
			    		commentList(); //��� �ۼ��� ��� ��� �Լ� ȣ��
			    		//���� ��� ������ �� ���ڿ��� ����
			    		$("#content").val('');
			    	}//if end
			    }//success end
			});//ajax() end
		}//commentInsert() end
function commentList() {
			//alert("��� ��� �Լ� ȣ��");
			$.ajax({
				  url:'/comment/list'
				, type:'get'
				, data:{'product_code' : product_code } // data:{�Ķ�����̸�:���°�} => ���� ���� 
			    , success:function(data){
			    	//alert(data);
			    	let a=''; //����� �����
			    	$.each(data, function(key, value){
			    		//alert(key);   //���� 0 1 2
			    		//alert(value); //[object Object]
			    		//alert(value.cno);
			    		//alert(value.content);
			    		//alert(value.wname);
			    		//alert(value.regdate);
			    		//alert(value.product_code);
			    		
			    		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">'
			    		a += '     <div class="commentInfo' + value.cno + '">';
			    		a += '          ��۹�ȣ:' + value.cno + ' / �ۼ���:' + value.wname + " " + value.regdate;			    		
			    		a += '          <a href="javascript:commentUpdate(' + value.cno + ',\'' + value.content + '\')">[����]</a>';
			    		a += '          <a href="javascript:commentDelete(' + value.cno + ')">[����]</a>';
			    		a += '     </div>';
			    		a += '     <div class="commentContent' + value.cno + '">';			    		
			    		a += '          <p>����:' + value.content + "</p>";
			    		a += '     </div>';			    		
			    		a += '</div>';

			    		
			    	});//each() end
			    	
			    	
			    	$(".commentList").html(a);		
			    	
			    }
			}); //ajax() end
			
		}//commentList() end
		
		
		//��ۼ��� - ��� ���� ����� input ������ ����
		function commentUpdate(cno, content) {
			//alert(cno + content);
			let a='';
			a += '<div class="input-group">';
			a += '    <input type="text" value="' + content + '" id="content_' + cno + '">';
			a += '    <button type="button" onclick="commentUpdateProc(' + cno + ')">����</button>';
			a += '</div>';
			//alert(a);
			$(".commentContent" + cno).html(a);
		}//commentUpdate() end
		
		//��ۼ���
		function commentUpdateProc(cno) {
			//alert("��ۼ���"+cno);
			let updateContent=$('#content_' + cno).val();
			//alert(updateContent);
			
			$.ajax({
				  url:'/comment/update'
				, type:'post'
				, data:{'cno':cno, 'content':updateContent}
			    , success:function(data){
			    	if(data==1){
			    		commentList(); //��� ������ ��� ���
			    	}//if end
			    }//if end
			 });//ajax() end
			
		}//commentUpdateProc() end
		
		
		
		//��ۻ���
		function commentDelete(cno) {
			//alert("��ۻ���" + cno);
			$.ajax({
				  url:'/comment/delete/' + cno
				, type:'post'
				, success:function(data){ //�ݹ��Լ�
					//alert(data);
					if(data==1){
						alert("����� �����Ǿ����ϴ�");
						commentList(); //��� ������ ��� ���
					}//if end
				}//success end
			});//ajax() end
		}//commentDelete() end
		
		
		
		
        $(document).ready(function(){ //������ �ε��� ��� ��� ���
            commentList(); 
        });//ready() end
		
		
	</script>



</body>
</html>