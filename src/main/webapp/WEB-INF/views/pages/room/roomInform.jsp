<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<c:set var="uriRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
 
 <link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
    <style>
        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            text-decoration: none;
            color: black;
        }


        .inform-page-container {
            width: 90vw;
            margin: auto;
        }

        .inform-page-container-host {
            margin-top: 5vh;
            margin-bottom: 5vh;
        }

        .roomdetail-header {
            display: flex;
            justify-content: space-between;
            width: 55%;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .roomdetail-header-title {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .hostPicture {
            border-radius: 100px;
            width: 100px;
            height: 100px;
        }

        .roomdetail-blocks {
            width: 55%;
            border-top: 1px #D0D0D0 solid;
            overflow: hidden;
        }



        .roomdetail-baseinform-block {
            display: flex;
            margin: 20px;
        }

        .roomdetail-baseinform-block-icon {
            font-size: 30px;
            display: flex;
            margin-right: 20px;
            justify-content: center;
            align-items: center;
        }

        .roomdetail-baseinform-block-icon-sub {
            color: gray;
        }

        .roomdetail-description-content {
            margin: 20px;
        }

        .roomdetail-offer-blocks {
            margin: 20px
        }

        .roomdetail-description-content-readmore {
            margin-top: 10px;
        }

        .showalloffers-btn {
            border: 1px black solid;
            width: 200px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: .3s;
        }

        .showalloffers-btn:hover {
            background-color: #3C3C3C;
            color: white;
        }

        .roomdetail-offer-alloffers {
            width: 60%;
            display: flex;
            justify-content: space-between;
        }

        .roomdetail-offer-alloffers div {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .roomdetail-offer-alloffers span {
            margin-right: 10px;
        }

        .roomdetail-calendar * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .roomdetail-calendar-container {
            width: 200%;
            height: 100%;
            left: -50%;
            transition: .5s;
            position: relative;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .roomdetail-calendar-calendar {
            width: 23%;
            height: 25rem;
            position: relative;
        }



        .month {
            width: 100%;
            height: 15%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 2rem;
        }

        .fas {
            font-size: 1rem;
            cursor: pointer;
            z-index: 10;
        }

        .month h1 {
            font-size: 1.5rem;
            font-weight: 400;
            text-transform: uppercase;
            letter-spacing: 0.2rem;
            margin-bottom: 1rem;
            text-align: center;
        }

        .month p {
            font-size: 1.5rem;
            text-align: center;
        }

        .weekdays {
            width: 100%;
            height: 5%;
            display: flex;
            padding: 0 0.4rem;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }

        .weekdays div {
            border-radius: 100px;
            font-weight: 400;
            font-size: .8rem;
            width: calc(100%/7);
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .days {
            width: 100%;
            display: flex;
            padding: 0 0.4rem;
            flex-wrap: wrap;

            align-items: center;

        }

        .days div {
            border-radius: 100px;
            aspect-ratio: 1 / 1;
            width: calc(100%/7);
            font-size: .8rem;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: .5s;
        }

        .curr-date:hover {
            border: #3C3C3C 1px solid;
            cursor: pointer;
            position: relative;
        }

        .prev-date,
        .next-date {
            opacity: 0.5;
        }

        .fa-angle-left {
            position: relative;
            top: 2.5rem;
            left: 5%;
        }

        .fa-angle-right {
            position: relative;
            top: 2.5rem;
            left: 91%;
        }

        .booked,
        .bookedSt,
        .bookedEd {
            color: #D0D0D0;
        }

        .chosenTimes {
            border-radius: 1.5px !important;
            background-color:#F0F0F0	 ;
        }

        .chosenStTime {
            background-color: #3C3C3C;
            color: white;
        }



        .chosenEdTime {
            background-color: #3C3C3C;
            color: white;
        }

        .clearSelected {
            cursor: pointer;
            text-decoration: underline;
        }
        
        .availableEdTime{
            font-weight: 500;
            color: #f00000;
        }
        
                .order-making-column {
            width: 30%;
            /* height: 30rem; */
            border: 1px rgb(221, 221, 221) solid;
            border-radius: 20px;
            position: fixed;
            top: 5rem;
            right: 5rem;
            box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
            padding: 20px;
        }

        .order-making-column-subs {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .order-making-column-price {
            width: 100%;
            display: flex;
            justify-content: space-around;
            align-items: center;


        }

        .order-making-column-price-per {
            font-size: 20px;
            font-weight: 600;
        }

        .order-making-column-price-night {
            font-size: 15px;
            font-weight: 400;
        }

        .order-making-column-price-rating {
            font-size: 15px;
        }

        .order-making-column-form {
            width: 90%;
            height: 8rem;
            margin: auto;
            border: 1px rgb(194, 194, 194) solid;
            border-radius: 10px;
        }

        .order-making-column-date {
            width: 100%;
            height: 50%;
            border-bottom: 1px rgb(194, 194, 194) solid;
            display: flex;
        }

        .order-making-column-count {
            width: 100%;
            height: 50%;
            border-top: 0px rgb(194, 194, 194) solid;
            padding: 3%;
            font-size: 15px;
        }

        .order-making-column-stDate {
            width: 50%;
            height: 100%;
            border-right: 1px rgb(194, 194, 194) solid;
            padding: 3%;
            font-size: 15px;
        }

        .order-making-column-edDate {
            width: 50%;
            height: 100%;
            border-right: 0px rgb(194, 194, 194) solid;
            padding: 3%;
            font-size: 15px;
        }

        .order-making-column-input {
            width: 80%;
            border: 0px;
            outline: none;
        }

        .order-making-column-submit {
            width: 90%;
            height: 3rem;
            border: 0px;
            margin-left: 5%;
            margin-right: 5%;
            background-color: #F00078;
            color: white;
            border-radius: 10px;
            transition: .3s;
        }

        .order-making-column-submit:active {
            background-color: #f00000;
            width: 88%;
            height: 2.9rem;
            margin-left: 6%;
            margin-right: 6%;
        }

        .order-making-column-count-form {
            display: flex;
            align-items: center;
        }

        .order-making-column-count-input {
            width: 15%;
            border: 0px;
            outline: none;
        }

        .order-making-column-calculate {
            width: 90%;
            margin-left: 5%;
            margin-right: 5%;
            display: flex;
            justify-content: space-between;

        }

        .order-making-column-final {
            width: 90%;
            margin-top: 10%;
            margin-left: 5%;
            margin-right: 5%;
            padding-top: 5%;
            border-top: #D0D0D0 1px solid;
            display: flex;
            justify-content: space-between;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
	 <div class="order-making-column">
        <div class="order-making-column-price order-making-column-subs">
            <div class="order-making-column-price-per"><span>$ <span class="price-perNight">3588</span> TWD</span>
                <span class="order-making-column-price-night">晚</span> </div>
            <div class="order-making-column-price-rating"><i class="fa-solid fa-star"></i>4.78 · <a
                    href="#"><u>151則評價</u></a></div>
        </div>
        <form action="">
            <div class="order-making-column-form order-making-column-subs">

                <div class="order-making-column-date">
                    <div class="order-making-column-stDate">
                        <div>入住</div>
                        <input type="text" placeholder="選取日期" class="order-making-column-input">
                    </div>
                    <div class="order-making-column-edDate">
                        <div>退房</div>
                        <input type="text" placeholder="選取日期" class="order-making-column-input">
                    </div>
                </div>
                <div class="order-making-column-count">
                    <div>房客</div>
                    <div class="order-making-column-count-form">
                        <input type="number" class="order-making-column-count-input" value="1">
                        <div>位</div>
                    </div>

                </div>
            </div>
            <input type="button" value="預定" class="order-making-column-submit order-making-column-subs">
            <div class="order-making-column-subs order-making-column-calculate hidden">
                <span>$3588 TWD x <span class="nights"></span>晚
                </span>
                <span>$<span class="price"></span> TWD</span>
            </div>
            <div class="order-making-column-subs order-making-column-final hidden">
                <span>稅前總額</span>
                <span>$<span class="finalPrice"></span> TWD</span>
            </div>
        </form>
    </div>
	
    <div class="inform-page-container">
        <div class="inform-page-container-roomdetail">
            <div class="roomdetail-header">
                <div class="roomdetail-header-title">
                    <h4>麗芳出租的臺灣民宿中的獨立房間</h4>
                    <p>2位．1間臥室．2張床．1.5間衛浴
                    </p>
                </div>
                <div class="host-photo">
                    <a href="#"><img src="${uriRoot}/images/host_photo.jpeg" class="hostPicture"></a>
                </div>
            </div>
            <div class="roomdetail-baseinform roomdetail-blocks">
                <div class="roomdetail-baseinform-block">
                    <div class="roomdetail-baseinform-block-icon"><i class="fa-solid fa-award"></i></div>
                    <div>
                        <div>麗芳是超讚房東</div>
                        <div class="roomdetail-baseinform-block-icon-sub">超讚房東是經驗豐富、評價超高的房東，致力為房客提供最棒的住宿體驗。
                        </div>
                    </div>
                </div>

                <div class="roomdetail-baseinform-block">
                    <div class="roomdetail-baseinform-block-icon"><i class="fa-solid fa-location-dot"></i></div>
                    <div>
                        <div>絕佳位置
                        </div>
                        <div class="roomdetail-baseinform-block-icon-sub">最近有100%的房客給予房源位置5星評分。
                        </div>
                    </div>
                </div>

                <div class="roomdetail-baseinform-block">
                    <div class="roomdetail-baseinform-block-icon"><i class="fa-solid fa-key"></i></div>
                    <div>
                        <div>超棒入住體驗
                        </div>
                        <div class="roomdetail-baseinform-block-icon-sub">最近有100%的房客給予入住流程5星評分。
                        </div>
                    </div>
                </div>
            </div>
            <div class="roomdetail-description roomdetail-blocks">
                <div class="roomdetail-description-content">
                    <span>我的房源交通便利、提供接送。因為景觀、舒適、地段、寬敞房間、活力早餐,您一定會愛上我的房源。適合情侶、背包客、商務旅客、有小孩的家庭。</span><br>
                    <span>此房源位於二樓視野極佳,一樓為大廳。</span><br>
                    <span>私人套房、獨立衛浴、私密性高、環境安全舒適,房間寬敞、特大床、四個枕頭、可供2人住宿。客房備有電視(含有線電視頻道)、Wifi、茶包、吹風機、冰箱、衣架、牙刷、浴巾、沐浴乳、洗髮乳、浴帽、拖鞋、紙毛巾、香皂、熱水壺、電風扇、冰箱、乾溼分離衛浴、大浴...</span>
                    <div class="roomdetail-description-content-readmore"><a href="#"><b>顯示更多內容>
                            </b></a></div>
                </div>
            </div>

            <div class="roomdetail-offer roomdetail-blocks">
                <div class="roomdetail-offer-blocks">
                    <h4>有提供的設備與服務</h4>
                    <div class="roomdetail-offer-alloffers">
                        <div class="roomdetail-offer-icons">
                            <div><span><i class="fa-solid fa-wifi"></i></span>WiFi</div>
                            <div><span><i class="fa-solid fa-tv"></i></span>42吋大電視</div>
                            <div><span><i class="fa-sharp fa-solid fa-snowflake"></i></span>空調設備</div>
                            <div><span><i class="fa-sharp fa-solid fa-mug-saucer"></i></span>提供早餐</div>
                            <div><span><i class="fa-solid fa-mountain-sun"></i></span>山谷景觀</div>

                        </div>
                        <div class="roomdetail-offer-icons">
                            <div><span><i class="fa-solid fa-kitchen-set"></i></span>廚房可使用</div>
                            <div><span><i class="fa-solid fa-car"></i></i></span>免費停車位</div>
                            <div><span><i class="fa-solid fa-droplet"></i></span>提供熱水</div>
                            <div><span><i class="fa-solid fa-paw"></i></span>寵物友善</div>
                            <div><span><i class="fa-solid fa-bicycle"></i></span>提供休閒腳踏車</div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="showalloffers-btn">顯示全部設備與服務</div>
                    </a>
                </div>

            </div>

            <div class="roomdetail-calendar roomdetail-blocks">
                <i class="fas fa-angle-left prev"></i>
                <i class="fas fa-angle-right next"></i>
                <div class="roomdetail-calendar-container">
                    <div class="roomdetail-calendar-calendar" id="calendar0">
                        <div class="month">

                            <div>
                                <h6></h6>
                            </div>

                            <!-- <i class="fas fa-angle-right next"></i>  -->
                        </div>

                        <div class="weekdays">
                            <div>日</div>
                            <div>一</div>
                            <div>二</div>
                            <div>三</div>
                            <div>四</div>
                            <div>五</div>
                            <div>六</div>
                        </div>
                        <div class="days">

                        </div>
                    </div>
                    <div class="roomdetail-calendar-calendar" id="calendar1">
                        <div class="month">
                            <div>
                                <div>
                                    <h6></h6>
                                </div>
                            </div>
                        </div>

                        <div class="weekdays">
                            <div>日</div>
                            <div>一</div>
                            <div>二</div>
                            <div>三</div>
                            <div>四</div>
                            <div>五</div>
                            <div>六</div>
                        </div>
                        <div class="days">

                        </div>
                    </div>
                    <div class="roomdetail-calendar-calendar" id="calendar2">
                        <div class="month">
                            <div>
                                <div>
                                    <h6></h6>
                                </div>
                            </div>
                        </div>

                        <div class="weekdays">
                            <div>日</div>
                            <div>一</div>
                            <div>二</div>
                            <div>三</div>
                            <div>四</div>
                            <div>五</div>
                            <div>六</div>
                        </div>
                        <div class="days">

                        </div>
                    </div>
                    <div class="roomdetail-calendar-calendar" id="calendar3">
                        <div class="month">
                            <div>
                                <div>
                                    <h6></h6>
                                </div>
                            </div>
                        </div>

                        <div class="weekdays">
                            <div>日</div>
                            <div>一</div>
                            <div>二</div>
                            <div>三</div>
                            <div>四</div>
                            <div>五</div>
                            <div>六</div>
                        </div>
                        <div class="days">

                        </div>
                    </div>
                </div>
                <div class="clearSelected">清除日期</div>
                <div>               
                </div>
            </div>
        </div>
        


       
         <script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
         <script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
          <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		
	       //{工具}：專門為小時補上0的工具
        function timeFixer(time) {
            if (time.toString().length < 2) {
                return "0" + time;
            } else {
                return time;
            }
        }
	       
        function getFinalPrice() {
            if ($(".order-making-column-input").eq(0).val() != "" &&
                $(".order-making-column-input").eq(1).val() != ""
            )
                var nights = parseInt(Math.abs(chosenEdTime - chosenStTime) / 1000 / 60 / 60 / 24);
            $(".nights").text(nights);
            let price = nights * parseInt($(".price-perNight").text());
            $(".price").text(price);
            $(".finalPrice").text(price);
            $(".order-making-column-calculate").removeClass("hidden");
            $(".order-making-column-final").removeClass("hidden");
        }
	    
      //初始功能
        let chosenStTime = null;
        let chosenEdTime = null;
        //closestBookedTime之後要用Ajax取 取得最近的被租借時間
        /* let closestBookedTime = new Date("2023-01-20"); */
        let closestBookedTime = null;
        
        function getAvailableEdTime() {
                $(".curr-date").each(function (index, element) {

                    let tempDate = new Date($(this).attr("class").substr(10, 10));

                    if (closestBookedTime == null) {
                        if (chosenStTime < tempDate) {
                            $(this).addClass("availableEdTime");
                        }
                    } else {
                        if (chosenStTime < tempDate && tempDate <= closestBookedTime) {
                            $(this).addClass("availableEdTime");
                        }
                    }

                })
            }
        
        function chooseEndTime() {
            $(".availableEdTime").click(function () {
                if (chosenEdTime == null && $(this).hasClass("availableEdTime")) {
                    $(this).addClass("chosenEdTime");

                    chosenEdTime = new Date($(this).attr("class").substr(10, 10));
					
                    $(".order-making-column-input").eq(1).val($(this).attr("class").substr(10, 10));

                    getFinalPrice();
                    
                    $(".availableEdTime").each(function (index, element) {
                        $(this).removeClass("availableEdTime");
                    })

                    $(".curr-date").each(function (index, element) {

                        let tempDate = new Date($(this).attr("class").substr(10, 10));


                        if (chosenStTime < tempDate && tempDate < chosenEdTime) {
                            $(this).addClass("chosenTimes");
                        }


                    })
                }
            })
        }
        
        function clearSelectedTimes() {
            $(".clearSelected").click(function () {
            	chosenStTime = null;
                $(".order-making-column-input").eq(0).val("");
                chosenEdTime = null;
                closestBookedTime = null;
                $(".chosenStTime").removeClass("chosenStTime");
                $(".order-making-column-input").eq(1).val("");
                $(".order-making-column-count-input").val(1);
                $(".chosenTimes").each(function (index, element) {
                    $(this).removeClass("chosenTimes");
                })
                $(".chosenEdTime").removeClass("chosenEdTime");

                $(".order-making-column-calculate").addClass("hidden");
                $(".order-making-column-final").addClass("hidden");

                $(".availableEdTime").each(function (index, element) {
                    $(this).removeClass("availableEdTime");
                })
            })
        }
        
        function addBooked(date1, date2) {
            $("." + date1).addClass("bookedSt");
            $("." + date2).addClass("bookedEd");
            let bookedSt = new Date(date1);
            let bookedEd = new Date(date2);
            $(".curr-date").each(function (index, element) {
                let tempDate = new Date($(this).attr("class").substr(10, 10));
                if (bookedSt < tempDate && tempDate < bookedEd) {
                    $(this).addClass("booked");
                }
            })
        }
        
        function getClosestBookedTime(){
        	 var xhr = new XMLHttpRequest();
        	 var chosenStTimeStr = chosenStTime.getFullYear() + "-" + timeFixer(chosenStTime.getMonth() + 1) + "-" + timeFixer(chosenStTime.getDate())+ " 23:59:59";
             var queryString =  "chosenStTime=" + chosenStTimeStr ;
             var url = "<c:url value='/room/getClosestBookedTime/' />";
             
             xhr.open("POST", url, true);
             xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
             xhr.send(queryString);
             
             xhr.onreadystatechange = function () {
                 if (xhr.readyState == 4 & xhr.status === 200) {
                	 if(xhr.responseText != ""){
                		 closestBookedTime = new Date(xhr.responseText);
                	 }
                	 
                     getAvailableEdTime();

                     chooseEndTime();
                 }
             }
        }
        
        function init() {
            //測試 booked 
      	<c:forEach items="${allOrders}" var="order">
        		var date1 = "${order.checkInDatetime.toString()}";
        		var date2 = "${order.checkOutDatetime.toString()}";
       		 	addBooked(date1.substr(0,10),date2.substr(0,10));        		
       	</c:forEach> 
        
            // 選擇 起始還有結束時間
            $(".curr-date").click(function () {
                if (chosenStTime == null) {
                    if (!$(this).hasClass("booked") && !$(this).hasClass("bookedSt")) {
                        $(this).addClass("chosenStTime");

                        chosenStTime = new Date($(this).attr("class").substr(10, 10));
                        
                        $(".order-making-column-input").eq(0).val($(this).attr("class").substr(10, 10));
                        
                        getClosestBookedTime();                       

                    }
                }
            })          
           

            if (chosenStTime != null) {
                $("." + chosenStTime.getFullYear() + "-" + timeFixer(chosenStTime.getMonth() + 1) + "-" + timeFixer(chosenStTime.getDate())).addClass("chosenStTime");             	
                
                getAvailableEdTime();

                chooseEndTime();
            }
            


            if (chosenStTime != null && chosenEdTime == null) {
                chooseEndTime();
            }

            if (chosenEdTime != null) {
                $("." + chosenEdTime.getFullYear() + "-" + timeFixer(chosenEdTime.getMonth() + 1) + "-" + timeFixer(chosenEdTime.getDate())).addClass("chosenEdTime");
                $(".curr-date").each(function (index, element) {

                    let tempDate = new Date($(this).attr("class").substr(10, 10));

                    if (chosenStTime < tempDate && tempDate < chosenEdTime) {
                        $(this).addClass("chosenTimes");
                    }
                })

            }

            clearSelectedTimes();
        }
        
        const currentDate = new Date();
        
        const renderCalendar = (No) => {
            const date = new Date(currentDate.getFullYear(), currentDate.getMonth() + No - 1, currentDate.getDate());
            date.setDate(1);

            //取得裝天數的欄位
            const monthDays = document.querySelector("#calendar"+No+" .days");

            //取得當月有幾天
            const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();

            //取得當月第一天是星期幾
            const firstDayIndex = date.getDay();

            //找到對應的 月份標題 改成當月月份
            document.querySelector("#calendar" + No + " .month h6").innerHTML = date.getFullYear() + "年" + (date.getMonth() + 1) + "月";

            //準備製造一個月份的日期
            let days = "";

            //讓當月從正確的星期幾 開始
            for (let x = firstDayIndex;x > 0;x--) {
                days += "<div class='prev-date'></div>";
            }

            //取得一個月有幾天 直到結尾有幾天
            for (let i = 1;i <= lastDay;i++) {
                let newDays =
                    "<div class='curr-date " +
                    date.getFullYear() +
                    "-" +
                    timeFixer((date.getMonth() + 1)) +
                    "-" +
                    timeFixer(i) +
                    "'>" +
                    i +
                    "</div>";

                days += newDays;
                monthDays.innerHTML = days;
            }

            $(monthDays).removeClass();
            $(monthDays).addClass("days");
            $(monthDays).addClass(date.getFullYear() + "-" + timeFixer((date.getMonth() + 1)));
        }
        
        renderCalendar(0);
        renderCalendar(1);
        renderCalendar(2);
        renderCalendar(3);
        init();

        const distance = parseFloat($(".roomdetail-calendar-container").css("left"));

        //前往上個月和下個月的按鈕
        document.querySelector(".prev").addEventListener("click", () => {

            let position = parseFloat($(".roomdetail-calendar-container").css("left"));
            let fullwidth = parseFloat($(".roomdetail-calendar-container").css("width"))


            let positionCal = parseFloat($("#calendar0").css("left"));

            currentDate.setMonth(currentDate.getMonth() - 1);
            renderCalendar(0);
            renderCalendar(1);
            renderCalendar(2);
            renderCalendar(3);

            $(".roomdetail-calendar-container").css("left", (200 * position / fullwidth) + 50 + "%");

            $("#calendar0").css("left", (100 * positionCal / fullwidth) - 25+"%");
            $("#calendar1").css("left", (100 * positionCal / fullwidth) - 25+"%");
            $("#calendar2").css("left", (100 * positionCal / fullwidth) - 25+"%");
            $("#calendar3").css("left", (100 * positionCal / fullwidth) - 25+"%");

            init();
        })



        document.querySelector(".next").addEventListener("click", () => {
            let position = parseFloat($(".roomdetail-calendar-container").css("left"));
            let fullwidth = parseFloat($(".roomdetail-calendar-container").css("width"))


            let positionCal = parseFloat($("#calendar0").css("left"));

            currentDate.setMonth(currentDate.getMonth() + 1);
            renderCalendar(0);
            renderCalendar(1);
            renderCalendar(2);
            renderCalendar(3);

            $(".roomdetail-calendar-container").css("left", (200 * position / fullwidth) - 50 + "%");
            $("#calendar0").css("left", (100 * positionCal / fullwidth) + 25 + "%");
            $("#calendar1").css("left", (100 * positionCal / fullwidth) + 25 + "%");
            $("#calendar2").css("left", (100 * positionCal / fullwidth) + 25 + "%");
            $("#calendar3").css("left", (100 * positionCal / fullwidth) + 25 + "%");

            init();

        })
            
      
        
	    
 
		

        
	</script>

</body>
</html>