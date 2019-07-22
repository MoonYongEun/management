<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Page</title>
<style type="text/css">
label {text-align: center; width: 150px; display: block; float: left; clear: left; margin-right: 5px;}
.form-group{margin-bottom: 10px;}
#center{ position:absolute; top:40%; left:40%; width:400px; height:500px; overflow:hidden; margin-top:-150px; margin-left:-100px;}
</style>
</head>
<body>
<form action="/management/user/userUpdate.do" method="post">
		<div id="center">
			<h4 align ="center">社員情報変更画面</h4>
		
			<div class="form-group">
				<label for="id">ユーザID：</label> 
				<input id="id" type="text" name="id" class="form-control" value="${memId }" readonly>
				<div id="idDiv" align="center" style="color : red;"></div>
				<div id="idCheckDiv" align="center" style="color : red;"></div>
			</div>
			
			<div class="form-group">
				<label for="name">名前：</label> 
				<input id="name" type="text" name="name">
				<input id="hiddenName" type="hidden" name="hiddenName">
				<div id="nameDiv" align="center" style="color : red;"></div>
			</div>
			
			<div class="form-group">
				<label for="department">部署：</label>
				<select id="department" name="department" style="width:173px;">
				 <option value="総務部">総務部</option>
				 <option value="ビジネスソリューション部">ビジネスソリューション部</option>
				 <option value="其の外">其の外</option>
				 </select>
				 <input id="hiddenDepartment" type="hidden" name="hiddenDepartment">
			</div>
			
			<div align="center">
				<button  type="button" id="modify">社員変更</button>
				<button  type="button" id="reset">取消し</button>
			</div>
			
		</div>
</form>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type:'POST',
		url:'/management/user/userModify.do',
		data:'id='+$('#id').val(),
		dataType:'json',
		success:function(data){
			$('#name').val(data.dto.name);
			$('#department').val(data.dto.department);
			$('#hiddenName').val(data.dto.name);
			$('#hiddenDepartment').val(data.dto.departement);
		}
	});
});

$('#modify').click(function(){
	$('form').submit();
});


$('#reset').click(function(){
	$('#name').val($('#hiddenName').val());
	$('#department').val($('#hiddenDepartment').val());
	
});


</script>
</html>