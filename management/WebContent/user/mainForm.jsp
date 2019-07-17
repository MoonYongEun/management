<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メインメニュー画面</title>
<style type="text/css">
#center{ position:absolute; top:20%; left:50%; width:300px; height:200px; overflow:hidden; margin-top:-150px; margin-left:-100px;}
li{margin-bottom: 10px;}

</style>
</head>
<body>
<div id="center">
<h4 align ="center">メインメニュー画面</h4>
<div>${memId }様  ログイン</div>
<ul>
	<li><a href="#">社員情報検索</a></li>
	<li><a href="#">社員情報修正</a></li>
	<li><a id="logout" href="#">ログアウト</a></li>
</ul>


</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
$('#logout').click(function(){
	if(confirm("ログアウトしますか?")){
		location.href="/management/user/logout.do";
		
	}else return;
});
</script>
</html>