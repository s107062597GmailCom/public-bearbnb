<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:if test="${myaccount == null}">
        <meta http-equiv="refresh" content="0;url=${uriRoot}">
    </c:if>
    <link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
    <link rel="stylesheet" href="${uriRoot}/styles/autoschedule/autotarget.css">
    <title>自動排程</title>
</head>
<body>
    <div id="global-background" class="global-background">
        <div class="main-container">
            <jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp"/>
            <main class="main-content">
                <div class="map-block">
                    <div class="map-block-inner-container">
                        <div class="show-map-btn-blk">
                            <div class="show-map-btn-container">
                                <i class="fa-solid fa-angle-left"></i>
                            </div>
                        </div>
                        <div class="google-map-container">
                            <div class="google-map"></div>
                        </div>
                    </div>
                </div>
                <div class="main-content-inner-container">
                    <div class="schedule-rooms-container">
                        <!-- <div class="schedule-rooms-init-inner-container">
                            <div class="schedule-rooms-init-hint">
                                <h1>向世界說哈囉！</h1><br>
                                <h3>讓 bearbnb 為你規劃行程</h3>
                            </div>
                        </div> -->
                        <!-- <button class="schedule-room-container-btn">
                            <div class="schedule-room-container">
                                <div class="schedule-room-info-part">
                                    <div class="room-photo-container">
                                        <img class="room-photo" src="photo/room/1374fc78-e48d-4f0a-8c32-5a5cdfce83aa" alt="">
                                    </div>
                                    <div class="schedule-room-info-container">
                                        <div class="room-info-idx-container room-info-city-idx-container">
                                            台北市
                                        </div>
                                        <div class="room-info-idx-container">
                                            夏天的溫馨小套房
                                        </div>
                                        <div class="room-info-idx-container room-info-duration-idx-container little-gray">
                                            車程 2 小時 22 分鐘
                                        </div>
                                        <div class="room-info-idx-container room-info-distance-idx-container little-gray">
                                            距離 125 公里 332 公尺
                                        </div>
                                        <div class="room-info-idx-container">
                                            2300 TWD / 晚
                                        </div>
                                    </div>
                                </div>
                                <div class="schedule-room-order-part">
                                    <div class="schedule-room-order-container">
                                        <span class="room-order-span">1st<br>Room</span>
                                    </div>
                                </div>
                            </div>
                        </button> -->
                    </div>
                    <div class="wishes-block-container">
                        <div class="wishes-window-container">
                            <div class="wish-list-schedule-hint-container">
                                <div class="wish-list-schedule-hint">
                                    請從心願單中選擇你要排程的房間
                                </div>
                            </div>
                            <div class="wishes-window">
                                <div class="wishes-container">
                                    <div class="wish-list-loading-container">
                                        <img src="${uriRoot}/images/loading.gif">
                                    </div>
                                </div>
                            </div>
                            <div class="wishes-window-btn-container">
                                <div class="auto-schedule-btn-container auto-schedule-btn-container-blk">
                                    <button class="auto-schedule-btn btn-in-auto-schedule-blk">開始排程</button>
                                </div>
                                <div class="choose-all-schedule-btn-container auto-schedule-btn-container-blk">
                                    <button class="choose-all-schedule-btn btn-in-auto-schedule-blk">全選</button>
                                </div>
                                <div class="reset-schedule-btn-container auto-schedule-btn-container-blk">
                                    <button class="reset-schedule-btn btn-in-auto-schedule-blk">清除</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="${uriRoot}/scripts/key.js"></script>
    <script src="${uriRoot}/scripts/autoschedule/googlemap.js"></script>
    <script src="${uriRoot}/scripts/autoschedule/calculator.js"></script>
    <script src="${uriRoot}/scripts/autoschedule/autotarget.js"></script>
    <script defer src="https://maps.googleapis.com/maps/api/js?key=${googleKey}"></script>
</body>
</html>