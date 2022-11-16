<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		height:700px;
		margin:auto auto;
		
	}
	.left_div{
		left:0;
		position:absolute;
		display:inline-block;
		
		width:280px;
		height:100%;
		overflow: overflow-x;
	}
	.right_div{
		right:0;
		position:absolute;
		display:inline-block;
		border-left: 0.1px solid gray;
		border-radius:0 10px 10px 0;
		width:520px;
		height:100%;
	}
	.unload_chatroom_div{
		margin-top:10px;
		margin-left:10px;	
		position:relative;
		width:260px;
		height :80px;
		display:inline-block;
		border: 0.1px solid black;
		border-radius:10px 10px 10px 10px;
	}
	.load_chatroom_div{
		margin-top:10px;
		margin-left:10px;	
		position:relative;
		width:260px;
		height :80px;
		display:inline-block;
		background-color :#1392e6;
		color:white;
		border: 0.1px solid #1392e6;
		border-radius:10px 10px 10px 10px;
	}
	.unload_chatroom_div:hover{
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
		width:110px;
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
		height:580px;
	}
	.sendBtn{
		color:white;
		background-color:purple;
		border: 1px solid purple;
		border-radius: 20px;
	}
	.msg_div{
		
		padding :10px;
		width:100%;
		margin:auto;
		overflow:auto;
		
	}
	.input_text{
		margin-top:5px;
		width:400px;
		border-radius: 5px;
		border: 1px solid gray;
	}
	.input_div{
		
		width:85%;
		margin:auto;
		
	}
	.msg{
		
		margin-bottom:8px;
	}
	.talk{
		position: relative;
		margin-left:40px;
		display:inline-block;
		max-width:80%;
	}

	.name_title{
		position:relative;
		left:20px;
		top:10px;
	
	}
	.newMsg_tag{
		color:red;
		font-size:5px;
	}
	.shakeDiv{
		animation-name: shake;    /*動畫名稱，需與 keyframe 名稱對應*/
   	 	animation-duration: 2s;    /*動畫持續時間，單位為秒*/
    	animation-iteration-count: 5;
	}
	@keyframes shake {
    	0% { transform: rotateZ(0); }
    	25% { transform: rotateZ(30deg); }
    	50% { transform: rotateZ(0); }
   		 75% { transform: rotateZ(-30deg); }
    	100% { transform: rotateZ(0); }
	}
	

</style>

