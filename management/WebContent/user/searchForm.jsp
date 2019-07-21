<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
ul{list-style:none;}
#center{ position:absolute; top:40%; left:37%; width:700px; height:400px; overflow:hidden; margin-top:-150px; margin-left:-100px;}
#liCheck{margin-bottom: 10px;float: left; clear: left;}
#idWidth{width:120px; float:left; }
#buttonCheck{margin-bottom: 10px;padding-right: 50px;float: right; clear: right;}
#resultTable{ position:absolute; top:45%; left:30%;} 
#firstTr{border: 1px solid #444444;background-color: #bbdefb;}

</style>

</head>
<body>
<div id="center">
	<ul>
		<li id="liCheck">
				<div id="idWidth">
					<input type="radio" id="idCheck" name="check" value="id" checked="checked">
					<label for="id">ユーザID：</label>
				</div>
				<input id="id" type="text" name="id">&nbsp; ※完全一致検索
				<div id="idDiv" align="center" style="color : red;"></div>

		</li>
		
		<li id="liCheck">
			<div id="idWidth">
				<input type="radio" id="nameCheck" name="check" value="name" >
				<label for="name">社員名：</label>
			</div>
			<input id="name" type="text" name="name">&nbsp; ※部分一致検索
			<div id="nameDiv" align="center" style="color : red;"></div>
		</li>
		
		<li id="liCheck">
			<div id="idWidth">
				<input type="radio" id="departmentCheck" name="check" value="department" >
				<label for="department">部署 ：</label>
			</div>
			<input id="department" type="text" name="department" >&nbsp; ※部分一致検索
			<div id="departmentDiv" align="center" style="color : red;"></div>
		</li>
		
		<li id="buttonCheck">
			<div align="right">
				<input type="button" id="search" value="検　　索 " style="width:100px">
			</div>
			<br>
			<div align="right">	
				<input type="button" id="write" value="社員登録" style="width:100px">
			</div>
		</li>
		
	</ul>
	<div>
	</div>
</div>

<!-- <table  id="resultTable" style="margin-top: 400px; margin-left: auto; margin-right: auto;"> -->
<table id="resultTable">
			<tr id="firstTr">
				<th width="100px" align="left">社員番号</th>
				<th width="100px" align="left">社員名</th>
				<th width="300px" align="left" colspan="2">部署</th>
			</tr>
</table>

</body>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var check= "id";
	$('#resultTable').hide();
	
	$('#idCheck,ul li:eq(0) label').click(function(){
		$('ul li:eq(0) #id').focus();
		$('#idCheck').prop("checked", true);
		$('#id,#name,#department').val("");

		check = $('#idCheck').val();
	});
	
	$('#nameCheck , li:eq(1) label').click(function(){
		$("#nameCheck").prop("checked", true);
		$('ul li:eq(1) #name').focus();
		$('#id,#name,#department').val("");
		check = $('#nameCheck').val();
	});
	
	$('#departmentCheck,li:eq(2) label').click(function(){
		$('ul li:eq(2) #department').focus();
		$('#departmentCheck').prop("checked", true);
		$('#id,#name,#department').val("");
		check = $('#departmentCheck').val();
		
	});
	
	
	$('#search').click(function(){
		$('#resultTable').hide();
		$('#resultTable tr:gt(0)').remove();
		
		
		if($('#'+check).val()==""){
			alert("データを入力してください");
			
		}else{

			$.ajax({
				type:'POST',
				url:'/management/user/search.do',
				data:'subject='+check+'&content='+$('#'+check).val(),
				dataType:'json',
				success:function(data){
					//alert(JSON.stringify(data.list));
					//alert(data.list.length);
					
					if(data.list.length == 0){
						alert("存在しない データ");
						
					}else{
						$.each(data.list,function(index,item){
							//alert(index);
							
							if($('#resultTable tr').length < data.list.length+1){
								$('#resultTable').append('<tr id="'+item.seq+'">'
										+'<td>'+item.seq+'</td>'
										+'<td>'+item.name+'</td>'
										+'<td>'+item.department+'</td>'
										+'<td align="right"><a id="delete" value="'+item.seq+'" href="#" style="padding-right: 20px;">削除</a></td></tr>');
							}
					
						});//$.each
						$('#resultTable').show();	
						
					}//else
					
				}//success
			});	
		}
	
	
	});


	$('#resultTable').on('click','#delete',function(){
		if(confirm("削除しますか?")){
			//alert($(this).attr('value'));
			$.ajax({
				type:'POST',
				url:'/management/user/delete.do',
				data:'seq='+$(this).attr('value'),
				success:function(data){
					alert("삭제되었습니다");
				},
				error : function(request, status, error) {
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
              
			});
			
			$('#'+$(this).attr('value')).remove();
			
		}else return;
		
	});	


	
	$('#write').click(function(){
		location.href="/management/user/writeForm.do";
	});

});



</script>
</html>