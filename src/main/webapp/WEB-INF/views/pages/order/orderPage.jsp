<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<c:set var="urlRoot" value="${pageContext.request.contextPath}" />
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Show All Order</title>
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
						<h2>查看所有訂單</h2>
						<div>

							<form action="${urlRoot}/listLikeOrder" method="get">
								搜尋:<input type="text" name="likename">
								<button type="submit">送出</button>
							</form>
						</div>
						<div style="display:flex; justify-content: space-between;">
							<div>
								<form action="${urlRoot}/listOrderDateQuery" method="get">
									入住日期:<input type="date" name="CIDquery">
									退房日期:<input type="date" name="CODquery">
									<button type="submit">搜尋</button>
								</form>
							</div>
							<!-- <div><a href="${urlRoot}/order/add">新增訂單</a></div> -->
						</div>

						<table>
							<tr>
								<th>選取 <button class="delete">刪除</button></th>
								<th>訂單UUID</th>
								<th>帳號</th>
								<th>房間名稱</th>
								<th>入住日期</th>
								<th>退房日期</th>
								<th>訂單建立時間</th>
								<th>成人人數</th>
								<th>孩童人數</th>
								<th>價錢</th>
								<th>訂單狀態</th>
								<th>編輯</th>
								<th>訂單資訊</th>
								<!-- 				<th>allInfo</th> -->
							</tr>
							<c:forEach items="${page.content}" var="order">
								<tr data-id="${order.id}">
									<td><input type="checkbox" class="order-selected" value="${order.id}"></td>
									<td>${order.uuid}</td>
									<td>${order.account.username}</td>
									<td>${order.room.information.title}</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd EEEE" value="${order.checkInDatetime}" />
									</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd EEEE" value="${order.checkOutDatetime}" />
									</td>
									<td>
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${order.createdAt}" />
									</td>
									<td>${order.adultCount}</td>
									<td>${order.childCount}</td>
									<td>${order.price}</td>
									<td>${order.status.title}</td>
									<td><a href="${urlRoot}/order/edit?id=${order.id}">編輯</a></td>
									<td><a href="${urlRoot}/order/info?id=${order.id}">訂單資訊</a></td>

								</tr>
							</c:forEach>
						</table>
						<div class="flex">
							<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

								<c:choose>
									<c:when test="${page.number != pageNumber-1}">
										<a href="${urlRoot}/listOrder?p=${pageNumber}">${pageNumber}</a>
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

					//	notRealDelete
					// $("button.delete").click(function () {
					// 	fetch(
					// 		$("input.order-selected:checked").each((idx, elm) => {
					// 			var id = $(elm).closest("tr").attr("data-id")
					// 			var xhr2 = new XMLHttpRequest();
					// 			xhr2.open("GET", "<c:url value='/order/notRealDelete' />" + "?id=" + id, true);
					// 			xhr2.send();
					// 		})
					// 	).then(function () {
					// 		window.location = "http://localhost:8090/bearbnb.com/listOrder";

					// 	})

					// })
					$("button.delete").click(function () {
						$("input.order-selected:checked").each(function (idx, elm) {

							let targetElm = $(elm).closest("tr");

							fetch("<c:url value='/order/notRealDelete?id='/>" + targetElm.attr("data-id")).then(function (result) {
								return result.text();
							}).then(function (rText) {
								targetElm.children()[10].innerHTML = "已取消"
							})
						})
					})


				</script>
			</body>

			</html>