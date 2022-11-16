<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
    <link rel="stylesheet" href="${uriRoot}/styles/autoschedule/autoschedule.css">
    <title>自動排程</title>
</head>
<body>
    <div id="global-background" class="global-background">
        <div id="main-container">
            <jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp"/>
            <div class="main-content-container">
                <main class="main-content">
                    <div class="schedule-container">
                        <div class="schedule-rooms">
                            <div class="init-img-container">
                                <div class="init-img-inner-container">
                                    <h1>向世界說哈囉！</h1><br>
                                    <h3>讓 bearbnb 為你規劃行程</h3>
                                </div>
                            </div>
                            <!-- <div class="init-img-container-transparent">
                                <img src="${uriRoot}/images/loading.gif" alt="">
                            </div> -->
                            <!-- <button class="schedule-room-btn">
                                <div class="schedule-btn-filter"></div>
                                <div class="schedule-room-container">
                                    <div class="sc-room-info-part">
                                        <div class="room-photo-window">
                                            <div class="room-photos">
                                                <div class="room-photo-container">
                                                    <img class="room-image" src="photo/room/54856d30-1a87-461b-810e-fa25e86fd2bd">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="room-info-container">
                                            <div class="room-city-info-container room-info-idx-container">
                                                新北市
                                            </div>
                                            <div class="room-info-idx-container">
                                                車程 2 小時 18 分鐘
                                            </div>
                                            <div class="room-info-idx-container">
                                                距離 13.62 公里
                                            </div>
                                            <div class="room-date-info-container room-info-idx-container">
                                                2022 年 10 月 24 日 - 2022 年 10 月 25 日
                                            </div>
                                            <div class="room-info-idx-container">
                                                10000 TWD / 晚
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sc-travel-date-blk">
                                        <div class="sc-travel-date-container">
                                            <span class="data-rank">1st Day</span>
                                        </div>
                                    </div>
                                </div>
                            </button> -->
                        </div>
                    </div>
                    <div class="pseudo-controller-container">
                        <div class="schedule-controller-container">
                            <div class="schedule-controller">
                                <div class="schedule-inner-container">
                                    <div class="schedule-controller-hint-block">
                                        <div class="schedule-controller-hint-container">
                                            <h3>想在什麼時段旅行呢？</h3>
                                        </div>
                                    </div>
                                    <button class="schedule-controller-upper-input-block schedule-controller-input-block">
                                        <div class="schedule-controller-dates-input-container">
                                            <div class="schedule-controller-start-date-input-container">
                                                <div class="schedule-controller-date-input-hint">
                                                    出發日期
                                                </div>
                                                <div class="schedule-controller-start-date-input schedule-controller-common-date-input">
                                                    ----/--/--
                                                </div>
                                            </div>
                                            <div class="schedule-controller-end-date-input-container">
                                                <div class="schedule-controller-date-input-hint">
                                                    返家日期
                                                </div>
                                                <div class="schedule-controller-end-date-input schedule-controller-common-date-input">
                                                    ----/--/--
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                    <button class="schedule-controller-lower-input-block schedule-controller-input-block">
                                        <div class="schedule-controller-people-number-container">
                                            <div class="schedule-controller-people-number-input-hint">
                                                旅行人數
                                            </div>
                                            <div class="schedule-controller-people-number-input-container">
                                                <input class="schedule-controller-people-number-input" type="number" min="1" max="1023" value="1">
                                            </div>
                                        </div>
                                    </button>
                                    <div class="schedule-controller-checkbox-menu">
                                        <div class="schedule-controller-checkbox-container">
                                            <input type="radio" name="travelMode" id="close-distance-radio" value="bicycling">
                                            <label for="close-distance-radio" class="schedule-controller-radio-label">騎自行車</label>
                                        </div>
                                        <div class="schedule-controller-checkbox-container">
                                            <input type="radio" name="travelMode" id="far-distance-radio" value="driving" checked>
                                            <label for="far-distance-radio" class="schedule-controller-radio-label">開車</label>
                                        </div>
                                    </div>
                                    <div class="schedule-controller-search-btn-container">
                                        <button class="schedule-controller-search-btn">開始安排旅程</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="map-container">
                            <div class="map-inner-container">
                                <div class="schedule-map"></div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
    <script src="${uriRoot}/scripts/key.js"></script>
    <script src="${uriRoot}/scripts/autoschedule/schedulemap.js"></script>
    <script src="${uriRoot}/scripts/autoschedule/autoschedule.js"></script>
    <script defer src="https://maps.googleapis.com/maps/api/js?key=${googleKey}"></script>
</body>
</html>