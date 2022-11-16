<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap5.1.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/fontawesome-free-6.1.2-web/css/all.min.css" />
<meta charset="UTF-8">
<style>
	.mainDiv{
	left:300px;
		top :100px;
		position:absolute;
		width:800px;
		height:550px;
		margin:auto auto;
		
	}
	.left_div{
		left:0;
		position:absolute;
		display:inline-block;
		border: 1px solid black;
		border-radius:10px 0 0 10px;
		width:280px;
		height:100%;
		overflow: auto;
	}
	.right_div{
		right:0;
		position:absolute;
		display:inline-block;
		border: 1px solid black;
		border-radius:0 10px 10px 0;
		width:520px;
		height:100%;
	}
	.chatroom_div{
		margin-top:10px;
		margin-left:10px;	
		position:relative;
		width:260px;
		height :80px;
		display:inline-block;
		border: 0.1px solid black;
		border-radius:10px 10px 10px 10px;
	}
	.chatroom_div:hover{
		background-color:black;
		color:white;
	}
	.img_div{
		margin:5px 5px auto 5px;
		float:left;
		position:relative;
		display:inline-block;
		width:70px;
		height:70px;
		border: 0.1px solid black;
		border-radius:40px;
		overflow:hidden;
	}
	img{
	
		object-fit: cover;
		width:100%
	}
	.chatroom_name_div{
		margin-left:5px;
		margin-left:100px;
		position : relative;
		font-size:18px;
		width:150px;
		
	}
	.chatroom_lastMsg_div{
		position : relative;
		margin-left:5px;
		font-size:14px;
		margin-top:10px;
		margin-left:90px;
		width:150px;
		height:16px;
		overflow:hidden;
		
	}
	.chatroom_lastDate_div{
		position : relative;		
		margin-left:90px;
		margin-top:10px;
		width:150px;
		height:12px;
		font-size:10px;
	}
	.msg_div{
	position:relative;
	height:500px;
	}
	.sendBtn{
		border: 1px solid purple;
		border-radius: 20px;
	}
	.msg_div{
		border: 0.1px solid black;
		border-radius:20px;
		padding :10px;
		width:90%;
		margin:auto;
		overflow:auto;
		
	}
	.input_text{
		margin-top:5px;
		width:400px;
		border-radius: 5px;
	}
	.input_div{
		
		width:85%;
		margin:auto;
		
	}
	.msg{
	margin-bottom:5px;
	}
	.talk{
		margin-left:40px;
	}
	

</style>

<title>ChatRoom</title>
</head>
<body>
	<div class="mainDiv">
		<div class="left_div">
			<c:forEach var="chatroom" items="${chatrooms}">
				<div class="chatroom_div" name="chatroomdiv" id="${chatroom.id}">
					<div class="img_div">
						<img src="${uriRoot}/photo/account/${chatroom.receverImgUUID}" class="memberphoto">				
					</div>
					<div class="chatroom_name_div">
						${chatroom.receverName}							
					</div>
					<div class="chatroom_lastMsg_div">
						${chatroom.lastestMsg}
					</div>
					<div class="chatroom_lastDate_div">
						${chatroom.latestMsgDate}
					</div>
				</div>
			</c:forEach>
			
		</div>	
		<div class="right_div">
		<div id ="chatroom_div" style="display:none">
			<div class="msg_div" id="msg_div">
			
			</div>
			<div class="input_div">
				<input type="text" class="input_text" id="contentText">
				<button type="button" class="sendBtn" id="sendMsg"><i class="fa-solid fa-location-arrow"></i></button>
			</div>		
		</div>
		
		</div>
		
	</div>
	<script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
	<script src="${uriRoot}/scripts/bootstrap5.1.bundle.min.js"></script>
	
	<script>
		let chatroomId;
		function loadChatRoom(){
			console.log($("#chatroom_div").prop("display"));
			$("#chatroom_div").show();
			console.log($("#chatroom_div").prop("display"));
			
			chatroomId = parseInt($(this).attr("id"));
			var url = `${uriRoot}`+"/chatroom/getChatDetail";
			var xhr1 = new XMLHttpRequest();
			var form = {
				"id" : chatroomId,
			}
			var jsonString = JSON.stringify(form);
			xhr1.open("POST", url, true);
			xhr1.setRequestHeader("Content-Type", "application/json");
			xhr1.send(jsonString);
			xhr1.onreadystatechange = function() {
				
				if (xhr1.readyState == 4 && xhr1.status == 200) {
					result = JSON.parse(xhr1.responseText);
					var msghtml="";
					
					result.forEach((e)=>{
						msghtml += "<div class='msg'><div>"+e.speakerName+" : </div><div class='talk'>"+e.contentText+"</div></div>";
					});
					$("#msg_div").html(msghtml);
					
				};
			}	
		}
		function refreshChatRoom(){
			var url = `${uriRoot}`+"/chatroom/getChatDetail";
			var xhr1 = new XMLHttpRequest();
			var form = {
				"id" : chatroomId,
			}
			var jsonString = JSON.stringify(form);
			xhr1.open("POST", url, true);
			xhr1.setRequestHeader("Content-Type", "application/json");
			xhr1.send(jsonString);
			xhr1.onreadystatechange = function() {
				
				if (xhr1.readyState == 4 && xhr1.status == 200) {
					result = JSON.parse(xhr1.responseText);
					var msghtml="";
					
					result.forEach((e)=>{
						msghtml +=  "<div class='msg'><div>"+e.speakerName+" : </div><div class='talk'>"+e.contentText+"</div></div>";
					});
					$("#msg_div").html(msghtml);
				};
			}	
		}
		
		function sendMsg(){
			var msg = $("#contentText").val();
			var url = `${uriRoot}`+"/chatroom/sendMsg";
			var xhr1 = new XMLHttpRequest();
			var form = {
				"chatroomId" : chatroomId,
				"contentText" :msg
			}
			var jsonString = JSON.stringify(form);
			xhr1.open("POST", url, true);
			xhr1.setRequestHeader("Content-Type", "application/json");
			xhr1.send(jsonString);
			xhr1.onreadystatechange = function() {
				
				if (xhr1.readyState == 4 && xhr1.status == 200) {
					result = JSON.parse(xhr1.responseText);
					var msghtml="";
					
					result.forEach((e)=>{
						msghtml +=  "<div class='msg'><div>"+e.speakerName+" : </div><div class='talk'>"+e.contentText+"</div></div>";
					});
					$("#msg_div").html(msghtml);
				};
			}	
		};
		$(()=>{
			console.log("${myaccount.username}");
			$(".chatroom_div").click(loadChatRoom);
			$("#sendMsg").click(sendMsg);
			$("#contentText").keypress(function(e){
				console.log(e.key);
				if(e.which === 13){
					sendMsg();
				};
			})
		})
	</script>
</body>


</html>