<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="uriRoot" value="${pageContext.request.contextPath}"/>
<c:set var="isSignIn" value="${myaccount != null}"/>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <link rel="stylesheet" href="${uriRoot}/styles/fontawesome-free-6.1.2-web/css/all.min.css"/>
    <link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
    <link rel="stylesheet" href="${uriRoot}/styles/headers/universalheader.css">
</head>
<body>
    <div class="universalheader-filter">
        <div class="header-hello-world-btn-container">
            <div class="header-hello-world-hint">
                想出門卻不知道該去哪裡？<br>
                有想去的地方卻不知該如何規劃行程？<br>
                <h3>bearbnb 幫你搞定</h3>
            </div>
            <div class="header-hello-world-btn-inner-container">
                <button class="header-hello-world-btn header-hello-world-blk-btn">
                    完全不知<br>
                    該去哪<br><br>
                    ＼(ﾟ∀。)／
                </button>
                <button class="header-go-my-target-btn header-hello-world-blk-btn">
                    我有目標<br>
                    規劃行程就好<br><br>
                    ＼(•̀&nbsp;&nbsp;ᴗ&nbsp;&nbsp;•́)و
                </button>
            </div>
        </div>
    </div>
    <header class="universalheader">
        <div class="universalheader-inner-container">
            <div class="universal-header-navbar-container">
                <nav class="universal-header-navbar">
                    <div class="header-logo-container">
                        <a href="${uriRoot}/"><img class="header-logo" src="${uriRoot}/images/logo.png" alt="bearbnb logo"></a>
                    </div>
                    <div class="fake search-bar-container hover-shadow"></div>
                    <div class="header-menu-container">
                        <div class="header-menu">
                            <c:choose>
                                <c:when test="${isSignIn}">
                                    <button class="rent-room-shortcut-btn hover-background">
                                        <div class="rent-room-icon-container">
                                            前往出租模式
                                        </div>
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button class="sign-in-shortcut-btn hover-background">
                                        <div class="sign-in-icon-container">
                                            註冊 / 登入會員
                                        </div>
                                    </button>
                                </c:otherwise>
                            </c:choose>

                            <button class="regional-setting-btn hover-background">
                                <div class="regional-setting-icon-container">
                                    <i class="fa-solid fa-globe"></i>
                                </div>
                            </button>
                            <button class="account-menu-btn">
                                <div class="account-menu-btn hover-shadow">
                                    <div class="menu-icon-container">
                                        <div class="menu-icon">
                                            <div class="burger-menu-component"></div><div class="burger-menu-component"></div><div class="burger-menu-component"></div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${isSignIn}">
                                            <div class="header-account-photo-container">
                                                <img class="account-photo-img" src="${uriRoot}/photo/account/${myaccount.photo.uuid}" alt="">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="user-icon">
                                                <i class="fa-solid fa-user"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </button>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="rental-mode-header-menu">
            <div class="rental-mode-header-menu-inner-container">
                <button class="rental-mode-header-menu-option-btn my-chat-rooms-btn">
                    <div class="rental-mode-header-menu-option">
                        訊息
                    </div>
                </button>
                <button class="rental-mode-header-menu-option-btn rental-mode-room-src-btn">
                    <div class="rental-mode-header-menu-option">
                        房源
                    </div>
                </button>
                <!-- <button class="rental-mode-header-menu-option-btn rental-mode-order-btn">
                    <div class="rental-mode-header-menu-option">
                        預定
                    </div>
                </button> -->
                <div class="rental-mode-header-menu-divider"></div>
                <button class="rental-mode-header-menu-option-btn rental-mode-transitional-btn">
                    <div class="rental-mode-header-menu-option">
                        訂單管理
                    </div>
                </button>
                <!-- <button class="rental-mode-header-menu-option-btn rental-mode-view-rent-src-btn">
                    <div class="rental-mode-header-menu-option">
                        瀏覽出租資源
                    </div>
                </button> -->
            </div>
        </div>
        <div class="header-account-menu">
            <div class="header-account-menu-inner-container">
                <c:if test="${isSignIn}">
                    <div class="header-account-menu-account-info-blk">
                        <div class="header-account-menu-photo-container">
                            <img class="account-photo-img" src="${uriRoot}/photo/account/${myaccount.photo.uuid}" alt="">
                        </div>
                        <div class="header-account-menu-info-container">
                            ${myaccount.information.firstName}&nbsp;${myaccount.information.lastName}<br>
                            <span class="modify-my-account-info-btn">&nbsp;修改個人資料&nbsp;<span>
                        </div>
                    </div>
                    <div class="header-accont-menu-divider"></div>
                </c:if>
                <c:if test="${!isSignIn}">
                    <button class="sign-up-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            註冊
                        </div>
                    </button>
                </c:if>
                <c:if test="${!isSignIn}">
                    <button class="sign-in-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            登入
                        </div>
                    </button>
                </c:if>
                <c:if test="${isSignIn}">
                    <button class="my-trip-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            旅程
                        </div>
                    </button>
                </c:if>
                <div class="header-accont-menu-divider"></div>
                <c:if test="${isSignIn}">
                    <button class="my-chat-rooms-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            訊息
                        </div>
                    </button>
                    <button class="my-management-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            管理房源
                        </div>
                    </button>
                    <button class="goto-guest-mode-page-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            前往旅客模式
                        </div>
                    </button>
                </c:if>
                <c:if test="${isSignIn}">
                    <button class="rent-room-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            出租房源
                        </div>
                    </button>
                </c:if>
                <!-- <c:if test="${isSignIn}">
                    <button class="organize-activity-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            舉辦活動
                        </div>
                    </button>
                </c:if> -->
                <c:if test="${isSignIn}">
                    <button class="schedule-my-trip-plan-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            行程規劃
                        </div>
                    </button>
                </c:if>
                <c:if test="${isSignIn && myaccount.identity.id == 2}">
                    <div class="header-accont-menu-divider"></div>
                    <button class="go-backstage-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            後臺管理
                        </div>
                    </button>
                </c:if>
                <c:if test="${isSignIn}">
                    <div class="header-accont-menu-divider"></div>
                </c:if>
                <button class="give-me-help header-accont-menu-option-btn">
                    <div class="header-accont-menu-option">
                        幫助
                    </div>
                </button>
                <c:if test="${isSignIn}">
                    <button class="sign-out-btn header-accont-menu-option-btn">
                        <div class="header-accont-menu-option">
                            登出
                        </div>
                    </button>
                </c:if>
            </div>
        </div>
        <div class="rental-mode-main-menu-container">
            <div class="rental-mode-main-menu-inner-container">
                <button class="rental-mode-main-menu-option-btn my-chat-rooms-btn">
                    <div class="rental-mode-main-menu-option">
                        收件匣
                    </div>
                </button>
                <button class="rental-mode-main-menu-option-btn rental-mode-room-src-btn">
                    <div class="rental-mode-main-menu-option">
                        房源
                    </div>
                </button>
                <button class="rental-mode-main-menu-option-btn rental-mode-transitional-btn">
                    <div class="rental-mode-main-menu-option">
                        訂單管理
                    </div>
                </button>
                <button class="rental-mode-main-menu-option-btn open-rental-header-menu-btn">
                    <div class="rental-mode-main-menu-option">
                        選單&nbsp;<i class="fa-solid fa-angle-down"></i>
                    </div>
                </button>
            </div>
        </div>
        <div class="bus-search-bar-container bus search-bar-container hover-shadow">
            <button title="" class="bus search-bar-left-btn search-bar-btn hover-background">
                <div class="bus search-bar-left-input search-bar-input">
                    <div class="location-search-bar-normal-input">
                        任何地點
                    </div>
                    <div class="location-search-bar-full-input">
                        <div class="location-search-bar-input">
                            <label class="city-select-label" for="city-select">縣市：</label>
                            <select name="city" id="city-select">
                                <option value="0">任何地點</option>
                            </select>
                        </div>
                        <input id="header-address-input" class="location-search-bar-input search-bar-input" type="text" placeholder="搜尋關鍵字"/>
                    </div>
                </div>
            </button>
            <button title="" class="bus search-bar-middle-btn search-bar-btn hover-background">
                <div class="bus time-search-bar-input search-bar-middle-input search-bar-input">
                    <div class="time-search-bar-normal-input">
                        任何一週
                    </div>
                    <div class="time-search-bar-full-input" style="font-size: 8px;">
                        <div class="date-input-container">
                            <span class="start-date-hint">入住日期：</span>
                            <span class="start-date-span">----/--/--</span>
                            <!-- <label class="data-input-label" for="start-date-input">入住日期：</label><input id="start-date-input" name="start-date-input" type="date"> -->
                        </div>
                        <div class="date-input-container">
                            <span class="end-date-hint">退房日期：</span>
                            <span class="end-date-span">----/--/--</span>
                            <!-- <label class="data-input-label" for="end-date-input">退房日期：</label><input id="end-date-input" name="end-date-input" type="date"> -->
                        </div>
                    </div>
                </div>
            </button>
            <button title="" class="bus search-bar-middle-btn search-bar-btn hover-background">
                <div class="bus search-bar-right-input search-bar-input">
                    <div class="people-number-search-bar-normal-input">
                        單人旅行
                    </div>
                    <div class="people-number-search-bar-full-input">
                        <div class="people-number-input-blk">
                            <label class="data-input-label" for="adult-number-input">成人：</label>
                            <input id="adult-number-input" type="number" min="1" max="31" value="1">
                        </div>
                        <div class="people-number-input-blk">
                            <label class="data-input-label" for="child-number-input">孩童：</label>
                            <input id="child-number-input" type="number" min="0" max="31" value="0">
                        </div>
                    </div>
                </div>
            </button>
            <button title="" class="bus search-bar-btn execute-search-btn search-bar-right-btn">
                <div class="bus search-icon-container search-bar-input">
                    <div class="bus search-icon">
                        <i class="bus fa-solid fa-magnifying-glass"></i>
                    </div>
                </div>
            </button>
        </div>
        <div class="search-bar-filter search-bar-container"></div>
        <jsp:include page="/WEB-INF/views/objects/headers/universaldbcalendar.jsp"/>
    </header>
    <script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
    <script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
    <script src="${uriRoot}/scripts/headers/universalheader.js"></script>
</body>
</html>