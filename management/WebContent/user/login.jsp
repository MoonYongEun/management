<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style type="text/css">
body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
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

#center{ position:absolute; top:35%; left:50%; width:300px; height:200px; overflow:hidden; margin-top:-150px; margin-left:-100px;}
</style>
</head>
<body>

<form action="" method="post" id="writeForm">
		<div id="center">
			<h4 align ="center">ログイン画面</h4>
		
			<div class="form-group">
				<label for="id">ユーザID：</label> 
				<input id="id" type="text" name="id" class="form-control">
				<div id="idDiv" style="color : red;"></div>
			</div>
			
			<div class="form-group">
				<label for="pwd">パスワード：</label> 
				<input id="pwd" type="password" name="pwd" class="form-control">
				<div id="pwdDiv" style="color : red;"></div>
			</div>
			
			<div class="buttom-group" align="center">
				<button class="btn btn-default btn-lg btn-block" type="button" id=login>ログイン</button>
				<button class="btn btn-success btn-lg btn-block" type="button" id="write">社員登録</button>
			</div>
			
		</div>
		</form>

</body>
</html>