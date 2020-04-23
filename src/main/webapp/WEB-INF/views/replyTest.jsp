<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#listWrap{
		padding:0 50px;
	}
	#pagination li{
		border:1px solid gray;
		float:left;
		margin:0 5px;
		list-style: none;
		padding:2px 4px;
	}
	#list{
		margin:0 5px;
		list-style: none;
		padding:2px 4px;
	}
	#list .item{
		border-bottom:1px solid #ddd;
		padding:5px;
		width:400px;
		position: relative;
	}
	#list .item .text{
		display:block;
	}
	#list .item .btnWrap{
		position: absolute;
		right:10px;
		top:10px;
	}
	#modPopup{
		width:300px;
		height:100px;
		padding:5px;
		background-color: lightgray;
		position: absolute;
		top:30%;
		left:50%;
		display: none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var currentPage = 1;
	function getPageList(page){
		var bno = $("#bno").val();
		
		$.ajax({
			url:"replies/"+bno+"/"+page,    
			type:"get",
			dataType:"json",
			success:function(res){
				console.log(res);
				
				$("#list").empty();
				$(res.list).each(function(i, obj){
					var rno = obj.rno;
					var replyer = obj.replyer;
					var replytext = obj.replytext;
					
					var $li = $("<li>");
					var $divItem = $("<div>").addClass("item");
					var $spanRno = $("<span>").addClass("rno").text(obj.rno);
					var $spanWriter = $("<span>").addClass("writer").text(obj.replyer);
					var $spanReplyText = $("<span>").addClass("text").text(obj.replytext);
					var $divWrap = $("<div>").addClass("btnWrap");
					var $btnMod = $("<button>").addClass("btnMod").text("수정").attr("data-rno", rno).attr("data-text", replytext);
					var $btnDel = $("<button>").addClass("btnDel").text("삭제").attr("data-rno", rno);
					
					$divWrap.append($btnMod).append($btnDel);
					$divItem.append($spanRno).append(":").append($spanWriter)
								.append($spanReplyText).append($divWrap);
					$li.append($divItem);
					
					$("#list").append($li);
				})
				
				$("#pagination").empty();
				for(var i= res.pageMaker.startPage; i<=res.pageMaker.endPage; i++){
					var $li = $("<li>").html(i);
					$("#pagination").append($li);
				}
				
			}
		})
	}

	$(function(){
		$("#btnList").click(function(){
			getPageList(1);
		})
		
		$("#btnAdd").click(function(){
			//댓글 등록
			var bno = $("#bno").val();
			var replyer = $("#replyer").val();
			var text = $("#replytext").val();
			
			//서버 주소 : /replies/
			
			//@RequestBody 서버에서 사용시
			// 1. headers - "Content-Type" : "application/json"
			// 2. 보내는 data는 json string으로 변형해서 보내야 됨
			//		- "{bno:bno}"
			
			var json = JSON.stringify({"bno":bno, "replyer":replyer, "replytext":text});
			
			$.ajax({
				url:"replies/",
				type:"post",
				headers:{"Content-Type":"application/json"},
				data:json,	//data를 보낼 때 사용
				dataType:"text",
				success:function(res){
					console.log(res);
					if(res == "SUCCESS"){
						alert("댓글이 등록되었습니다.");
						//리스트 갱신, 
						getPageList(1);
					}
				}
			})
		})
		
		
		$(document).on("click", "#pagination li", function(){
			//click했는 li태그 번호
			var no = $(this).text();
			currentPage = no;
			getPageList(no);
		})
		
		$(document).on("click", ".btnDel", function(){
			var rno = $(this).attr("data-rno");
			$.ajax({
				url:"replies/"+rno,
				type:"delete",
				dataType:"text",
				success:function(res){
					console.log(res);
					
					if(res == "SUCCESS"){
						alert("삭제하였습니다.");
						getPageList(currentPage);
					}
				}
			})
		})
		
		$(document).on("click", ".btnMod", function(){
			var rno = $(this).attr("data-rno");
			var text = $(this).attr("data-text");
			$("#modPopup .modRno").text(rno);
			$("#modPopup #mod-text").val(text);
			
			$("#modPopup").show();
			
		})
		
		$("#btnModSave").click(function(){
			var rno = $(this).parent().find(".modRno").text();
			var text = $(this).parent().find("#mod-text").val();
			
			$.ajax({
				url:"replies/"+rno,
				type:"put",
				headers:{"Content-Type":"application/json"},
				data:JSON.stringify({"replytext":text}),
				dataType:"text",
				success:function(res){
					console.log(res);
					if(res == "SUCCESS"){
						alert("수정하였습니다.");
						$("#modPopup").hide();
						//리스트 갱신
						getPageList(currentPage);
					}
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
		<ul id="list">
			<!-- <li>
				<div class="item">
					<span class="rno">22</span> : <span class="writer">작성자</span>
					<span>댓글 내용</span>
					<div class="btnWrap">
						<button class="btnMod">수정</button>
						<button class="btnDel">삭제</button>
					</div>
				</div>
			</li> -->
		</ul>
		<ul id="pagination"></ul>  
	</div>
	
	<div id="modPopup">
		<div class="modRno"></div>
		<div>
			<input type="text" id="mod-text" value="text">
		</div>
		<button id="btnModSave">수정</button>
		<button id="btnClose">닫기</button>
	</div>
</body>
</html>