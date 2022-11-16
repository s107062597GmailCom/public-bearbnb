<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />
<c:set var="imgIndex" value="0" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap5.1.min.css">
<link rel="stylesheet" href="${uriRoot}/styles/fontawesome-free-6.1.2-web/css/all.min.css" />
<meta charset="UTF-8">
<title>EditRoomPicture</title>
<style>
	.pageMainDiv {
	position: relative;
	margin-top: 20px;
	width: 70%;
	margin-left: 15%;
	}

.title_with_edit {
	display: inline-block;
	position: relative;
	width: 100%;
	font-size: 32px;
}

.edit_with_title {
	display: inline-block;
	position: relative;
	font-size: 20px;
}

.imgs_div {
	position: relative;
}

.img_div {
	padding: 0px;
	border: 0px solid black;
	border-radius: 10px;
	display: inline-block;
	position: relative;
	width: 240px;
	height: 135px;
	overflow: hidden;
}
.att_div {
	display: inline-block;
	position: relative;
	width: 100%;
}

.edit_button_div {
	display: inline-block;
	position: relative;
}
.edit_div {
	position: relative;
	border: 0.8px solid rgba(220, 220, 220, 0.747);
	border-radius: 10px;
	padding: 15px;
	margin-right: 10px;
	width: 90%;
}
.room_img {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.picInput{
	position: relative;
	width: 100%;
	height: 100%;
	opacity: 0;
}
.uploaddiv {
	border-radius:5px;
	border:1px solid black;
	width: 240px;
	height: 30px;
	text-align: center;
	position: relative;
}
.imgSpan {
	position: absolute;
	left: 30%;
}
.subimg_div{
	position:relative;
	display:inline-block;
	width:245px;
}
.main_div{
	position:relative;
	display:inline-block;
	width:965px;
}
.mainimg_div{
	padding: 0px;
	border: 0px solid black;
	border-radius: 10px;
	display: inline-block;
	position: relative;
	width: 720px;
	height: 405px;
	overflow: hidden;
}

.edit_RoomPic_button{
	font-weight:bold;
	border:3px solid black;
	background-color:white;
	padding:3px 15px;
	border-radius:5px;
}

.edit_RoomPic_button:hover{
	background-color:black;
	color:white;
}
</style>
</head>
<body>
<div class="pageMainDiv">
	

		<br>
		<div class="edit_div" id="info_edit_div">
		<form action="${pageContext.request.contextPath}/room/editRoomPicture"
			method="post" enctype="multipart/form-data">
		<input type="text" name="roomId" value="${room.id}" style="display:none"/>
			<div class="att_div">
				<h2>房源圖片</h2>
				<hr/>
				
			</div>
	  		<div class="att_div">
				<div class="main_div">
					<div class="mainimg_div">
						<img id="img${room.frontCoverPhoto.uuid}" name="frontCoverPhoto"
									src="${uriRoot}/photo/room/${room.frontCoverPhoto.uuid}" class="room_img" />
					</div>
					<div id="uploaddiv1" class="uploaddiv">
								<input type="file" id="${room.frontCoverPhoto.uuid}" name="frontCoverPhoto" class="picInput">
								<span class="imgSpan">修改封面圖片</span>
								
					</div>
				</div>				
			</div>
			<div class="att_div">
				<c:forEach var="roomImg" items="${room.photos}">
					<c:if test="${roomImg.uuid!=room.frontCoverPhoto.uuid}">
						<c:set var="imgIndex" value="${imgIndex+1}" />
						<div class="subimg_div">
							<div class="img_div">
								<img id="img${roomImg.uuid}" name="${roomImg.uuid}"
									src="${uriRoot}/photo/room/${roomImg.uuid}" class="room_img" />
							</div>
							<div id="uploaddiv1" class="uploaddiv">
								<input type="file" id="${roomImg.uuid}" name="photo${imgIndex}" class="picInput">
								<span class="imgSpan">修改圖片</span>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<hr />
			<div class="btn_div">
			<button type="button" class="unchange_btn edit_RoomPic_button" id="unchange_photo">取消</button>
			<button class="change_btn edit_RoomPic_button" id="change_photo">儲存</button>
			</div>
			</form>
		</div>

	
	</div>

	
	<script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
	<script src="${uriRoot}/scripts/bootstrap5.1.bundle.min.js"></script>
	<script>
		$("#${room.frontCoverPhoto.uuid}").change(function(){
			var reads = new FileReader();
			let f = $("#${room.frontCoverPhoto.uuid}")[0].files[0];
			reads.readAsDataURL(f);
			reads.onload = function(e) {
				document.getElementById('img${room.frontCoverPhoto.uuid}').src = this.result;
			};
		});
		
		<c:forEach var="roomImg" items="${room.photos}">
			<c:if test="${roomImg.uuid!=room.frontCoverPhoto.uuid}">
				$("#${roomImg.uuid}").change(function(){
					console.log("12245");
					var reads = new FileReader();
					let f = $("#${roomImg.uuid}")[0].files[0];
					reads.readAsDataURL(f);
					reads.onload = function(e) {
						document.getElementById('img${roomImg.uuid}').src = this.result;
					};
				});
			</c:if>
		</c:forEach>
		function unchangePhoto(){
			var url = "${uriRoot}/room/toEditPage?roomId=${room.id}";
			console.log(url);
			window.location.href=url;
		}
	
		$(()=>{
			$("#unchange_photo").click(unchangePhoto);
		})
	
	</script>
</body>
</html>