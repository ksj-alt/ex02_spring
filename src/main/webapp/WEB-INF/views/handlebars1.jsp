<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
</head>
<body>
	<div id="temp1">
		<!-- <h1>My Title</h1>
		<p>My Name</p> -->
	</div>
	<script>
		var source="<h1>{{title}}</h1><p>{name}</p>"; //틀
		var data = {title:"My Title", name:"My Name"};
		var template = Handlebars.complie(source); //function이 return 
		
		var text = template(data); //json데이타가 들어간 tag text return
		$("#temp1").html(text);
	</script>
	<hr>
	<div id="temp2"></div>
	<script>
		var s2 = "<h1>{{hobby1}}</h1><h2>{{hobby2}}</h2><h3>{{hobby3}}</h3>";
		var d2 = {"hobby1":"독서", "hobby2":"TV시청", "hobby3":"잠자기"};
		var func = Handlebars.compile(s2);
		$("#temp2").html(func(d2));
	</script>
	<hr>
	<div id="temp3"></div>
	<script>
		var d3 = {"hobby1":"독서 222", "hobby2":"TV시청 222", "hobby3":"잠자기 222"};
		$("#temp3").html(func(d3));
	</script>
	
	<hr>
	<div id="temp4"></div>
	
	<script id="template" type="text/x-handlebars-template">
		<span>{{name}}</span>
		<div class="test">
			<span data-id="{{userid}}">{{userid}}</span><br>
			<span>{{addr}}</span><br>
			<span>{{email}}</span>
		</div>
	</script>
	
	<script>
		var source = $("#template").html();	//<h1>{{hobby1}}</h1><h2>{{hobby2}}</h2><h3>{{hobby3}}</h3>
		var data = {name:"홍길동", userid:"test", addr:"대구", email:"test@test.com"};
		var func = Handlebars.compile(source);
		$("#temp4").html(func(data));
	</script>
</body>
</html>