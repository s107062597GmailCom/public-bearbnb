<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <link rel="stylesheet" href="${uriRoot}/styles/fontawesome-free-6.1.2-web/css/all.min.css"/>
    <link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
    <link rel="stylesheet" href="${uriRoot}/styles/headers/universaldbcalendar.css">
</head>
<body>
    <div class="universal-double-calendar-container">
        <div class="universal-double-calendar-inner-container">
            <button class="double-calendar-move-up double-calendar-move-btn">
                <i class="fa-solid fa-caret-up"></i>
            </button>
            <button class="double-calendar-move-down double-calendar-move-btn">
                <i class="fa-solid fa-caret-down"></i>
            </button>
            <button class="double-calendar-move-left double-calendar-move-btn">
                <i class="fa-solid fa-caret-left"></i>
            </button>
            <button class="double-calendar-move-right double-calendar-move-btn">
                <i class="fa-solid fa-caret-right"></i>
            </button>
            <div class="double-calendar-tool-box">
                <button class="double-calendar-reset-btn double-calendar-tool-btn">
                    重新設定
                </button>
                <button class="double-calendar-back-btn double-calendar-tool-btn">
                    回到本月
                </button>
            </div>
            <div class="double-calendar-window">
                <div class="all-calendar-list">
                    <div class="calendar-list">
                        <div class="calendar-container"></div>
                        <div class="calendar-container"></div>
                        <div class="calendar-container"></div>
                        <div class="calendar-container"></div>
                    </div>
                    <div class="calendar-list">
                        <div class="calendar-container"></div>
                        <div class="calendar-container">
                            <div class="calendar">
                                <div class="calendar-header">2022 年 5 月</div>
                                <div class="calendar-body">
                                    <table class="calendar-table">
                                        <thead>
                                            <tr class="calendar-table-tr">
                                                <th>日</th>
                                                <th>一</th>
                                                <th>二</th>
                                                <th>三</th>
                                                <th>四</th>
                                                <th>五</th>
                                                <th>六</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="calendar-table-tr">
                                                <td></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                            </tr>
                                            <tr class="calendar-table-tr">
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                            </tr>
                                            <tr class="calendar-table-tr">
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                            </tr>
                                            <tr class="calendar-table-tr">
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                            </tr>
                                            <tr class="calendar-table-tr">
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                            </tr>
                                            <tr class="calendar-table-tr">
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                                <td><div><button></button></div></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="calendar-container"></div>
                        <div class="calendar-container"></div>
                    </div>
                    <div class="calendar-list">
                        <div class="calendar-container"></div>
                        <div class="calendar-container"></div>
                        <div class="calendar-container"></div>
                        <div class="calendar-container"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
    <script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
    <script src="${uriRoot}/scripts/headers/universaldbcalendar.js"></script>
</body>
</html>