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

<title>房源管理</title>
<style>
.pageMainDiv {
	position: relative;
	margin-top: 75px;
	width: 80%;
	margin-left: 20%;
}

.title_with_edit {
	display: inline-block;
	position: relative;
	width: 90%;
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

.room_img {
	position: absolute;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.att_div {
	display: inline-block;
	position: relative;
	width: 90%;
}

.edit_button_div {
	display: inline-block;
	position: relative;
}

.attr_value {
	position: relative;
	display: inline-block;
	width: 45%;
	font-size: 22px;
}

.input_div {
	position: relative;
	border: 0.8px solid rgba(220, 220, 220, 0.747);
	border-radius: 10px;
	padding: 15px;
	margin-right: 10px;
	width: 90%;
}

.descript {
	color: gray;
}

.unchange_btn {
	position: absolute;
	left: 40px;
	bottom: 10 px;
}

.change_btn {
	position: absolute;
	right: 40px;
	bottom: 10 px;
}

.input_text {
	padding: 5px;
	border-radius: 10px;
	margin-top: 30px;
	margin-bottom: 30px;
	width: 80%
}

.edit_div {
	position: relative;
	border: 0.8px solid rgba(220, 220, 220, 0.747);
	border-radius: 10px;
	padding: 15px;
	margin-right: 10px;
	width: 90%;
}

.textarea_div {
	position: relative;
	border: 0.8px solid rgba(220, 220, 220, 0.747);
	border-radius: 10px;
	padding: 15px;
	margin-right: 10px;
	width: 90%;
}

.address_div {
	position: relative;
	border: 0.8px solid rgba(220, 220, 220, 0.747);
	border-radius: 10px;
	padding: 15px;
	margin-right: 10px;
	width: 90%;
}

.edit_status_div {
	position: relative;
	border: 0.8px solid rgba(220, 220, 220, 0.747);
	border-radius: 10px;
	padding: 15px;
	margin-right: 10px;
	width: 90%;
}

.edit_type_div {
	position: relative;
	border: 0.8px solid rgba(220, 220, 220, 0.747);
	border-radius: 10px;
	padding: 15px;
	margin-right: 10px;
	width: 90%;
}

.input_textarea {
	padding: 5px;
	border-radius: 10px;
	margin-top: 30px;
	margin-bottom: 10px;
	width: 80%
}

.numEditBtn {
	border-radius: 15px;
	width: 30px;
	height: 30px;
}

.numValue {
	margin: 5px 5px;
	font-size: 24px;
}

.valueSpan {
	margin: 5px 5px;
	margin-left: 100px: 
	font-size: 20px;
}

.btn_div {
	position: relative;
	height: 30px;
}

.bottom_div {
	position: relative;
	height: 100px;
}

#map {
	position: relative;
	top: 25%;
	left: 0;
	height: 400px;
	width: 780px;
}

.editRoom_button {
	font-weight: bold;
	border: 3px solid black;
	background-color: white;
	padding: 3px 15px;
	border-radius: 5px;
}

.editRoom_button:hover {
	background-color: black;
	color: white;
}

.numEditBtn {
	font-weight: bold;
	border: 3px solid black;
	background-color: white;
	border-radius: 20px;
}

.numEditBtn:hover {
	background-color: black;
	color: white;
}

.checkbox_div {
	margin-left: 40px;
}

.changeSuccess {
	color: green;
	margin-left: 20px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp" />
	<div class="pageMainDiv">
		<div class="title_with_edit">房源照片</div>
		<div class="edit_with_title">
			<button type="button" class="editRoom_button" id="edit_photo_button">編輯</button>
		</div>
		<hr />

		<br>
		<div class="imgs_div">
			<div class="img_div">
				<img id="img${room.frontCoverPhoto.uuid}" name="frontCoverPhoto"
					src="${uriRoot}/photo/room/${room.frontCoverPhoto.uuid}"
					class="room_img" />
			</div>
			<c:forEach var="roomImg" items="${room.photos}">
				<c:if test="${roomImg.uuid!=room.frontCoverPhoto.uuid}">
					<div class="img_div">
						<img id="${roomImg.uuid}" name=""
							src="${uriRoot}/photo/room/${roomImg.uuid}" class="room_img" />
					</div>
				</c:if>
			</c:forEach>
			<c:if test="${imgChangeState!=null}">
				<span class="changeSuccess" id="imgCahangeState"><i
					class="fa-regular fa-circle-check"></i>${imgChangeState}</span>
			</c:if>
		</div>
		<hr />
		<h2>房源基本資訊</h2>
		<hr />


		<div id="room_title_div">
			<div class="att_div">
				<h3>房源標題</h3>
				<span class="valueSpan" id="title_value">${room.information.title}</span>
				<span class="changeSuccess" id="titleCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button" id="edit_title_button">編輯</button>
			</div>
		</div>

		<div class="edit_div" id="title_edit_div">
			<div class="att_div">
				<h3>房源標題</h3>
				<span class="descript">房源標題應該要能展現房源的獨特之處。</span>
			</div>
			<input type="text" class="input_text" id="title_input"
				value="${room.information.title}">
			<hr />
			<div class="btn_div">
				<button class="unchange_btn editRoom_button" id="unchange_title">取消</button>
				<button class="change_btn editRoom_button" id="change_title">儲存</button>
			</div>
		</div>
		<hr />

		<div id="room_intro_div">
			<div class="att_div">
				<h3>房源簡介</h3>
				<span class="valueSpan" id="intro_value">${room.information.introduction}</span>
				<span class="changeSuccess" id="introCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button"
					id="edit_information_button">編輯</button>
			</div>
		</div>
		<div class="edit_div" id="info_edit_div">
			<div class="att_div">
				<h3>房源簡介</h3>
				<span class="descript">讓房客感受入住你房源會有的感覺，包括對方會喜歡入住此空間的原因。</span>
			</div>
			<textarea class="input_textarea" id="intro_input">${room.information.introduction}</textarea>
			<hr />
			<div class="btn_div">
				<button class="unchange_btn editRoom_button" id="unchange_intro">取消</button>
				<button class="change_btn editRoom_button" id="change_intro">儲存</button>
			</div>
		</div>
		<hr />
		<div id="room_price_div">
			<div class="att_div">
				<h3>房源價格</h3>
				<span class="valueSpan" id="price_value"> ${room.price} TWD/晚</span>
				<span class="changeSuccess" id="priceCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button" id="edit_price_button">編輯</button>
			</div>
		</div>
		<div class="edit_div" id="price_edit_div" style="display: none">
			<div class="att_div">
				<h3>房源價格</h3>
				<span class="descript">合宜的價格可以讓你的房源更容易被旅客接受。</span>
			</div>
			<input type="text" class="input_text" id="price_input"
				value="${room.price}">
			<hr />
			<div class="btn_div">
				<button class="unchange_btn editRoom_button" id="unchange_price">取消</button>
				<button class="change_btn editRoom_button" id="change_price">儲存</button>
			</div>
		</div>
		<hr />

		<div>
			<div class="att_div">
				<h3>房客人數</h3>
				<div>
					<label>最大房客數 ：</label>
					<button class="numEditBtn" id="decrease_maxPeopleCapacity">
						<i class="fa-solid fa-minus"></i>
					</button>
					<span id="maxPeopleCapacity" class="numValue">${room.information.maxPeopleCapacity}</span>
					<button class="numEditBtn" id="increase_maxPeopleCapacity">
						<i class="fa-solid fa-plus"></i>
					</button>
					<span class="changeSuccess" id="peopleCahangeState"
						style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
				</div>
			</div>
		</div>

		<hr />

		<div id="room_status_div">
			<div class="att_div">
				<h3>房源狀態</h3>
				<span class="valueSpan" id="status_value">${room.status.title}</span>
				<span class="changeSuccess" id="stateCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button"
					id="edit_status_button">編輯</button>
			</div>
		</div>
		<div class="edit_div" id="status_edit_div">
			<div class="att_div">
				<h3>房源狀態</h3>
			</div>
			<c:forEach var="status" items="${statusList}">
				<c:if test="${status.id <4}">
					<div>
						<input type="radio" name="roomStatus" value="${status.id}"
							id="roomStaus${status.id}" /><span>${status.title}</span>
					</div>
				</c:if>
			</c:forEach>

			<hr />
			<div class="btn_div">
				<button class="unchange_btn editRoom_button" id="unchange_status">取消</button>
				<button class="change_btn editRoom_button" id="change_status">儲存</button>
			</div>
		</div>


		<hr />
		<div id="room_serve_div">
			<div class="att_div">
				<h3>設備與服務</h3>
				<div class="values_div">
					<c:forEach var="serve" items="${serveList}">
						<div class="attr_value" name="serve_value_div" id="${serve.id}">${serve.title}</div>
					</c:forEach>
					<c:forEach var="device" items="${deviceList}">
						<div class="attr_value" name="device_value_div" id="${device.id}">${device.title}</div>
					</c:forEach>
				</div>
				<br>
				<span class="changeSuccess" id="serveCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button" id="edit_serve_button">編輯</button>
			</div>
		</div>

		<div class="edit_div" id="serve_edit_div">
			<div class="att_div">
				<h3>設備與服務</h3>

				<hr>
				<h5>設備</h5>
				<hr>
				<div class="checkbox_div">
					<c:forEach var="serve" items="${serveList}">
						<div class="form-check form-switch">
							<input class="form-check-input" name="serve[]" type="checkbox"
								role="switch" id="flexSwitchCheckDefault" value="${serve.id}">${serve.title}</div>
					</c:forEach>
				</div>
				<hr>
				<h5>服務</h5>
				<hr>
				<div class="checkbox_div">
					<c:forEach var="device" items="${deviceList}">
						<div class="form-check form-switch">
							<input class="form-check-input" name="device[]" type="checkbox"
								role="switch" id="flexSwitchCheckDefault" value="${device.id}">${device.title}</div>
					</c:forEach>
				</div>
			</div>
			<hr />
			<div class="btn_div">
				<button class="unchange_btn editRoom_button" id="unchange_serve">取消</button>
				<button class="change_btn editRoom_button" id="change_serve">儲存</button>
			</div>
		</div>


		<hr />
		<div id="room_address_div">
			<div class="att_div">
				<h3>地址</h3>
				<span class="valueSpan" id="address_value">${room.address}</span> <span
					class="changeSuccess" id="addressCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button"
					id="edit_address_button">編輯</button>
			</div>
		</div>

		<div class="edit_div" id="address_edit_div">
			<div class="att_div">
				<h3>地址</h3>
				<span class="descript">請詳盡描述房源的地址。</span>
			</div>



			<div>
				<select name="city" id="city">
					<c:forEach var="city" items="${cityList}">
						<option name="city" value="${city.id}">${city.title}</option>
					</c:forEach>
				</select> <input class="input_text" type="text" name="address" id="address"
					value="${room.address}">
			</div>
			<div>
				<button type="button" id="checkAddress" class="checkMap">確認地址</button>
			</div>
			<div id="map"></div>
			<hr />
			<div class="btn_div">
				<input type="text" name="latitude" id="latitude"
					style="display: none"> <input type="text" name="longtitude"
					id="longitude" style="display: none">
				<button class="unchange_btn editRoom_button" id="unchange_address">取消</button>
				<button class="change_btn editRoom_button" id="change_address">儲存</button>
			</div>
		</div>

		<hr />

		<div id="room_type_div">
			<div class="att_div">
				<h3>房源類型</h3>
				<span class="valueSpan" id="type_value">${room.information.type.title}</span>
				<span class="changeSuccess" id="typeCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button" id="edit_type_button">編輯</button>
			</div>
		</div>
		<div class="edit_div" id="type_edit_div">
			<div class="att_div">
				<h3>房源類型</h3>
			</div>
			<c:forEach var="type" items="${typeList}">
				<div>
					<input type="radio" name="roomType" value="${type.id}"
						id="roomType${type.id}" /><span>${type.title}</span>
				</div>
			</c:forEach>

			<hr />
			<div class="btn_div">
				<button class="unchange_btn editRoom_button" id="unchange_type">取消</button>
				<button class="change_btn editRoom_button" id="change_type">儲存</button>
			</div>
		</div>



		<hr />

		<div id="room_space_div">
			<div class="att_div">
				<h2>房間及空間</h2>
				<span class="valueSpan">臥室數量：</span><span class="valueSpan"
					id="bedroomNum">${room.information.bedroomCount}</span><br /> <span
					class="valueSpan">衛浴數量：</span><span class="valueSpan"
					id="bathroomNum">${room.information.bathroomCount}</span><br /> <span
					class="valueSpan">單人床數：</span><span class="valueSpan"
					id="singleSizeBedNum">${room.information.singleSizeBedCount}</span><br />
				<span class="valueSpan">雙人床數：</span><span class="valueSpan"
					id="doubleSizeBedNum">${room.information.doubleSizeBedCount}</span><br />
				<span class="valueSpan">地舖床數：</span><span class="valueSpan"
					id="floorMattressNum">${room.information.floorMattressCount}</span><br />
				<span class="changeSuccess" id="spaceCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button" id="edit_space_button">編輯</button>
			</div>
		</div>
		<div class="edit_div" id="space_edit_div">
			<div class="att_div">
				<h3>房間及空間</h3>
				<div>
					<label>臥室數量 ：</label>
					<button class="numEditBtn" name="decrease_btns"
						id="decrease_bedroomCount">
						<i class="fa-solid fa-minus"></i>
					</button>
					<span id="bedroomCount" class="numValue">${room.information.bedroomCount}</span>
					<button class="numEditBtn" name="increase_btns"
						id="increase_bedroomCount">
						<i class="fa-solid fa-plus"></i>
					</button>
				</div>
				<div>
					<label>浴室數量 ：</label>
					<button class="numEditBtn" name="decrease_btns"
						id="decrease_bathroomCount">
						<i class="fa-solid fa-minus"></i>
					</button>
					<span id="bathroomCount" class="numValue">${room.information.bathroomCount}</span>
					<button class="numEditBtn" name="increase_btns"
						id="increase_bathroomCount">
						<i class="fa-solid fa-plus"></i>
					</button>
				</div>
				<div>
					<label>單人床數 ：</label>
					<button class="numEditBtn" name="decrease_btns"
						id="decrease_singleSizeBedCount">
						<i class="fa-solid fa-minus"></i>
					</button>
					<span id="singleSizeBedCount" class="numValue">${room.information.singleSizeBedCount}</span>
					<button class="numEditBtn" name="increase_btns"
						id="increase_singleSizeBedCount">
						<i class="fa-solid fa-plus"></i>
					</button>
				</div>
				<div>
					<label>單人床數 ：</label>
					<button class="numEditBtn" name="decrease_btns"
						id="decrease_doubleSizeBedCount">
						<i class="fa-solid fa-minus"></i>
					</button>
					<span id="doubleSizeBedCount" class="numValue">${room.information.singleSizeBedCount}</span>
					<button class="numEditBtn" name="increase_btns"
						id="increase_doubleSizeBedCount">
						<i class="fa-solid fa-plus"></i>
					</button>
				</div>
				<div>
					<label>地舖床數 ：</label>
					<button class="numEditBtn" name="decrease_btns"
						id="decrease_floorMattressCount">
						<i class="fa-solid fa-minus"></i>
					</button>
					<span id="floorMattressCount" class="numValue">${room.information.floorMattressCount}</span>
					<button class="numEditBtn" name="increase_btns"
						id="increase_floorMattressCount">
						<i class="fa-solid fa-plus"></i>
					</button>
				</div>



			</div>
			<hr />
			<div class="btn_div">
				<button class="unchange_btn editRoom_button" id="unchange_space">取消</button>
				<button class="change_btn editRoom_button" id="change_space">儲存</button>
			</div>
		</div>

		<hr />

		<div id="room_restrict_div">
			<div class="att_div">
				<h2>房源規範</h2>
				<div class="values_div">
					<c:forEach var="restrict" items="${restrictList}">
						<div class="attr_value" name="restrict_value_div"
							id="${restrict.id}">${restrict.title}</div>
					</c:forEach>
				</div>
				<br>
				<span class="changeSuccess" id="restrictCahangeState"
					style="display: none"><i class="fa-regular fa-circle-check"></i>修改成功!</span>
			</div>
			<div class="edit_button_div">
				<button type="button" class="editRoom_button"
					id="edit_restrict_button">編輯</button>
			</div>
		</div>

		<hr />
		<div class="edit_div" id="restrict_edit_div">
			<div class="att_div">
				<h3>房源規範</h3>
				<hr>
				<div class="checkbox_div">
					<c:forEach var="restrict" items="${restrictList}">
						<div class="form-check form-switch">
							<input class="form-check-input" name="restrict[]" type="checkbox"
								role="switch" id="flexSwitchCheckDefault" value="${restrict.id}">${restrict.title}</div>
					</c:forEach>
				</div>
				<hr>
			</div>
			<hr />
			<div class="btn_div">
				<button class="unchange_btn editRoom_button" id="unchange_restrict">取消</button>
				<button class="change_btn editRoom_button" id="change_restrict">儲存</button>
			</div>
		</div>
		<div class="bottom_div"></div>

	</div>

	<script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
	<script src="${uriRoot}/scripts/bootstrap5.1.bundle.min.js"></script>


	<script>
	


	function editTitle(){
		$("#room_title_div").hide();
		$("#title_edit_div").show();	
	}

	function editInformation(){
		$("#room_intro_div").hide();
		$("#info_edit_div").show();	
	}
	function editStatus(){
		$("#room_status_div").hide();
		$("#status_edit_div").show();	
	}
	function editType(){
		$("#room_type_div").hide();
		$("#type_edit_div").show();	
	}
	function editAddress(){
		$("#room_address_div").hide();
		$("#address_edit_div").show();	
	}
	function editServe(){
		$("#room_serve_div").hide();
		$("#serve_edit_div").show();	
	}
	function editRestrict(){
		$("#room_restrict_div").hide();
		$("#restrict_edit_div").show();	
	}
	function editSpace(){
		$("#room_space_div").hide();
		$("#space_edit_div").show();	
	}
	function editPrice(){
		$("#room_price_div").hide();
		$("#price_edit_div").show();	
	}


	let roomStatusObjs = $("input[name='roomStatus']");
	let roomTypeObjs = $("input[name='roomType']");
	let cityObjs =$("option[name='city']");
	let serveObjs =$("input[name='serve[]']");
	let deviceObjs =$("input[name='device[]']");
	let restrictObjs =$("input[name='restrict[]']");
	let serveDivs = $("div[name='serve_value_div']");
	let deviceDivs = $("div[name='device_value_div']");
	let restrictDivs = $("div[name='restrict_value_div']");
	



	function increaseNum(e){
		var num = $(e.currentTarget).prev().html();
			num++;
			$(e.currentTarget).prev().html(num);
	}
	function decreaseNum(e){
		var num = $(e.currentTarget).next().html();
		if(num>0){
			num--;
			$(e.currentTarget).next().html(num);
		}
	}	
	function increaseMaxPeople(e){
		var num = parseInt($("#maxPeopleCapacity").html());
		console.log(num);
		num++;
		var url = `${uriRoot}`+"/room/userEditRoom";
		var xhr1 = new XMLHttpRequest();
		var id = ${room.id};
		var value = $("#intro_input").val();
		var form = {
			"id" : id,
			"maxPeopleCapacity": num
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				console.log(result);
				$("#maxPeopleCapacity").html(result.maxPeopleCapacity);
				$("#peopleCahangeState").show();
			};
		}	

	}
	function decreaseMaxPeople(e){
		var num =parseInt($("#maxPeopleCapacity").html());
		console.log(num);
		if(num>1){
			num--;
			var url = `${uriRoot}`+"/room/userEditRoom";
			var xhr1 = new XMLHttpRequest();
			var id = ${room.id};
			var value = $("#intro_input").val();
			var form = {
				"id" : id,
				"maxPeopleCapacity": num
			}
			var jsonString = JSON.stringify(form);
			xhr1.open("POST", url, true);
			xhr1.setRequestHeader("Content-Type", "application/json");
			xhr1.send(jsonString);

			xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				console.log(result);
				$("#maxPeopleCapacity").html(result.maxPeopleCapacity);
				$("#peopleCahangeState").show();
			};
		}	
			$(e.target).next().html(num);
		}
	}	
	
	function changeTitle(){
		var url = `${uriRoot}`+"/room/userEditRoom";
		var xhr1 = new XMLHttpRequest();
		var id = ${room.id};
		var value = $("#title_input").val();
		var form = {
			"id" : id,
			"title": value
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				$("#title_value").html(result.title);
				$("#title_edit_div").hide();
				$("#room_title_div").show();
				$("#titleCahangeState").show();
				
			};
		}	
	}
	function changePrice(){
		var url = `${uriRoot}`+"/room/userEditRoom";
		var xhr1 = new XMLHttpRequest();
		var id = ${room.id};
		var value = $("#price_input").val();
		var form = {
			"id" : id,
			"price": value
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				$("#price_value").html(result.price+' TWD/晚');
				$("#price_edit_div").hide();
				$("#room_price_div").show();
				$("#priceCahangeState").show();
				
			};
		}	
	}
	function changeIntro(){
		var url = `${uriRoot}`+"/room/userEditRoom";
		var xhr1 = new XMLHttpRequest();
		var id = ${room.id};
		var value = $("#intro_input").val();
		var form = {
			"id" : id,
			"introduction": value
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				$("#intro_value").html(result.introduction);
				$("#info_edit_div").hide();
				$("#room_intro_div").show();
				$("#introCahangeState").show();
			};
		}	
	}
	function changeStatus(){
		var url = `${uriRoot}`+"/room/userEditRoom";
		var xhr1 = new XMLHttpRequest();
		var id = ${room.id};
		var value = $("input[name='roomStatus']:checked").val();
		var form = {
			"id" : id,
			"status": value
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				roomStatusObjs.each(function(){
					if($(this).val() == result.status )
						$(this).attr("checked",true);
				});
				$("#status_edit_div").hide();
				$("#room_status_div").show();
				$("#stateCahangeState").show();
				$("#status_value").html($("input[name='roomStatus']:checked").next().html());	
			};

		}	
	}
	function changeServe(){
		var url = `${uriRoot}`+"/room/userEditRoom";
		var xhr1 = new XMLHttpRequest();
		var id = ${room.id};
		var serve = $("input[name='serve[]']:checked").map(function(){
			return $(this).val();
		}).get();
		var device = $("input[name='device[]']:checked").map(function(){
			return $(this).val();
		}).get();
		var form = {
			"id" : id,
			"serve": serve,
			"device":device
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				console.log(result.serve);
				serveObjs.each(function(){
					for (let a of result.serve) {
						if(a==$(this).val()){
							$(this).attr("checked",true);
						}
					}
				});
				deviceObjs.each(function(){
					for (let a of result.device) {
						if(a==$(this).val()){
							$(this).attr("checked",true);
						}
					}
				});

			serveDivs.each(function(){
			 	$(this).hide();
				for (let a of result.serve) {
						if(a==$(this).attr("id")){
							$(this).show();
						}
				}
			 });
			 deviceDivs.each(function(){
			 	$(this).hide();
				console.log($(this).attr("id"));
				for (let a of result.device) {
						if(a==$(this).attr("id")){
							$(this).show();
						}
				}
			 });
				$("#serve_edit_div").hide();
				$("#room_serve_div").show();
				$("#serveCahangeState").show();
			};
		}	
	}
	function changeType(){
		var url = `${uriRoot}`+"/room/userEditRoom";
		var xhr1 = new XMLHttpRequest();
		var id = ${room.id};
		var value = $("input[name='roomType']:checked").val();
		var form = {
			"id" : id,
			"type": value
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				roomTypeObjs.each(function(){
					if($(this).val() == result.type )
					$(this).attr("checked",true);
				});
				$("#type_edit_div").hide();
				$("#room_type_div").show();
				$("#typeCahangeState").show();
				$("#type_value").html($("input[name='roomType']:checked").next().html());
			};
		}	
	}
	
	
	function changeSpace(){
		
			var url = `${uriRoot}`+"/room/userEditRoom";
			var xhr1 = new XMLHttpRequest();
			var id = ${room.id};
			var bedroomCount = $("#bedroomCount").html();
			console.log(bedroomCount);
			var bathroomCount = $("#bathroomCount").html();
			var singleSizeBedCount = $("#singleSizeBedCount").html();
			var doubleSizeBedCount = $("#doubleSizeBedCount").html();
			var floorMattressCount = $("#floorMattressCount").html();
			var form = {
				"id" : id,
				"bedroomCount": bedroomCount,
				"bathroomCount": bathroomCount,
				"singleSizeBedCount": singleSizeBedCount,
				"doubleSizeBedCount": doubleSizeBedCount,
				"floorMattressCount": floorMattressCount
			}
			var jsonString = JSON.stringify(form);
			xhr1.open("POST", url, true);
			xhr1.setRequestHeader("Content-Type", "application/json");
			xhr1.send(jsonString);

			xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				$("#bedroomNum").html(result.bedroomCount);
				$("#bathroomNum").html(result.bathroomCount);
				$("#singleSizeBedNum").html(result.singleSizeBedCount);
				$("#doubleSizeBedNum").html(result.doubleSizeBedCount);
				$("#floorMattressNum").html(result.floorMattressCount);
				$("#space_edit_div").hide();
				$("#room_space_div").show();
				$("#spaceCahangeState").show();
			};
			
			}
	
	}
	
	
	function changeRestrict(){
		var url = `${uriRoot}`+"/room/userEditRoom";
		var xhr1 = new XMLHttpRequest();
		var id = ${room.id};
		var restrict = $("input[name='restrict[]']:checked").map(function(){
			return $(this).val();
		}).get();
		console.log(restrict);
		var form = {
			"id" : id,
			"restrict":restrict
		}
		var jsonString = JSON.stringify(form);
		xhr1.open("POST", url, true);
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(jsonString);

		xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				restrictObjs.each(function(){
					for (let a of result.restrict) {
						if(a==$(this).val()){
							$(this).attr("checked",true);
						}
					}
					restrictDivs.each(function(){
					$(this).hide();
						for (let a of result.restrict) {
							if(a==$(this).attr("id")){
								$(this).show();
							}
					}
					});
				});
				$("#restrict_edit_div").hide();
				$("#room_restrict_div").show();
				$("#restrictCahangeState").show();
				
			};
		}	
	}
	
	
	function initMap(){
			var latitude = ${room.information.latitude};
			var longitude = ${room.information.longitude};
			var locate = {
					lat : latitude,
					lng : longitude
				};
		
				var map = new google.maps.Map(document.getElementById('map'), {
					zoom : 18,
					center : locate
				});
				var marker = new google.maps.Marker({
					position : locate,
					map : map,
					
					clickable : true
				});
		}
		let key="${googleKey}";
		function checkAddress(){
			var address =$("#city").find("option:selected").text()+$("#address").val();
		console.log(address);
		
		var xhr = new XMLHttpRequest();
		var url = "https://maps.googleapis.com/maps/api/geocode/json?key="+key+"&address="+address;
		xhr.open("GET", url , true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				result = JSON.parse(xhr.responseText);
				console.log(result.results[0].geometry.location.lat);
				$("#latitude").val(result.results[0].geometry.location.lat);
				$("#longitude").val(result.results[0].geometry.location.lng);										
				changeMap();
			}else{
				$("#map").html("請確認地址是否正確,再重新輸入");
			}
			
		}
	
		}
		function changeMap(){
			var lat = parseFloat($("#latitude").val());
			var lng = parseFloat($("#longitude").val());
			var locate = {
					lat : lat,
					lng : lng
				};
		
				var map = new google.maps.Map(document.getElementById('map'), {
					zoom : 18,
					center : locate
				});
				var marker = new google.maps.Marker({
					position : locate,
					map : map,
					clickable : true
				});
		}
		
		
		function changeAddress(){
			
			var url = `${uriRoot}`+"/room/userEditRoom";
			var xhr1 = new XMLHttpRequest();
			var id = ${room.id};
			var lat = parseFloat($("#latitude").val());
			var lng = parseFloat($("#longitude").val());
			var city = $("#city").find("option:selected").val();
			var address = $("#address").val();
			var form = {
				"id" : id,
				"city" :city,
				"address" : address,
				"longitude": lng,
				"latitude": lat
			}
			var jsonString = JSON.stringify(form);
			xhr1.open("POST", url, true);
			xhr1.setRequestHeader("Content-Type", "application/json");
			xhr1.send(jsonString);

			xhr1.onreadystatechange = function() {
			
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				result = JSON.parse(xhr1.responseText);
				cityObjs.each(function(){
					if($(this).val()==result.city){
						$(this).attr("selected",true);
						return;
					}
				
			})
			$("#address_value").html(result.address);
				$("#address").val(result.address.replace($("option[name='city']:selected").html(),''));
			
				$("#address_edit_div").hide();
				$("#room_address_div").show();
				$("#addressCahangeState").show();
			};
			
			}
	
		}
	$(()=>{
		$("#title_edit_div").hide();
		$("#info_edit_div").hide();
		$("#status_edit_div").hide();
		$("#type_edit_div").hide();
		$("#address_edit_div").hide();
		$("#serve_edit_div").hide();
		$("#restrict_edit_div").hide();
		$("#space_edit_div").hide();
	
		$("#edit_title_button").click(editTitle);
		$("#unchange_title").click(()=>{
			$("#title_edit_div").hide();
			$("#room_title_div").show();
		});
		$("#edit_price_button").click(editPrice);
		$("#unchange_price").click(()=>{
			$("#price_edit_div").hide();
			$("#room_price_div").show();
		});
			
			
		$("#edit_information_button").click(editInformation);
		$("#unchange_intro").click(()=>{
			$("#info_edit_div").hide();
			$("#room_intro_div").show();
		});
			
			
		$("#edit_status_button").click(editStatus);
		$("#unchange_status").click(()=>{
			$("#status_edit_div").hide();
			$("#room_status_div").show();
		});
		
			
		$("#edit_type_button").click(editType);
		$("#unchange_type").click(()=>{
			$("#type_edit_div").hide();
			$("#room_type_div").show();
		});
			roomTypeObjs.each(function(){
				if($(this).val()==${room.information.type.id})
				$(this).attr("checked",true);
			})
			roomStatusObjs.each(function(){
				if($(this).val()==${room.status.id})
				$(this).attr("checked",true);
			})
			
			$("#edit_address_button").click(editAddress);
			$("#unchange_address").click(()=>{
				$("#address_edit_div").hide();
				$("#room_address_div").show();
			});
				cityObjs.each(function(){
					if($(this).val()==${room.city.id}){
						$(this).attr("selected",true);
						return;
					}
				})

			$("#edit_serve_button").click(editServe);
			$("#unchange_serve").click(()=>{
				$("#serve_edit_div").hide();
				$("#room_serve_div").show();
			});


			serveObjs.each(function(){
				<c:forEach var="roomServe" items="${room.serves}">
					if(${roomServe.id}==$(this).val()){
						$(this).attr("checked",true);
					}
				</c:forEach>
			});
			deviceObjs.each(function(){
				<c:forEach var="roomDevice" items="${room.devices}">
					if(${roomDevice.id}==$(this).val()){
						$(this).attr("checked",true);
					}
				</c:forEach>
			});

			$("#edit_restrict_button").click(editRestrict);
			$("#unchange_restrict").click(()=>{
				$("#restrict_edit_div").hide();
				$("#room_restrict_div").show();
			});
			
			 serveDivs.each(function(){
			 	$(this).hide();
			 	<c:forEach var="roomServe" items="${room.serves}">
			 		if("${roomServe.id}"==$(this).attr("id")){
			 			$(this).show();
			 		}
			 	</c:forEach>
			 });
			 deviceDivs.each(function(){
			 	$(this).hide();
			 	<c:forEach var="roomDevice" items="${room.devices}">
			 		if("${roomDevice.id}"==$(this).attr("id")){
			 			$(this).show();
			 		}
			 	</c:forEach>
			 });
			 restrictDivs.each(function(){
			 	$(this).hide();
			 	<c:forEach var="roomRestrict" items="${room.restricts}">
			 		if("${roomRestrict.id}"==$(this).attr("id")){
			 			$(this).show();
			 		}
			 	</c:forEach>
			 });

			restrictObjs.each(function(){
				<c:forEach var="roomRestrict" items="${room.restricts}">
					if(${roomRestrict.id}==$(this).val()){
						$(this).attr("checked",true);
					}
				</c:forEach>
			});
			$("#address").val($("#address").val().replace($("option[name='city']:selected").html(),''));
			
			$("#edit_space_button").click(editSpace);
			$("#unchange_space").click(()=>{
				$("#space_edit_div").hide();
				$("#room_space_div").show();
			});
	
			$("button[name='increase_btns']").click(increaseNum);
			$("button[name='decrease_btns']").click(decreaseNum);

			$("#decrease_maxPeopleCapacity").click(decreaseMaxPeople);
			$("#increase_maxPeopleCapacity").click(increaseMaxPeople);
			

			$("#change_title").click(changeTitle);
			$("#change_intro").click(changeIntro);
			$("#change_price").click(changePrice);
			$("#change_status").click(changeStatus);
			$("#change_serve").click(changeServe);
			$("#change_type").click(changeType);
			$("#change_space").click(changeSpace);
			$("#change_restrict").click(changeRestrict);
			$("#change_address").click(changeAddress);
			$("#checkAddress").click(checkAddress);
			$("#edit_photo_button").click(function(){
				var url = "${uriRoot}/room/toEditPicturePage?roomId="+${room.id};
				window.location.href=url;
			})
			initMap();
			universalHeaderController.rentalMode();
		})
	
	</script>
	<script defer
		src="https://maps.googleapis.com/maps/api/js?key=${googleKey}">
	</script>

</body>
</html>