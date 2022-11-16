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
<link rel="stylesheet"
	href="${uriRoot}/styles/fontawesome-free-6.1.2-web/css/all.min.css" />
<meta charset="UTF-8">
<style>

.pageMainDiv{
	position:absolute;
	left:5%;
	width:90%;
	overflow:x-auto;

}

.listTable{
	
	width:100%;
}

.listtd {
	border-bottom:  0.8px solid rgba(220, 220, 220, 0.747);
	padding-top: 10px;
	padding-left: 25px;
	padding-right: 25px;
	padding-height:10px;
	padding-bottom :10px;
	text-align: center;
}
.roomimg{
    vertical-align: center;
	object-fit: cover;
	margin-top:5px;
	width:80px;
	height:45px;
}
.searchBarDiv{
	display:inline-block;
	position:relative;
	width:15%;
	padding: 5px 2px 2px 5px;
	border: 1px solid black; 
	border-radius:10px;
}
.searchBar{
	
	width:90%;
	border: 1px solid white;	
}
.searchBar:focus{
	outline: 1px solid white;
	
}
.head_div{
	
	margin-top:100px;
	margin-bottom:20px;
}
.userRoom_button{
	font-weight:bold;
	border:3px solid black;
	background-color:white;
	padding:3px 15px;
	border-radius:5px;
}

.userRoom_button:hover{
	background-color:black;
	color:white;
}

.disable{
	background-color:red;
	font-weight:bold;
	border:3px solid red;
	color:white;
}
.enable{
	background-color:green;
	font-weight:bold;
	border:3px solid green;
	color:white;
}
tr:hover{
	background-color:#F0F0F0;
}

.secondLine{
	position:relative;
	width:100%;
}
.addRoom{
	position:absolute;
	right:0px;
}
.editRooms{
	margin-left:50px;
}

.editRoomsDiv{
	padding-left:20px;
	right:-500px;
	border:1px solid black;
	position:fixed;
	width:500px;
	height:100%;
	overflow:auto;
	top:69px;
	background-color:white;
	transition:0.5s all; 
}
.cancelEdit{
	float:right;
	padding-left:15px;
	padding-right:15px;
	border:0px solid white;
	border-radius:35px;
	background-color:white;
}

.editTitleDiv{
	padding-top:10px;
	font-size:30px;
	positon:relative;
	width:100%;
}
.editItemDiv{
	margin-left:10%;
	padding-top:30px;
	font-size:22px;
	positon:relative;
	width:80%;
}
.editMainDiv{
	position:relative;
	width:100%;
}
.checkbox_div{
	padding-left:30px;
	position:relative;

}

