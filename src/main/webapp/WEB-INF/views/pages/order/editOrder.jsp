<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<c:set var="urlRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>edit Order</title>
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
							<h3>編輯訂單:</h3>

							<form:form action="${urlRoot}/order/edit" method="post" modelAttribute="order">
								<form:input path="id" type="hidden" />
								<form:input path="account" type="hidden" />
								<form:input path="room" type="hidden" />
								<form:input path="uuid" type="hidden" />

								<table>
									<tr>
										<th>訂單UUID</th>
										<td>${order.uuid}</td>
									</tr>
									<tr>
										<th>訂單帳號</th>
										<td>${order.account.username}</td>
									</tr>
									<tr>
										<th>訂單房間</th>
										<td>${order.room.information.title}</td>
									</tr>
									<tr>
										<th>入住時間:</th>
										<td><input path="checkInDatetime"
												value="${order.checkInDatetime.getYear()+1900}-${order.checkInDatetime.getMonth()+1}-${order.checkInDatetime.getDate()}"
												name="CID" type="date" id="CID" /></td>
									</tr>
									<tr>
										<th>退房時間:</th>
										<td><input path="checkOutDatetime"
												value="${order.checkOutDatetime.getYear()+1900}-${order.checkOutDatetime.getMonth()+1}-${order.checkOutDatetime.getDate()}"
												name="COD" type="date" id="COD" /></td>
									</tr>

									<tr>
										<th>成人人數:</th>
										<td>
											<input type="number" value="${order.adultCount}"
												onkeyup="value=value.replace(/[^\d]/g,'')" path="adultCount"
												name="adult" min="1" max="" />
											<!-- <form:input path="adultCount" /> -->
										</td>
									</tr>
									<tr>
										<th>小孩人數:</th>
										<td><input type="number" value="${order.childCount}" min="0"
												onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" path="childCount"
												name="child" /> <!-- <form:input path="childCount" /> -->

										</td>
									</tr>
									<tr>
										<th>價格:</th>
										<td>
											<form:input path="price" />
										</td>
									</tr>
									<tr>
										<th>訂單狀態:</th>
										<td><select name="status">
												<c:forEach items="${osList}" var="s">
													<c:choose>
														<c:when test="${s.title == order.status.title }">
															<option value="${s.id}" selected>
																${order.status.title}</option>
														</c:when>
														<c:otherwise>

															<option value="${s.id}">${s.title}</option>

														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select></td>
									</tr>
								</table>
								<button type="submit">送出</button>






								<!-- 	<div>Account: -->
								<!-- 	<select name="account"> -->
								<%-- <c:forEach items="${accList}" var="a"> --%>

									<%-- <option value="${a.id}">${a.username}</option> --%>

										<%-- </c:forEach> --%>
											<!-- 	</select> -->
											<!-- 	<br></br> -->
											<!-- 	</div> -->

											<!-- 	<div> -->

											<!-- 				ROOM:<select name="room"> -->
											<%-- <c:forEach items="${RoomList}" var="i"> --%>

												<%-- <option value="${i.id}">${i.information.title}</option> --%>

													<%-- </c:forEach> --%>
														<!-- 				</select><br></br> -->
														<!-- 				</div> -->




							</form:form>
						</div>
					</div>
					<script type="text/javascript">
						universalHeaderController.slidableMode();

						// { 工具 }：專門為小時補上0的工具
						function timeFixer(time) {
							if (time.toString().length < 2) {
								return "0" + time;
							} else {
								return time;
							}
						}
						let CID = ${ order.checkInDatetime.getYear() + 1900}+"-" + timeFixer(${ order.checkInDatetime.getMonth() + 1 }) + "-" + timeFixer(${ order.checkInDatetime.getDate() });
						$("#CID").val(CID);
						let COD = ${ order.checkOutDatetime.getYear() + 1900}+"-" + timeFixer(${ order.checkOutDatetime.getMonth() + 1 }) + "-" + timeFixer(${ order.checkOutDatetime.getDate() });
						$("#COD").val(COD);

					</script>

					<!-- //{工具}：專門為小時補上0的工具
				        function timeFixer(time) {
				            if (time.toString().length < 2) {
				                return "0" + time;
				            } else {
				                return time;
				            }
				        }
						let CID = ${order.checkInDatetime.getYear()+1900}+"-"+timeFixer(${order.checkInDatetime.getMonth()+1})+"-"+timeFixer(${order.checkInDatetime.getDate()});
						$("#CID").val(CID);
						let COD = ${order.checkOutDatetime.getYear()+1900}+"-"+timeFixer(${order.checkOutDatetime.getMonth()+1})+"-"+timeFixer(${order.checkOutDatetime.getDate()});
 						$("#COD").val(COD);

						</script> -->

				</body>

				</html>