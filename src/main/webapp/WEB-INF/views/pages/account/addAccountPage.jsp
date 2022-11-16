<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

				<c:set var="urlRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>Add Account</title>
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
							<h3>新增帳戶</h3>
							<div class="line"></div>
							<div style="display:flex; justify-content:right">
								<a href="http://localhost:8090/bearbnb.com/listAccount">返回前頁</a>
							</div>
							<form:form action="${urlRoot}/account/post" method="post" modelAttribute="account">
								<table>
									<div>
										<tr>
											<th>帳號:</th>
											<td>
												<form:input path="username" />
											</td>

										</tr>
										<tr>
											<th>密碼:</th>
											<td>
												<form:input path="password" />
											</td>
										</tr>
										<tr>
											<th>salt:</th>
											<td>
												<form:input path="salt" />
											</td>
										</tr>
										<tr>
											<th>帳號身分:</th>
											<td><select name="Account_Identity">
													<c:forEach items="${idList}" var="a">

														<option value="${a.id}">${a.title}</option>

													</c:forEach>
												</select></td>

										</tr>
										<tr>

											<th>帳號狀態</th>
											<td><select name="Account_Status">
													<c:forEach items="${statusList}" var="s">

														<option value="${s.id}">${s.title}</option>

													</c:forEach>
												</select>
											</td>
										</tr>
									</div>






								</table>
								<button type="submit" class="btn btn-primary mb-2">送出</button>
							</form:form>



						</div>
					</div>
					<script type="text/javascript">
						universalHeaderController.slidableMode()
					</script>
				</body>

				</html>