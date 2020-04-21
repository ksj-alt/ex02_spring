<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btnList").click(function(){
			$.ajax({
				uri:"http://localhost:8080/ex02/replies/2101/1?",   
				type:"get",
				dataType:"json",
				success:function(res){
					console.log(res);
				}
			})
		})
	})
</script>
</head>
<body>
	<div id="box">
		<p>
			<label>BNO</label>
			<input type="text" id="bno">
		</p>
		<p>
			<label>Replyer</label>
			<input type="text" id="replyer">
		</p>
		<p>
			<label>Reply Text</label>
			<input type="text" id="replytext">
		</p>
		<p>
			<button id="btnList">List</button>
			<button id="btnAdd">Add</button>
		</p>
	</div>
	<hr>
	<div id="listWrap">
		<ul id="list"></ul>
		<ul id="pagination"></ul>  
	</div>
</body>
</html>