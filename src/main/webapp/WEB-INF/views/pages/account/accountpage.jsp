<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="urlRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>Account Page</title>
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
				
				<!-- <li class="active">

					<a href="http://localhost:8090/bearbnb.com/listAccount"
					data-toggle="collapse" aria-expanded="false"
					class="dropdown-toggle">帳號管理</a>
					<ul class="collapse list-unstyled" id="homeSubmenu">
						<li><a href="http://localhost:8090/bearbnb.com/account/add">帳號新增</a></li>
						<li><a href="#">帳號管理</a></li>
					</ul>
					</li>
				</li> -->
				<li><a href="http://localhost:8090/bearbnb.com/listAccount">帳號管理</a>
					
				</li>	
				<li><a href="http://localhost:8090/bearbnb.com/listOrder">訂單管理</a>
				</li>	
				<li>
				<li><a href="http://localhost:8090/bearbnb.com/listRoom">房間管理</a>
				</li>	
				<!-- <a href="http://localhost:8090/bearbnb.com/listRoom" data-toggle="collapse" aria-expanded="false"
					class="dropdown-toggle">房間管理</a>
				<ul class="collapse list-unstyled" id="pageSubmenu">
					<li><a href="#">新增房間</a></li>
					<li><a href="#">房間管理</a></li>

				</ul>
				</li> -->
			

			</ul>

			<ul class="list-unstyled CTAs">
				<li><a href="http://localhost:8090/bearbnb.com/" class="article">返回首頁</a></li>
			</ul>
		</nav>

		<div id="content">
			<h1>查看所有帳號</h1>
			<div>

				<form action="${urlRoot}/listLike" method="get">
					搜尋:<input type="text" name="likename">
					<button type="submit">送出</button>
				</form>
				
			</div>
			<!-- <div style="display:flex; justify-content: space-between;">
				
				<div><a  href="${urlRoot}/account/add">新增帳號</a></div>
				
			</div> -->
			<table>
				<tr>
					<th>選取 <button class="delete">刪除</button></th>
					<th>帳號的UUID</th>
					<th>帳號</th>
					<th>建立帳號時間</th>
					<th>帳號身分</th>
					<th>帳號狀態</th>
					<th>詳細資訊</th>
					<th>編輯</th>
					<th>刪除</th>
				</tr>
				<c:forEach items="${page.content}" var="account">
					<tr data-id="${account.id}">
						
						<td><input type="checkbox" class="account-selected"
							value="${account.id}"></td>
						<td>${account.uuid}</td>
						<td>${account.username }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
								value="${account.createdAt}" /></td>
						<td>${account.identity.title}</td>
						<td>${account.status.title}</td>


							<td><a href="${urlRoot}/account/info?id=${account.id}">詳細資訊</a></td>
						<td><a href="${urlRoot}/account/edit?id=${account.id}">編輯</a></td>
						<td><a
							href="${urlRoot}/account/notRealDelete?id=${account.id}">刪除</a></td>


					</tr>

				</c:forEach>
			</table>
			

			<div class="flex">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<c:choose>
						<c:when test="${page.number != pageNumber-1}">
							<a href="${urlRoot}/listAccount?p=${pageNumber}">${pageNumber}</a>
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
				
				$("button.delete").click(function () {
					$("input.account-selected:checked").each(function(idx, elm){
						
						let targetElm = $(elm).closest("tr");
						
						fetch("<c:url value='/account/notRealDelete?id='/>"+targetElm.attr("data-id")).then(function(result){
							return result.text();
						}).then(function(rText){
							targetElm.children()[5].innerHTML="禁止使用"
		
						})
						
					})
					
				})
				
				
				
				
				
				
				
				
					//		notRealDelete
// 					$("button.delete").click(function () {
// 						fetch(
// 							$("input.account-selected:checked").each((idx, elm) => {
// 								var id = $(elm).closest("tr").attr("data-id")
// 								var xhr2 = new XMLHttpRequest();
// 								xhr2.open("GET", "<c:url value='/account/notRealDelete' />" + "?id=" + id, true);
// 								xhr2.send();

// 							})
// 						).then(function (result) {
// 						return result.text();
// 						}).then(function(textResult){
							
// 							var id = $(elm).closest("tr").attr("data-id")

// 							if(textResult=="done"){

								
// 							}
							
// 						})

// 					})


				</script>
				
</body>

</html>