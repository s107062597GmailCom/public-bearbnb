<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet"
	href="${uriRoot}/styles/fontawesome-free-6.1.2-web/css/all.min.css" />
<title>MyMap</title>
<style>
#map {
	position: relative;
	top: 25%;
	left: 0;
	height: 400px;
	width: 780px;
}




#body {
	height: 100%;
	width: 100vw;
	position: relative;
	top: 0;
	left: 0;
}
</style>
</head>
<body>
	<div class="body">
		<h1>MyMap</h1>
		<span>請輸入地址: </span><input type="text" id="address" name="address" />
		<button type="button" id="search" class="search" data-toggle="modal" data-target="#myModal">搜尋</button>


		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">請確認位置正確，如不正確請取消重新輸入</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<div id="map"></div>
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary">確認</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
	<script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
	<script>
		let latitude = 0;
		let longitude = 0;
		let key="${googleKey}";
		function searchOnMap(){
			
			var address =$("#address").val();
			
			var xhr = new XMLHttpRequest();
			var url = "https://maps.googleapis.com/maps/api/geocode/json?key="+key+"&address="+address;
			xhr.open("GET", url , true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					result = JSON.parse(xhr.responseText);
					console.log(result);
					latitude = result.results[0].geometry.location.lat;
					longitude = result.results[0].geometry.location.lng;
				}
				changeMap();
			}
		};
		function changeMap(){
			var locate = {
					lat : latitude,
					lng : longitude
				};
			var shape1 ={
					coords : [50,50,50],
					type : "circle"
			};
				var map = new google.maps.Map(document.getElementById('map'), {
					zoom : 18,
					center : locate
				});
				var marker = new google.maps.Marker({
					position : locate,
					map : map,
					shape : shape1,
					clickable : true
				});
				console.log(marker.getShape());

		}

		
		$(()=>{
			$("#search").click(searchOnMap);	
		})
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=${googleKey}">
	</script>
</body>
</html>