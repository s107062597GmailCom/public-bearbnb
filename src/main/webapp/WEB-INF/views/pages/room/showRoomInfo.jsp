<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                            <h3>房間詳細資料</h3>
                            <table>
                                <tr>
                                    <th>房間UUID:</th>
                                    <td>${room.uuid}</td>
                                </tr>
                                <tr>
                                    <th>房間名稱:</th>
                                    <td>${room.information.title}</td>
                                </tr>
                                <tr>
                                    <th>地址: </th>
                                    <td>${room.address}</td>
                                </tr>
                                <tr>
                                    <th> 價格: </th>
                                    <td>${room.price} </td>
                                </tr>
                                <tr>
                                    <th> 房間主人帳號:</th>
                                    <td> ${room.owner } </td>

                                </tr>
                                <tr>
                                    <th>最大容納人數: </th>
                                    <td> ${ room.information.maxPeopleCapacity}</td>
                                </tr>
                                <tr>
                                    <th>最小容納人數:</th>
                                    <td> ${ room.information.minPeopleCapacity}</td>
                                </tr>

                                <tr>
                                    <th> 單人床數量:</th>
                                    <td> ${room.information.singleSizeBedCount}</td>
                                </tr>
                                <tr>
                                    <th> 雙人床數量: </th>
                                    <td> ${room.information.doubleSizeBedCount}</td>
                                </tr>
                                <tr>
                                    <th> 地板床數量: </th>
                                    <td> ${room.information.singleSizeBedCount}</td>
                                </tr>
                                <tr>
                                    <th> 臥室數量: </th>
                                    <td> ${room.information.singleSizeBedCount}</td>
                                </tr>
                                <tr>
                                    <th> 廁所數量: </th>
                                    <td> ${room.information.bedroomCount}</td>
                                </tr>
                                <tr>
                                    <th> 地板床數量: </th>
                                    <td> ${room.information.bathroomCount}</td>
                                </tr>
                                <tr>
                                    <th> 房間介紹: </th>
                                    <td> ${room.information.introduction}</td>
                                </tr>
                                <tr>
                                    <th> 房間狀態: </th>
                                    <td> ${room.status.title}</td>
                                </tr>
                                <br>
                            </table>
                            <div class="flex">


                                <button
                                    onclick="location.href='http://localhost:8090/bearbnb.com/listRoom'">返回前頁</button>
                            </div>
                        </div>




                    </div>
                    <script type="text/javascript">
                        universalHeaderController.slidableMode()
                    </script>
                </body>

                </html>