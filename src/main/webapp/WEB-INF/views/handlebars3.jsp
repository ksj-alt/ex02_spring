<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>

<style>
	table{
		border:1px solid black;
		border-collapse: collapse;
	}
	th, td{
		border:1px solid black;
	}
</style>
</head>
<body>
	<div id="wrap"></div>
	<script id="template" type="text/x-handlebars-template">
		<h1>{{title}}</h1>
		<ul>
			{{#each list}}
			<li class="replies">
				<div>
					<p>{{rno}}</p>
					<p>{{replyer}}</p>
					<p>{{replytext}}</p>
					<p>{{dateHelper replydate}}</p>
				</div>
			</li>
		</ul>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("dateHelper", function(value){
			var d = new Date(value);
			var year = d.getFullYear();
			var month = d.getMonth() + 1;
			var day = d.getDate();
			var arrayWeek = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
			var week = d.getDay();
			
			return year + "/" + month + "/" + day + " " + arrayWeek[week];
		});
	</script>
	<script>
		var source = $("#template").html();
		var data = {
				title : "제목입니다.",
				list : [
					{rno:1, "replyer":"홍길동1", "replytext":"1번 댓글입니다.....", "replydate":new Date(2019,2,11)},
					{rno:2, "replyer":"홍길동2", "replytext":"2번 댓글입니다.....", "replydate":new Date(2020,0,1)},
					{rno:3, "replyer":"홍길동3", "replytext":"3번 댓글입니다.....", "replydate":new Date(2020,1,1)},
					{rno:4, "replyer":"홍길동4", "replytext":"4번 댓글입니다.....", "replydate":new Date(2020,2,1)}
				]	
		};
		var func = Handlebars.compile(source);
		$("#wrap").html(func(data));
	</script>
	
	<div id="wrap2"></div>
	<script id=template2 type="text/x-handlebars-template">
		<table>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>메일주소</th>
			</tr>
			{{#each list}}
			<tr>
				<td>{{name}}</td>
				<td>{{id}}</td>
				<td><a href="#">{{email}}</a></td>
			</tr>
			{{/each}}
		</table>
		
	</script>
	
	<script>
		var source2 = $("#template2").html();
		var data2 = {
				title : "제목",
				list : [
					{name:"홍길동1", id:"aaa1", email:"aaa1@gmail.com"},
					{name:"홍길동2", id:"aaa2", email:"aaa2@gmail.com"},
					{name:"홍길동3", id:"aaa3", email:"aaa3@gmail.com"},
					{name:"홍길동4", id:"aaa4", email:"aaa4@gmail.com"},
					{name:"홍길동5", id:"aaa5", email:"aaa5@gmail.com"}
				]	
		};
		var func2 = Handlebars.compile(source2);
		$("#wrap2").html(func2(data2));
	</script>
	
	<hr>

	
</body>
</html>