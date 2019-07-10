<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>

<form action="" method="post" id="writeForm">
		
		<div class="form-group">
			<label for="id">아이디</label> 
			<input id="id" type="text" name="id" class="form-control">
			<div></div>
			<div id="idDiv" style="color : red;"></div>
		</div>
		
		<div class="form-group">
			<label for="pwd">パスワード：</label> 
			<input id="pwd" type="password" name="pwd" class="form-control">
			<div id="pwdDiv" style="color : red;"></div>
		</div>
		<button class="btn btn-default btn-lg btn-block" type="button" id=login>ログイン</button>
		<button class="btn btn-success btn-lg btn-block" type="button" id="write">社員登録</button>
		
		</form>

</body>
</html>