.change_btn {
	position: absolute;
	right: 20px;
	bottom: 10 px;
}
.btn_div{
	position:relative;
	height:30px;
}
</style>
<title>房源管理</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp"/>
<div id= "pageMainDiv" class= "pageMainDiv">
	<div class="head_div">
		<h3 class="title">${userRooms.size()} 個房源</h3>
		<div class="secondLine">
			<div class="searchBarDiv">
				<i class="fa-solid fa-magnifying-glass searchicon"></i>
				<input type="text" id="searchBar" class="searchBar" placeholder="搜尋...">
			</div>
			
			<button type="button" class="editRooms userRoom_button" name="" id="editRooms" style="display:none">批量修改 已選擇2個房源</button>
			<button type="button" class="addRoom userRoom_button" name="" id="addRoom">+  新增房源</button>
		</div>
	</div>
	<table class="listTable" id="roomsTable">
		<thead>
		<tr class="listtr">
			<th class="listtd"><input type="checkbox" id="total"></th>
			<th class="listtd">照片</th>
			<th class="listtd">房源名稱</th>
			<th class="listtd" id="state_td">服務狀態 <i id="state_icon" class="fa-solid fa-caret-down"></i></th>
			<th class="listtd" id="price_td">價格 <i id="price_icon" class="fa-solid fa-caret-down"></i></th>
			<th class="listtd" id="bedroom_td">臥室數 <i id="bedroom_icon" class="fa-solid fa-caret-down"></i></th>
			<th class="listtd" id="bed_td">床位數 <i id="bed_icon" class="fa-solid fa-caret-down"></i></th>
			<th class="listtd" id="bathroom_td">衛浴數 <i id="bathroom_icon" class="fa-solid fa-caret-down"></i></th>
			<th class="listtd" id="city_td">城市 <i id="city_icon" class="fa-solid fa-caret-down"></i></th>
			<th class="listtd">修改</th>
		</thead >
			<tbody id="tbody">
	
			</tbody>
	</table>
	<div id="editRoomsDiv" class="editRoomsDiv">
		<div class="editTitleDiv">
			<span class="editTitle">批量修改</span>
			<button type="button" class="cancelEdit" id="cancelEdit"><i class="fa-solid fa-xmark"></i></button><hr>
		</div>
		<div class="editMainDiv">
		<div class="editItemDiv" id="selectEdit">
			<span class="editItemTitle">房屋狀態</span>
			<button type="button" class="cancelEdit" id="edit_status_btn"><i class="fa-solid fa-pen-to-square"></i></button><hr>		
			<span class="editItemTitle">服務</span>
			<button type="button" class="cancelEdit" id="edit_serve_btn"><i class="fa-solid fa-pen-to-square"></i></button><hr>		
			<span class="editItemTitle">設備</span>
			<button type="button" class="cancelEdit" id="edit_device_btn"><i class="fa-solid fa-pen-to-square"></i></button><hr>		
			<span class="editItemTitle">規範</span>
			<button type="button" class="cancelEdit" id="edit_restrict_btn"><i class="fa-solid fa-pen-to-square"></i></button><hr>		
		</div>
			<div class="edit_div" id="state_edit_div" style="display:none">
					<div class="att_div">
						<h4>房屋狀態</h4>
						<hr>
							<div class="checkbox_div">
								<c:forEach var="status" items="${statusList}">
									
										<c:if test="${status.id <4}">
											<div class="form-check form-switch">
										 		<input class="form-check-input" name="roomStatus" type="radio" role="switch" id="flexSwitchCheckDefault" value="${status.id}">${status.title}
										 	</div>
										</c:if>						
								
								</c:forEach>
							</div>
					
					</div>
					<hr />
					<div class="btn_div">
					<button class="unchange_btn userRoom_button" id="unchange_status">取消</button>
					<button class="change_btn userRoom_button" id="change_status">儲存</button>
					</div>
			</div>
			<div class="edit_div" id="serve_edit_div"  style="display:none">
					<div class="att_div">
						<h4>服務</h4>
						<hr>
							<div class="checkbox_div">
								<c:forEach var="serve" items="${serveList}">
									<div class="form-check form-switch"> <input class="form-check-input" name="serve[]" type="checkbox" role="switch" id="flexSwitchCheckDefault" value="${serve.id}">${serve.title}</div>
								</c:forEach>
							</div>
					
					</div>
					<hr />
					<div class="btn_div">
					<button class="unchange_btn userRoom_button" id="unchange_serve">取消</button>
					<button class="change_btn userRoom_button" id="change_serve">儲存</button>
					</div>
			</div>
			<div class="edit_div" id="device_edit_div"  style="display:none">
					<div class="att_div">
						<h4>設備</h4>
						<hr>
							<div class="checkbox_div">
								<c:forEach var="device" items="${deviceList}">
									<div class="form-check form-switch"> <input class="form-check-input" name="device[]" type="checkbox" role="switch" id="flexSwitchCheckDefault" value="${device.id}">${device.title}</div>
								</c:forEach>
							</div>
					
					</div>
					<hr />
					<div class="btn_div">
					<button class="unchange_btn userRoom_button" id="unchange_device">取消</button>
					<button class="change_btn userRoom_button" id="change_device">儲存</button>
					</div>
			</div>
			<div class="edit_div" id="restrict_edit_div" style="display:none">
					<div class="att_div">
						<h4>規範</h4>
						<hr>
							<div class="checkbox_div">
								<c:forEach var="restrict" items="${restrictList}">
									<div class="form-check form-switch"> <input class="form-check-input" name="restrict[]" type="checkbox" role="switch" id="flexSwitchCheckDefault" value="${restrict.id}">${restrict.title}</div>
								</c:forEach>
							</div>
					
					</div>
					<hr />
					<div class="btn_div">
					<button class="unchange_btn userRoom_button" id="unchange_restrict">取消</button>
					<button class="change_btn userRoom_button" id="change_restrict">儲存</button>
					</div>
			</div>
		
		
		
		
		
		
		
		
		</div>
	</div>
