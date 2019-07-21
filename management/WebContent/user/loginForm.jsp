<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style type="text/css">
label {
  text-align: left;
  width: 100px;
  display: block;
  float: left;
  clear: left;
  margin-right: 5px;
}
.form-group{
margin-bottom: 10px;
}

#center{ position:absolute; top:35%; left:40%; width:300px; height:200px; overflow:hidden; margin-top:-150px; margin-left:-100px;}
</style>
</head>
<body>

<form action="/management/user/mainForm.do" method="post" id="writeForm">
		<div id="center">
			<h4 align ="center">ログイン画面</h4>
		
			<div class="form-group">
				<label for="id">ユーザID：</label> 
				<input id="id" type="text" name="id">
				<div id="idDiv" align="center" style="color : red;"></div>
			</div>
			
			<div class="form-group">
				<label for="pwd">パスワード：</label> 
				<input id="pwd" type="password" name="pwd">
				<div id="pwdDiv" align="center" style="color : red;"></div>
			</div>
			
			<div  align="center">
				<button type="button" id="login">ログイン</button>
				<button  type="button" id="write">社員登録</button>
				<div id="loginDiv" align="center" style="color : red;"></div>
			</div>
			
		</div>
		</form>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
$('#write').click(function(){
	location.href="/management/user/writeForm.do";
});

$('#login').click(function(){
	$('#idDiv,#pwdDiv').empty();	
	
	if($('#id').val().length == 0 ){
		$('#idDiv').text("IDを入力してください")
				   .css("font-size","8pt");
				   
	}else if($('#pwd').val().length == 0 ){
		$('#pwdDiv').text("PASSWORDを入力してください")
		 		    .css("font-size","8pt");
			
	}else{
		$.ajax({
			type:'POST',
			url:'/management/user/loginCheck.do',
			data : 'id='+$('#id').val()+'&pwd='+$('#pwd').val(),
			dataType:'text',
			success:function(data){
				if(data == 'loginFail'){
					$('#loginDiv').text('ログイン 失敗  :  ID 又は PASSWORD に誤りがあります')
			  		  		      .css('font-size','8pt')
			  		  		      .css('margin-top','10px');
					
				}else if(data == 'loginOk'){
					alert("ログイン");
					$('form').submit();
				}
	
			}
		});
		
	}
});
</script>
</html>