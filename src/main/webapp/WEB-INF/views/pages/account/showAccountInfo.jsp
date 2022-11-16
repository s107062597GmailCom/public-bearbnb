<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<c:set var="urlRoot" value="${pageContext.request.contextPath}" />
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
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
						<h3>帳號詳細資料</h3>

						<table>
							<tr>
								<th>帳號UUID:</th>
								<td>${account.uuid}</td>
							</tr>
							<tr>
								<th>帳號:</th>
								<td>${account.username}</td>
							</tr>
							<tr>
								<th>姓氏: </th>
								<td>${account.information.lastName}</td>
							</tr>
							<tr>
								<th> 名字: </th>
								<td>${account.information.firstName} </td>
							</tr>
							<tr>
								<th> 性別:</th>
								<!-- <td> ${ account.information.gender} </td> -->
								<td>
									<c:choose>
										<c:when test="${account.information.gender == '109'}">
											男
										</c:when>
										<c:otherwise>
											女
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>手機: </th>
								<td> ${ account.information.phoneNumber}</td>
							</tr>
							<tr>
								<th> 電子信箱:</th>
								<td> ${ account.information.email}</td>
							</tr>

							<tr>
								<th> 生日:</th>
								<td> ${account.information.birthday}</td>
							</tr>
							<tr>
								<th> 帳號身分: </th>
								<td> ${account.identity.title}</td>
							</tr>
							<tr>
								<th> 帳號狀態: </th>
								<td> ${account.status.title}</td>
							</tr>
							<br>
						</table>
						<div class="flex">

							<button onclick="location.href='${urlRoot}/account/edit?id=${account.id}'">編輯此帳號</button>
							<button
								onclick="location.href='http://localhost:8090/bearbnb.com/listAccount'">返回前頁</button>
						</div>
					</div>

				</div>
				<script type="text/javascript">
					universalHeaderController.slidableMode()
				</script>
			</body>

			</html>