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
    <link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
    <link rel="stylesheet" href="${uriRoot}/styles/index.css">
    <title>Bearbnb</title>
</head>
<body>
    <div id="global-background" class="global-background">
        <div id="main-container">
            <jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp"/>
            <main class="main-content">
                <div class="homepage-choose-all-wish-button homepage-wish-button">
                    <i class="fa-regular fa-heart"></i>
                </div>
                <div class="homepage-clear-all-wish-button homepage-wish-button">
                    <i class="fa-solid fa-trash"></i>
                </div>
                <div class="rooms-container">
                    <!-- <button class="room-container">
                        <div class="room-inner-container">
                            <div class="room-image-windows">
                                <div class="room-images-container">
                                    <div class="room-image-container">
                                        <img src="" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="room-text-container">
                                <div class="room-city-text-container room-index-text-container">
                                    台北市
                                </div>
                                <div class="room-distance-text-container room-index-text-container">
                                    距離 3768 公里
                                </div>
                                <div class="room-rent-date-text-container room-index-text-container">
                                    6 月 25 日至 7 月 2 日
                                </div>
                                <div class="room-price-text-container room-index-text-container">
                                    $24105 TWD 晚
                                </div>
                            </div>
                        </div>
                    </button> -->
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                    <i class="room-container"></i>
                </div>
            </main>
            <div class="detail-information-blk">
                <div class="detail-information-blk-inner-container unmatched-keyword-container">
                    缺少字詞：<span class="unmatched-keyword-span">中正路</span>&nbsp;
                </div>
                <div class="detail-information-divider"></div>
                <div class="detail-information-blk-inner-container detail-information-address-container">
                    地址：&nbsp;<span class="detail-information-address-span"></span><br>
                </div>
                <div class="detail-information-blk-inner-container detail-information-title-container">
                    名稱：&nbsp;<span class="detail-information-title-span"></span><br>
                </div>
                <div class="detail-information-blk-inner-container detail-information-owner-container">
                    房東：&nbsp;<span class="detail-information-owner-span"></span><br>
                </div>
            </div>
        </div>
    </div>
    <script src="${uriRoot}/scripts/index.js"></script>
</body>
</html>