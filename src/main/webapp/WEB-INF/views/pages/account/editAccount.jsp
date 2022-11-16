<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<c:set var="urlRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>Edit Account</title>
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
							<h3>帳號資料編輯</h3>
							<div class="line"></div>
							<form:form action="${urlRoot}/account/edit" method="post" modelAttribute="account"
								class="flex">

								<form:input path="id" type="hidden" />
								<form:input path="uuid" type="hidden" />
								<form:input path="salt" type="hidden" />
								<form:input path="username" type="hidden" />
								<form:input path="password" type="hidden" />
								<table>
									<tr>
										<th>帳號:</th>
										<td>
											${account.username }
										</td>
									</tr>
									<tr>
										<th>姓氏:</th>
										<td>
											<input type="text" name="lastName" value="${account.information.lastName}">
										</td>
									</tr>
									<tr>
										<th>名字:</th>
										<td>
											<input type="text" name="firstName"
												value="${account.information.firstName}">
										</td>
									</tr>
									<tr>
										<th>手機:</th>
										<td>
											<input type="text" name="phone" value="${account.information.phoneNumber}">
										</td>
									</tr>
									<tr>
										<th>電子信箱:</th>
										<td>
											<input type="text" name="email" value="${account.information.email}">
										</td>
									</tr>
									<tr>
										<th>性別:</th>
										<td>
											<c:choose>
												<c:when test="${account.information.gender == '109'}">
													<input type="radio" name="gender" value="m" checked>
													<label for="male">男</label>
													<input type="radio" name="gender" value="f">
													<label for="male">女</label>
												</c:when>
												<c:otherwise>
													<input type="radio" name="gender" value="m">
													<label for="male">男</label>
													<input type="radio" name="gender" value="f" checked>
													<label for="male">女</label>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>生日:</th>
										<td>
											${account.information.birthday }
										</td>
									</tr>
									<tr>
										<th>帳號身分:</th>
										<td>
											<select name="Account_Identity">
												<c:forEach items="${idList}" var="i">
													<c:choose>
														<c:when test="${i.title == account.identity.title }">
															<option value="${i.id}" selected>${account.identity.title}
															</option>
														</c:when>
														<c:otherwise>
															<option value="${i.id}">${i.title}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th>帳號狀態:</th>
										<td>
											<select name="Account_Status">
												<c:forEach items="${statusList}" var="s">
													<c:choose>
														<c:when test="${s.title == account.status.title }">
															<option value="${s.id}" selected>${account.status.title}
															</option>
														</c:when>
														<c:otherwise>
															<option value="${s.id}">${s.title}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</td>
									</tr>

								</table>
								<button type="submit">送出</button>
							</form:form>
						</div>
					</div>
					<script type="text/javascript">
						universalHeaderController.slidableMode()
					</script>
				</body>

				</html>