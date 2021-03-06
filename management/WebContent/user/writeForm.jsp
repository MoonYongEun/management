<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Page</title>
<style type="text/css">
label {text-align: center; width: 150px; display: block; float: left; clear: left; margin-right: 5px;}
.form-group{margin-bottom: 10px;}
#center{ position:absolute; top:40%; left:40%; width:400px; height:500px; overflow:hidden; margin-top:-150px; margin-left:-100px;}
</style>
</head>
<body>

<form action="/management/user/write.do" method="post">
		<div id="center">
			<h4 align ="center">登録画面</h4>
		
			<div class="form-group">
				<label for="login_id">ユーザID：</label> 
				<input id="login_id" type="text" name="login_id" class="form-control">
				<div id="idDiv" align="center" style="color : red;"></div>
				<div id="idCheckDiv" align="center" style="color : red;"></div>
			</div>
			
			<div class="form-group">
				<label for="login_pwd">パスワード：</label> 
				<input id="login_pwd" type="password" name="login_pwd" class="form-control">
				<div id="pwdDiv" align="center" style="color : red;"></div>
			</div>
			
			<div class="form-group">
				<label for="login_repwd">パスワード再入力：</label> 
				<input id="login_repwd" type="password" name="login_repwd">
				<div id="repwdDiv" align="center" style="color : red;"></div>
			</div>
			
			<div class="form-group">
				<label for="corp_name">名前：</label> 
				<input id="corp_name" type="text" name="corp_name">
				<div id="nameDiv" align="center" style="color : red;"></div>
			</div>
			
			<div class="form-group">
				<label for="corp_dpt">部署：</label> 
				<select name="corp_dpt" style="width:173px;">
				 <option value="総務部">総務部</option>
				 <option value="ビジネスソリューション部">ビジネスソリューション部</option>
				 <option value="其の外">其の外</option>
				 </select>
			</div>
			
			<div align="center">
				<button  type="button" id="write">社員登録</button>
				<button  type="button" id="reset">取消し</button>
			</div>
			
		</div>
</form>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
$('#login_id').focusout(function(){
	$('#idDiv,#pwdDiv,#repwdDiv,#nameDiv').empty();
	$.ajax({
		type:'POST',
		url:'/management/user/idCheck.do',
		data : 'login_id='+$('#login_id').val(),
		dataType:'text',
		success:function(data){
			if(data == 'idFail'){
				$('#idCheckDiv').text('ID が存在します')
		  		  		  	    .css('font-size','8pt');
				
			}else if(data =='idOk'){
				$('#idCheckDiv').text('使用可能  ID')
		  		   		   	    .css('font-size','8pt');
				
			}else if(data == 'empty'){
				
			}

		}
	});
});

$('#write').click(function(){
	$('#idDiv,#pwdDiv,#repwdDiv,#nameDiv').empty();
	
	if($('#idCheckDiv').text() == "ID が存在します"){
		alert("同じ ID が存在します");
		
	}else if($('#login_id').val().length == 0 ){
		$('#idDiv').text("IDを入力してください")
				   .css("font-size","8pt");
				   
	}else if($('#login_pwd').val().length == 0 ){
		$('#pwdDiv').text("PASSWORDを入力してください")
		 		    .css("font-size","8pt");
			
	}else if($('#login_repwd').val().length == 0 ){
		$('#repwdDiv').text("PASSWORDを再入力を入力してください")
		   			  .css("font-size","8pt");
		
		
	}else if($('#login_pwd').val() != $('#login_repwd').val() ){
			$('#repwdDiv').text("同じPASSWORDを入力してください")
			  			  .css("font-size","8pt");
			
	}else if($('#corp_name').val().length == 0 ){
		$('#nameDiv').text("名前を入力してください")
		   			 .css("font-size","8pt");
		
	}else{
		
		if(confirm("社員登録を行いますか?")){
			
			$.ajax({
				type:'GET',
				url:'/management/user/cookieDelete.do',
				success:function(data){
					alert("社員登録をしました");
				}
			});
			
			$('form').submit();
			
		}else return;
			
	}
	
});



$('#reset').click(function(){
	$('#login_id,#corp_name,#login_pwd,#login_repwd,#corp_name').val("");
	$('#corp_dpt').val("総務部");
	
	
});
</script>
</html>