<title>ChatRoom</title>
</head>
<body>
	<div class="mainDiv">
		<div class="left_div" >
			<h3 class="name_title">訊息</h3><hr>
			<div id="chatrooms_div">
				<c:if test="${chatrooms!=null}">
					<c:forEach var="chatroom" items="${chatrooms}">
						<div class="unload_chatroom_div shakeDiv" id="${chatroom.id}">
							<div class="img_div">
								<img src="${uriRoot}/photo/account/${chatroom.receverImgUUID}" class="memberphoto">				
							</div>
							<div class="chatroom_name_div">${chatroom.receverName}</div>
						
							<c:choose>
							<c:when test="${chatroom.latestMsgStatus!=0}">
								<div class="chatroom_lastMsg_div">${chatroom.latestMsg}<span id="newMsg_tag" class="newMsg_tag" style="display:none">●</span></div>
							</c:when>
							<c:otherwise>
								<div class="chatroom_lastMsg_div">${chatroom.latestMsg}<span id="newMsg_tag" class="newMsg_tag" >●</span></div>
							</c:otherwise>
							</c:choose>
							<div class="chatroom_lastDate_div">
							<fmt:formatDate pattern='yyyy/MM/dd HH:mm' value='${chatroom.latestMsgDate}' />
							</div>
						</div>
					</c:forEach>
	  			</c:if>
			</div>
			
		</div>	
		<div class="right_div">
		<div id ="chatroom_div" style="display:none">
		<h3 class="name_title" id="receiverName"></h3>
		<hr/>
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
	<script src="https://cdn.bootcss.com/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdn.bootcss.com/stomp.js/2.3.3/stomp.min.js"></script>
	
	<script>
		var userId = ${myaccount.id};
		var chatroomId;
		var stompClient=null;
		var speakerName;
		var receiverName;
		function loadChatRoom(e){
			disconnected();
			$(this).attr("class","load_chatroom_div");
			$(this).siblings().attr("class","unload_chatroom_div");
			speakerName="${myaccount.information.firstName}"+" "+"${myaccount.information.lastName}";
			receiverName = $(this).children()[1].innerHTML;
			$("#receiverName").html(receiverName);
			
			var socket= new SockJS('/bearbnb.com/ws');
			stompClient =Stomp.over(socket);
			stompClient.connect({},onconnected,onerror);
			$("#chatroom_div").show();
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
						if(speakerName == e.speakerName){
							msghtml +="<div class='msg'><div class='speaker'>我 : </div>";
							msghtml +="<div class='talk'>"+e.contentText+"</div></div>";												
						}else{
							msghtml +="<div class='msg'><div class='speaker'>"+e.speakerName+" : </div>";
							msghtml +="<div class='talk'>"+e.contentText+"</div></div>";
						}
						
					});
					$("#msg_div").html(msghtml);
					var max = Number.MAX_SAFE_INTEGER;
					$("#msg_div").scrollTop(max);
				};
			}	
		}
		function onconnected(){
			stompClient.subscribe('/topic/'+speakerName,onMessageReceived);
			stompClient.send("/app/one/addUser",{},JSON.stringify({'speakerName' : speakerName,"type":'JOIN'}));
			
		};
		function disconnected(){
			  if (stompClient !== null) {
				  stompClient.disconnect();
			    }
		}
		
		function onerror(){
			console.log("chatRoomError")
		}
		function onMessageReceived(payload){
			var xhr1 = new XMLHttpRequest();
			var message = JSON.parse(payload.body);
			if(message.speakerName == speakerName ||message.speakerName ==receiverName){
				if(message.speakerName == speakerName){
					var msghtml =  "<div class='msg'><div>我 : </div><div class='talk'>"+message.contentText+"</div></div>";
					$("#msg_div").append(msghtml);					
				}else{
					var msghtml =  "<div class='msg'><div>"+message.speakerName+" : </div><div class='talk'>"+message.contentText+"</div></div>";
					$("#msg_div").append(msghtml);
				}
				var chatrooms = $("#chatrooms_div").children();
				for(var room of chatrooms){
					if(message.chatroomId == room.id){
						var lastMsgHtml = "<span id='newMsg_tag' class='newMsg_tag' style='display:none'>●</span>"+message.contentText;
						$(room).children()[2].innerHTML = lastMsgHtml;
						datetime = formatDate( new Date(message.createdAt));
						$(room).children()[3].innerHTML = datetime;
						if(speakerName != message.receiverName){
							readMsg();
						};
					}
				}	
				var max = Number.MAX_SAFE_INTEGER;
				$("#msg_div").scrollTop(max);
			}else{
				var chatrooms = $("#chatrooms_div").children();
				for(var room of chatrooms){
					if(message.chatroomId == room.id){
						var lastMsgHtml = message.contentText+"<span id='newMsg_tag' class='newMsg_tag'>●</span>";
						$(room).children()[2].innerHTML = lastMsgHtml;
						var date = new Date(message.createdAt).toLocaleString();
						$(room).children()[3].innerHTML = date;
					}
				}	
				var max = Number.MAX_SAFE_INTEGER;
				$("#msg_div").scrollTop(max);
			}
			
		}
		function　formatDate(current_datetime){
			let formatted_date = current_datetime.getFullYear() 
			+ "/" + (current_datetime.getMonth() + 1) 
			+ "/" + current_datetime.getDate() + " " 
			+ current_datetime.getHours() + ":" 
			+ current_datetime.getMinutes();
		    return formatted_date;
		}
		
		function sendMsg(){
			var msg = $("#contentText").val();
			if(msg && stompClient){
				var chatMsg= {
					"chatroomId":chatroomId,
					"id":userId,
					"speakerName":speakerName,
					"receiverName":receiverName,
					"contentText":msg,
					"type":'CHAT',
					"status": 0
				}
				stompClient.send("/app/one/sendMessage",{},JSON.stringify(chatMsg));
				var MsgResult=insertMsg();
		
				$("#contentText").val("");
			}
		
		};
		function insertMsg(){
			var msg = $("#contentText").val();
			var xhr1 = new XMLHttpRequest();
			var url = `${uriRoot}`+"/chatroom/sendMsg";
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
				};
			}	
		};
		function readMsg(){
			var xhr1 = new XMLHttpRequest();
			var url = `${uriRoot}`+"/chatroom/readMsg";
			var form = {
				"chatroomId" : chatroomId
			}
			var jsonString = JSON.stringify(form);
			xhr1.open("POST", url, true);
			xhr1.setRequestHeader("Content-Type", "application/json");
			xhr1.send(jsonString);
			xhr1.onreadystatechange = function() {
				if (xhr1.readyState == 4 && xhr1.status == 200) {
					result = JSON.parse(xhr1.responseText);
				};
			}	
		}
		$(()=>{
			$(".unload_chatroom_div").click(loadChatRoom);
			$("#sendMsg").click(sendMsg);
			$("#contentText").keypress(function(e){
				if(e.which === 13){
					sendMsg();
				};
			})
			
		})
	</script>
</body>


</html>