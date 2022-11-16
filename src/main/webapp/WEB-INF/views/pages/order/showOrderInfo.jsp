<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<c:set var="urlRoot" value="${pageContext.request.contextPath}" />

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>show Info</title>
				<link rel="stylesheet" href="${urlRoot}/styles/backstage/style4.css">
			</head>

			<body>
				<jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp" />

				<div class="wrapper">
					<nav id="sidebar">
						<div class="sidebar-header">
							<h2>後臺管理系統</h2>
						</div>

						<ul class="list-unstyled components">


							</li>
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
					<div id="content" class="flex">
						<h3 >訂單詳細資料</h3>

						<table>
							<tr>
								<th>訂單UUID:</th>
								<td>${order.uuid}</td>
							</tr>
							<tr>
								<th>訂購人帳號:</th>
								<td>${order.account.username}</td>
							</tr>
							<tr>
								<th>訂購人姓氏: </th>
								<td> ${ order.account.information.lastName}</td>
							</tr>
							<tr>
								<th> 訂購人名字: </th>
								<td> ${ order.account.information.firstName} </td>
							</tr>
							<tr>
								<th>訂購的房間名稱: </th>
								<td> ${ order.room.information.title}</td>
							</tr>
							<tr>
								<th> 訂購的房間城市:</th>
								<td> ${ order.room.city.title}</td>
							</tr>
							<tr>
								<th> 訂購的房間地址:</th>
								<td> ${ order.room.address} </td>
							</tr>
							<tr>
								<th> 入住日期:</th>
								<td> ${ order.checkInDatetime }</td>
							</tr>
							<tr>
								<th> 退房日期:</th>
								<td> ${ order.checkOutDatetime}</td>
							</tr>
							<tr>
								<th> 成人人數:</th>
								<td> ${ order.adultCount}</td>
							</tr>
							<tr>
								<th> 小孩人數:</th>
								<td> ${ order.childCount}</td>
							</tr>
							<tr>
								<th> 訂購價格: </th>
								<td> ${ order.price}</td>
							</tr>
							</tr>
							<tr>
								<th> 訂單狀態: </th>
								<td> ${ order.status.title}</td>
							</tr>
							<br>
						</table>
						<div class="flex">
							<button onclick="location.href='${urlRoot}/order/edit?id=${order.id}'">編輯此筆訂單</button>
							<button onclick="location.href='http://localhost:8090/bearbnb.com/listOrder'">返回前頁</button>
						</div>
					</div>

				</div>
				<script type="text/javascript">
						universalHeaderController.slidableMode()
					</script>
			</body>

			</html>