</div>
	<script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
	<script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
<script>
	var rooms;
	var stateSort = 0;
	var priceSort = 0;
	var bedSort = 0;
	var bedroomSort = 0;
	var bathroomSort = 0;
	var citySort = 0;
	var Sort = 0;
	var chosenRooms;
	function toEditRoomPage(e){
		if($(this).parent().parent().children().eq(3).children().html()==="禁止使用"){
			alert("此房間已被禁止使用,若有疑問請聯絡客服");
		}else{
			var url = "${uriRoot}/room/toEditPage?roomId="+$(this).attr("id");
			window.location.href=url;
		}
	}
	
	function toAddRoomPage(e){
		var url = "${uriRoot}/room/addRoom";
		window.location.href=url;
	}
	function loadRooms(){
		var xhr1 = new XMLHttpRequest();
		var myAccountId = ${myaccount.id};
		var url = `${uriRoot}`+"/room/loadUserRooms";
		var form = {
			"id" : myAccountId,
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);
		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				rooms = result;
				setRooms();
			};
		}	
	}
	function setRooms(){
		var roomHtml;
		rooms.forEach((room)=>{
			if(room.status==5){
				roomHtml += "<tr class='listtr'><td class='listtd chekboxTd' id='" + room.id + "'><input name='chooseRoom' type='checkbox' id='" + room.id + "' value='" + room.id + "' disabled>";			
			}else{
				roomHtml += "<tr class='listtr'><td class='listtd chekboxTd' id='" + room.id + "'><input name='chooseRoom' type='checkbox' id='" + room.id + "' value='" + room.id + "'>";							
			}
			roomHtml += "<td class='listtd photoTd' id='"+room.fronCoverUuid+"'>";
			roomHtml += "<img src='${uriRoot}/photo/room/"+room.fronCoverUuid+"' class='roomimg'/>";
			roomHtml += "<td class='listtd titleTd'>"+room.title;
			if(room.status ==3){
				roomHtml += "<td class='listtd statusTd'><button type='button' name='stateBtn' class='enable userRoom_button' id='"+room.id+"'>"+room.statusTitle+"</button>";				
			}else{
				roomHtml += "<td class='listtd statusTd'><button type='button' name='stateBtn' class='disable userRoom_button' id='"+room.id+"'>"+room.statusTitle+"</button>";				
			}
			roomHtml += "<td class='listtd priceTd'>"+room.price;
			roomHtml += "<td class='listtd bedRoomCountTd'>"+room.bedroomCount;
			roomHtml += "<td class='listtd'>"+(room.singleSizeBedCount+(room.doubleSizeBedCount*2)+room.floorMattressCount);
			roomHtml += "<td class='listtd'>"+room.bathroomCount;
			roomHtml += "<td class='listtd'>"+room.cityTitle;
			roomHtml += "<td class='listtd'><button type='button' name='edditButton' class='userRoom_button' id='"+room.id+"'>修改</button>";
		});
		$("#tbody").html(roomHtml);
		$("button[name='edditButton']").click(toEditRoomPage);
		$("button[name='stateBtn']").click(changeState);
		$("input[name='chooseRoom']").click(chooseRooms);
		
	}
	

	
	function chooseRooms(e){
		chosenRooms=$("input[name='chooseRoom']:checked")
						.map(function(){ return $(this).val(); }).get();
		console.log($("input[name='chooseRoom']:checked"));
		if($("input[name='chooseRoom']:checked").length > 0){
			$("#editRooms").html("批量修改:你已經選擇"+$("input[name='chooseRoom']:checked").length+"個房源");
			$("#editRooms").show();
		}else{
			$("#editRooms").hide();
		}
	}
	function checkedAll() {
		$("input[name='chooseRoom']:not(:disabled)").attr("checked",$("#total").prop("checked"));
		chooseRooms();
	};
	
	
	function editRooms(){
		$("#editRoomsDiv").css("right",0)
	}
	function cancelEdit(){
		$("#editRoomsDiv").css("right","-500px");
	}
	
	function editStatus(){
		$("#selectEdit").hide();
		$("#state_edit_div").show();
	}
	function editDevice(){
		$("#selectEdit").hide();
		$("#device_edit_div").show();
	}
	function editRestrict(){
		$("#selectEdit").hide();
		$("#restrict_edit_div").show();
	}
	function editServe(){
		$("#selectEdit").hide();
		$("#serve_edit_div").show();
	}
	
	function sortPrice(){
		if(priceSort%2 == 0){
			priceSort++;
			rooms.sort((room1,room2)=>{
				return (room1.price-room2.price);
			});
			setRooms();	
			$("#price_icon").attr("class","fa-solid fa-arrow-down-short-wide");
		}else{
			priceSort++;
			rooms.sort((room1,room2)=>{
				return -(room1.price-room2.price);
			});
			setRooms();	
			$("#price_icon").attr("class","fa-solid fa-arrow-down-wide-short");
		}
		
	}
	function sortStatus(){
		if(stateSort%2 == 0){
			stateSort++;
			rooms.sort((room1,room2)=>{
				return (room1.status-room2.status);
			});
			setRooms();	
			$("#state_icon").attr("class","fa-solid fa-arrow-down-short-wide");
		}else{
			stateSort++;
			rooms.sort((room1,room2)=>{
				return -(room1.status-room2.status);
			});
			setRooms();	
			$("#state_icon").attr("class","fa-solid fa-arrow-down-wide-short");
		}	
	}
	function sortBedroom(){
		if(bedroomSort%2 == 0){
			bedroomSort++;
			rooms.sort((room1,room2)=>{
				return (room1.bedroomCount-room2.bedroomCount);
			});
			setRooms();	
			$("#bedroom_icon").attr("class","fa-solid fa-arrow-down-short-wide");
		}else{
			bedroomSort++;
			rooms.sort((room1,room2)=>{
				return -(room1.bedroomCount-room2.bedroomCount);
			});
			setRooms();	
			$("#bedroom_icon").attr("class","fa-solid fa-arrow-down-wide-short");
		}	
	}
	function sortBathroom(){
		if(bathroomSort%2 == 0){
			bathroomSort++;
			rooms.sort((room1,room2)=>{
				return (room1.bathroomCount-room2.bathroomCount);
			});
			setRooms();	
			$("#bathroom_icon").attr("class","fa-solid fa-arrow-down-short-wide");
		}else{
			bathroomSort++;
			rooms.sort((room1,room2)=>{
				return -(room1.bathroomCount-room2.bathroomCount);
			});
			setRooms();	
			$("#bathroom_icon").attr("class","fa-solid fa-arrow-down-wide-short");
		}	
	}
	function sortCity(){
		if(citySort%2 == 0){
			citySort++;
			rooms.sort((room1,room2)=>{
				return (room1.city-room2.city);
			});
			setRooms();	
			$("#city_icon").attr("class","fa-solid fa-arrow-down-short-wide");
		}else{
			citySort++;
			rooms.sort((room1,room2)=>{
				return -(room1.city-room2.city);
			});
			setRooms();	
			$("#city_icon").attr("class","fa-solid fa-arrow-down-wide-short");
		}	
	}
	function sortBed(){
		if(bedSort%2 == 0){
			bedSort++;
			rooms.sort((room1,room2)=>{
				var room1Bed=room1.singleSizeBedCount + room1.doubleSizeBedCount*2 + room1.floorMattressCount;
				var room2Bed=room2.singleSizeBedCount + room2.doubleSizeBedCount*2 + room2.floorMattressCount;
				return room1Bed-room2Bed;
			});
			setRooms();	
			$("#bed_icon").attr("class","fa-solid fa-arrow-down-short-wide");
		}else{
			bedSort++;
			rooms.sort((room1,room2)=>{
				var room1Bed=room1.singleSizeBedCount + room1.doubleSizeBedCount*2 + room1.floorMattressCount;
				var room2Bed=room2.singleSizeBedCount + room2.doubleSizeBedCount*2 + room2.floorMattressCount;
				return -(room1Bed-room2Bed);
			});
			setRooms();	
			$("#bed_icon").attr("class","fa-solid fa-arrow-down-wide-short");
		}	
	}
	function searchRoom(){
		var roomHtml;
			rooms.forEach((room)=>{
				if(room.title.search($("#searchBar").val())!= -1 || room.statusTitle.search($("#searchBar").val())!= -1 
						|| room.price==$("#searchBar").val()|| room.cityTitle.search($("#searchBar").val())!= -1)
				{
					if(room.status==5){
						roomHtml += "<tr class='listtr'><td class='listtd chekboxTd' id='" + room.id + "'><input name='chooseRoom' type='checkbox' id='" + room.id + "' value='" + room.id + "' disabled>";			
					}else{
						roomHtml += "<tr class='listtr'><td class='listtd chekboxTd' id='" + room.id + "'><input name='chooseRoom' type='checkbox' id='" + room.id + "' value='" + room.id + "'>";							
					}
					roomHtml += "<td class='listtd photoTd' id='"+room.fronCoverUuid+"'>";
					roomHtml += "<img src='${uriRoot}/photo/room/"+room.fronCoverUuid+"' class='roomimg'/>";
					roomHtml += "<td class='listtd titleTd' >"+room.title;
					if(room.status ==3){
						roomHtml += "<td class='listtd statusTd'><button type='button' name='stateBtn' class='enable userRoom_button' id='"+room.id+"'>"+room.statusTitle+"</button>";				
					}else{
						roomHtml += "<td class='listtd statusTd'><button type='button' name='stateBtn' class='disable userRoom_button' id='"+room.id+"'>"+room.statusTitle+"</button>";				
					}
					roomHtml += "<td class='listtd priceTd'>"+room.price;
					roomHtml += "<td class='listtd bedRoomCountTd'>"+room.bedroomCount;
					roomHtml += "<td class='listtd'>"+(room.singleSizeBedCount+(room.doubleSizeBedCount*2)+room.floorMattressCount);
					roomHtml += "<td class='listtd'>"+room.bathroomCount;
					roomHtml += "<td class='listtd'>"+room.cityTitle;
					roomHtml += "<td class='listtd'><button type='button' class='userRoom_button' name='edditButton' id='"+room.id+"'>修改</button>";
				}
			});
			
		$("#tbody").html(roomHtml);
		$("button[name='edditButton']").click(toEditRoomPage);
		$("button[name='stateBtn']").click(changeState);
		$("input[name='chooseRoom']").click(chooseRooms);
		
	}
	function changeState(e){
		var id = parseInt($(this).attr("id"));
		var target = $(this);
		if($(this).html()==="禁止使用"){
			alert("此房間已被禁止使用,若有疑問請聯絡客服");
		}else{
			var xhr1 = new XMLHttpRequest();
			var myAccountId = ${myaccount.id};
			var url = `${uriRoot}`+"/room/editRoomStatus";
			var form = {
				"id" : id,
			}
			var jsonString = JSON.stringify(form);
			xhr1.open("POST", url, true);
			xhr1.setRequestHeader("Content-Type", "application/json");
			xhr1.send(jsonString);
			xhr1.onreadystatechange = function() {
				
				if (xhr1.readyState == 4 && xhr1.status == 200) {
					result = JSON.parse(xhr1.responseText);
					console.log(result);
					target.html(result.statusTitle);
					if(result.status==3){
						target.attr("class","enable userRoom_button");
					}else{
						target.attr("class","disable userRoom_button");
						
					}
					
				};
			}	
			
		}
	}
	
	function changeStatus(){
		var url = `${uriRoot}`+"/room/editRooms";
		var xhr1 = new XMLHttpRequest();
		var value = $("input[name='roomStatus']:checked").val();
		console.log(chosenRooms);
		console.log(value);
		var form = {
			"ids" : chosenRooms,
			"status": value
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				$("#selectEdit").show();
				$("#state_edit_div").hide();
				
				if(result.status==3){
					$("input[name='chooseRoom']:checked").closest("tr.listtr").find("button[name='stateBtn']").attr("class","enable userRoom_button");
					$("input[name='chooseRoom']:checked").closest("tr.listtr").find("button[name='stateBtn']").html(result.statusTitle);
				}else{
					$("input[name='chooseRoom']:checked").closest("tr.listtr").find("button[name='stateBtn']").attr("class","disable userRoom_button");
					$("input[name='chooseRoom']:checked").closest("tr.listtr").find("button[name='stateBtn']").html(result.statusTitle);
					
				}
					
			};

		}	
	}
	
	
	function changeServe(){
		var url = `${uriRoot}`+"/room/editRooms";
		var xhr1 = new XMLHttpRequest();
		var serve = $("input[name='serve[]']:checked").map(function(){
			return $(this).val();
		}).get();
	
		var form = {
			"ids" : chosenRooms,
			"serve": serve,
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				$("#selectEdit").show();
				$("#serve_edit_div").hide();
			};
		}	
	}
	
	
	function changeDevice(){
		var url = `${uriRoot}`+"/room/editRooms";
		var xhr1 = new XMLHttpRequest();
		var device = $("input[name='device[]']:checked").map(function(){
			return $(this).val();
		}).get();
	
		var form = {
			"ids" : chosenRooms,
			"device": device,
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				$("#selectEdit").show();
				$("#device_edit_div").hide();
			};
		}	
	}
	
	
	function changeRestrict(){
		var url = `${uriRoot}`+"/room/editRooms";
		var xhr1 = new XMLHttpRequest();
		var restrict = $("input[name='restrict[]']:checked").map(function(){
			return $(this).val();
		}).get();
	
		var form = {
			"ids" : chosenRooms,
			"restrict": restrict,
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				$("#selectEdit").show();
				$("#restrict_edit_div").hide();
			};
		}	
	}
	


	$(()=>{
		loadRooms();
		$("#total").click(checkedAll);
		$("#addRoom").click(toAddRoomPage);
		$("#editRooms").click(editRooms);
		$("#cancelEdit").click(cancelEdit);
		$("#price_td").click(sortPrice);
		$("#state_td").click(sortStatus);
		$("#bedroom_td").click(sortBedroom);
		$("#bathroom_td").click(sortBathroom);
		$("#city_td").click(sortCity);
		$("#bed_td").click(sortBed);
		$("#searchBar").keyup(searchRoom);
		$("button.unchange_btn").click(function(e){
			$(this).parent().parent().hide();
			$("#selectEdit").show();
		})
		
		$("#edit_device_btn").click(editDevice);
		$("#change_device").click(changeDevice);
		
		$("#edit_restrict_btn").click(editRestrict);
		$("#change_restrict").click(changeRestrict);
		
		$("#edit_serve_btn").click(editServe);
		$("#change_serve").click(changeServe);
		
		
		$("#edit_status_btn").click(editStatus);
		$("#change_status").click(changeStatus);
		
		universalHeaderController.rentalMode();
	})


</script>

</body>
</html>