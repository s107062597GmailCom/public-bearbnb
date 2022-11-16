<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<c:set var="urlRoot" value="${pageContext.request.contextPath}" />
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Show All Room</title>
				<link rel="stylesheet" href="${urlRoot}/styles/backstage/style5.css">
			</head>

			<body>

				<jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp" />
				<div class="wrapper">
					<nav id="sidebar">
						<div class="sidebar-header">
							<h2>後臺管理系統</h2>
						</div>

						<ul class="list-unstyled components">
							<li><a href="http://localhost:8090/bearbnb.com/listAccount">帳號管理</a>

							</li>
							<li><a href="http://localhost:8090/bearbnb.com/listOrder">訂單管理</a>
							</li>
							<li>
							<li><a href="http://localhost:8090/bearbnb.com/listRoom">房間管理</a>
							</li>

						</ul>

						<ul class="list-unstyled CTAs">
							<li><a href="http://localhost:8090/bearbnb.com/" class="article">返回首頁</a></li>
						</ul>
					</nav>
					<div id="content">
						<h2>查看所有房間</h2>
						<div>

							<form action="${urlRoot}/listLikeRoom" method="get">
								搜尋:<input type="text" name="likename">
								<button type="submit">送出</button>
							</form>
						</div>
						<div>

							<!-- <a href="${urlRoot}/room/add">add new room</a> -->
						</div>
						<div>
							<table>
								<tr>
									<th>選取
										<button class="delete">刪除</button>
									</th>
									<th>房間UUID</th>
									<th>價錢</th>
									<th>地址</th>
									<th>房間名稱</th>
									<th>所在城市</th>
									<th>擁有者</th>
									<th>房間狀態</th>
									<th>詳細資料</th>
									<!-- 				<th>delete</th> -->
								</tr>
								<c:forEach items="${page.content}" var="room">
									<tr data-id="${room.id}">
										<td><input type="checkbox" class="room-selected"></td>
										<td>${room.uuid}</td>
										<td>${room.price}</td>
										<td>${room.address}</td>
										<td>${room.information.title}</td>
										<td>${room.city.title}</td>
										<td>${room.owner.username}</td>
										<%-- <td>${room.status.title}</td> --%>
											<td><select class="roomStatus">
													<c:forEach var="roomStatus2" items="${roomStatusList}">
														<c:choose>
															<c:when test="${roomStatus2.title == room.status.title}">
																<option value="${roomStatus2.id }" selected>
																	${room.status.title}</option>
															</c:when>
															<c:otherwise>
																<option value="${roomStatus2.id }">
																	${roomStatus2.title}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>

												</select></td>
											<td><a href="${urlRoot}/room/info?id=${room.id}">詳細資訊</a></td>
											<%-- <td><a href="${urlRoot}/room/notRealDelete?id=${room.id}">delete</a>
												</td> --%>

												<!-- 					<td><button class="delete">delete</button></td> -->
									</tr>
								</c:forEach>
							</table>
						</div>





						<div class="flex">
							<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

								<c:choose>
									<c:when test="${page.number != pageNumber-1}">
										<a href="${urlRoot}/listRoom?p=${pageNumber}">${pageNumber}</a>
									</c:when>

									<c:otherwise>
										${pageNumber}
									</c:otherwise>
								</c:choose>

								<c:if test="${pageNumber !=  page.totalPages}">
									|
								</c:if>


							</c:forEach>
						</div>
					</div>
				</div>
				<script src="${urlRoot}/scripts/jquery-3.6.1.min.js"></script>
				<script type="text/javascript">

					universalHeaderController.slidableMode()


					$("select.roomStatus").change(function () {
						var id = ($(this).closest("tr").attr("data-id"))
						console.log(($(this).closest("tr").attr("data-id")))
						var statusId = ($(this).val())
						var xhr = new XMLHttpRequest();
						xhr.open("GET", "<c:url value='/changeRoomStatus' />" + "?statusId=" + statusId +
							"&id=" + id, true);
						xhr.send();

					})
					// 		notRealDelete
					$("button.delete").click(function () {
						fetch(
							$("input.room-selected:checked").each((idx, elm) => {
								var id2 = $(elm).closest("tr").attr("data-id")
								var xhr2 = new XMLHttpRequest();
								xhr2.open("GET", "<c:url value='/room/notRealDelete' />" + "?id2=" + id2, true);
								xhr2.send();

							})
						).then(function () {
							window.location = "http://localhost:8090/bearbnb.com/listRoom";
						})

					})


				</script>
			</body>

			</html>