<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<link rel="stylesheet"
	href="${uriRoot}/styles/fontawesome-free-6.1.2-web/css/all.min.css" />
<meta charset="UTF-8">
<title>新增房源</title>
<link>
<link rel="stylesheet" href="${uriRoot}/styles/room/addRoom.css">
</head>
<body>
	<article>
		<form action="${pageContext.request.contextPath}/room/insertRoom"
			method="post" enctype="multipart/form-data">
			<div class="wrapper">
				<ul class="slide">
					<li>
						<fieldset class="divblock">
							<div id="title_div">
								<h1 class="title_h1">請輸入房源的基本資料...</h1>
							</div>
							<div id="form_div">

								<div id="subform">

									<div class="st1">
										<label for="title" class="t1">房源名稱:</label> <input type="text"
											name="title" id="title" /><br /> <span id="tltle_error"
											class="alarm"></span>
									</div>
									<div class="st1">
										<label for="price" class="t1">價格:</label> <input type="text"
											name="price" id="price"
											onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" /> <br />
										<span id="price_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="address" class="t1">地址:</label> <select
											name="city" id="city">
											<option value="" selected>請選擇</option>
											<c:forEach var="city" items="${cityList}">
												<option value="${city.id}">${city.title}</option>
											</c:forEach>
										</select> <input type="text" name="address" id="address">
										<button type="button" id="search" class="search"
											data-toggle="modal" data-target="#myModal">確認地址</button>
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
											<button type="button" class="btn btn-default"
												data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary" id="addressChecked">確認</button>
										</div>
									</div>
								</div>
										 <input type="text" name="latitude" id="latitude" style="display:none">
										 <input type="text" name="longitude" id="longitude" style="display:none">
										<br /> <span id="address_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="roomType" class="t1">房型:</label>
										<c:forEach var="type" items="${typeList}">
											<label><input type="radio" name="roomType"
												value="${type.id}" id="roomType${type.id}" />${type.title}</label>
										</c:forEach>
										<br /> <span id="roomType_error" class="alarm"></span>
									</div>
								</div>
							</div>

							</div>

							<div id="rightdiv" class="btndiv">
								<button type="button" id="next1" class="next">下一步</button>
							</div>
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
												title</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">...</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Save
												changes</button>
										</div>
									</div>
								</div>
							</div>
						</fieldset>
					</li>
					<li>
						<fieldset>
							<div id="title_div">
								<h1 class="title_h1">請上傳房源的照片...</h1>
							</div>
							<div id="form_div">
								<div id="subform">
									<div id="main_img_div">
										<div id="uploaddiv1" class="uploaddiv">
											<span id="imgSpan"> 點擊上傳封面圖片 <br /> <i
												class="fa-regular fa-square-plus"></i>
											</span> <input type="file" id="file1" class="filepath"
												onchange="changepic1(this)" name="photoFile1"
												accept="image/jpg,image/jpeg,image/png,image/PNG">
										</div>
										<img src="#" id="img1" class="showimg" />
									</div>
									<div id="sub_img_div" class="subimg">
										<div id="uploaddiv2" class="uploaddiv">
											<span id="subimgSpan"> 點擊上傳圖片 <br /> <i
												class="fa-regular fa-square-plus"></i>
											</span> <input type="file" id="file2" class="filepath"
												onchange="changepic2(this)" name="photoFile2"
												accept="image/jpg,image/jpeg,image/png,image/PNG">
										</div>
										<img src="#" id="img2" class="showimg" />
									</div>
									<div id="sub_img_div" class="subimg">
										<div id="uploaddiv3" class="uploaddiv">
											<span id="subimgSpan"> 點擊上傳圖片 <br /> <i
												class="fa-regular fa-square-plus"></i>
											</span> <input type="file" id="file3" class="filepath"
												onchange="changepic3(this)" name="photoFile3"
												accept="image/jpg,image/jpeg,image/png,image/PNG">
										</div>
										<img src="#" id="img3" class="showimg" />
									</div>
									<div id="sub_img_div" class="subimg">
										<div id="uploaddiv4" class="uploaddiv">
											<span id="subimgSpan"> 點擊上傳圖片 <br /> <i
												class="fa-regular fa-square-plus"></i>
											</span> <input type="file" id="file4" class="filepath"
												onchange="changepic4(this)" name="photoFile4"
												accept="image/jpg,image/jpeg,image/png,image/PNG">
										</div>
										<img src="#" id="img4" class="showimg" />
									</div>
									<div id="sub_img_div" class="subimg">
										<div id="uploaddiv5" class="uploaddiv">
											<span id="subimgSpan"> 點擊上傳圖片 <br /> <i
												class="fa-regular fa-square-plus"></i>
											</span> <input type="file" id="file5" class="filepath"
												onchange="changepic5(this)" name="photoFile5"
												accept="image/jpg,image/jpeg,image/png,image/PNG">
										</div>
										<img src="#" id="img5" class="showimg" />
									</div>
									<br /> <span id="photo_comment">請上傳5張相片</span>

								</div>
							</div>
							<div id="leftdiv" class="btndiv">
								<a id="prev1" class="prev">《返回》</a>
							</div>
							<div id="rightdiv" class="btndiv">
								<button type="button" id="next2" class="next">下一步</button>
							</div>
						</fieldset>
					</li>
					<li>
						<fieldset>
							<div id="title_div">
								<h1 class="title_h1">請填寫空間配置＆容納人數...</h1>
							</div>
							<div id="form_div">
								<div id="subform">
									<div class="st1">
										<label for="maxPersonCapacity" class="t1">最大人數</label> <input
											type="number" name="maxPersonCapacity" id="maxPersonCapacity"
											min="1" style="width: 150px" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')">
										<br /> <span id="maxPerson_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="minPersonCapacity" class="t1">最小人數</label> <input
											type="number" name="minPersonCapacity" id="minPersonCapacity"
											min="1" max="" style="width: 150px"
											onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"> <br />
										<span id="minPerson_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="singleSizeBedCount" class="t1">單人床數</label> <input
											type="number" name="singleSizeBedCount"
											id="singleSizeBedCount" min="0" style="width: 150px" 
											onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"> <br />
										<span id="singleSizeBedCount_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="doubleSizeBedCount" class="t1">雙人床數</label> <input
											type="number" name="doubleSizeBedCount"
											id="doubleSizeBedCount" min="0" style="width: 150px" 
											onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"> <br />
										<span id="doubleSizeBedCount_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="floorMattressCount" class="t1">地舖床位</label> <input
											type="number" name="floorMattressCount"
											id="floorMattressCount" min="0" style="width: 150px" 
											onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"> <br />
										<span id="floorMattressCount_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="bedroomCount" class="t1">房間</label> <input
											type="number" name="bedroomCount" id="bedroomCount" min="1"
											style="width: 150px" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"> <br />
										<span id="bedroomCount_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="bathroomCount" class="t1">衛浴</label> <input
											type="number" name="bathroomCount" id="bathroomCount"
											step="1" min="1" style="width: 150px" 
											onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"> <br />
										<span id="bathroomCount_error" class="alarm"></span>
									</div>
									<div class="st1">
										<label for="area" class="t1">坪數</label> <input type="number"
											name="area" id="area" step="0.1" min="1" style="width: 150px" 
											onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"> <br />
										<span id="area_error" class="alarm"></span>
									</div>
								</div>
							</div>

							<div id="leftdiv" class="btndiv">
								<a id="prev2" class="prev">《返回》</a>
							</div>
							<div id="rightdiv" class="btndiv" class="prev">
								<button type="button" id="next3" class="next">下一步</button>
							</div>
						</fieldset>
					</li>
					<li>
						<fieldset>
							<div id="title_div">
								<h1 class="title_h1">請勾選房源的設備與規範...</h1>
							</div>
							<div id="form_div">
								<div id="subform">
									<div class="st1">

										<span class="titlespan">設備:</span><br />

										<c:forEach var="device" items="${deviceList}">
											<label><input type="checkbox" name="roomDevice" id=""
												value="${device.id}" />${device.title} </label>
										</c:forEach>
									</div>
									<div class="st1">

										<span class="titlespan">服務:</span><br />

										<c:forEach var="serve" items="${serveList}">
											<label><input type="checkbox" name="roomServe" id=""
												value="${serve.id}" />${serve.title} </label>
										</c:forEach>
									</div>
									<div class="st1">

										<span class="titlespan">限制:</span><br />

										<c:forEach var="restrict" items="${restrictList}">
											<label><input type="checkbox" name="roomRestrict"
												id="" value="${restrict.id}" />${restrict.title} </label>
										</c:forEach>
									</div>
								</div>
							</div>
							<div id="leftdiv" class="btndiv">
								<a id="prev3" class="prev">《返回》</a>
							</div>
							<div id="rightdiv" class="btndiv">
								<button type="button" id="next4" class="next">下一步</button>
							</div>
						</fieldset>



					</li>
					<li>

						<fieldset>
							<div id="title_div">
								<h1 class="title_h1">請填寫房子的簡介...</h1>
							</div>
							<div id="form_div">
								<div id="subform">
									<div class="st1">
										<label for="comment" class="t1">簡介:</label><br />
										<textarea cols="40" rows="5" id="introduction"
											name="introduction" required></textarea>
									</div>
									<div class="st2">
										<input type="submit" id="submitbtn" value="送出" />
									</div>
								</div>
							</div>

							<div id="leftdiv" class="btndiv">
								<a id="prev4" class="prev">《返回》</a>
							</div>
						</fieldset>


					</li>
				</ul>

			</div>
		</form>

	</article>

	<script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
	<script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="${uriRoot}/scripts/key.js"></script>
	<script type="text/javascript" src="${uriRoot}/scripts/room/addRoom.js"></script>

	<script defer
		src="https://maps.googleapis.com/maps/api/js?key=${googleKey}">
	</script>


</body>
</html>
