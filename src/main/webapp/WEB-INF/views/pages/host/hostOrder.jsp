<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<c:set var="uriRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>房東控制版面</title>
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
<link href="${uriRoot}/styles/bootstrap.min.css" rel="stylesheet">
<style>
        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            text-decoration: none;
            color: black;
        }

		.host-order-container{
			margin-top: 75px;
		}
        .container .host-order-element {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .host-order-desciption {
            color: #9D9D9D;
        }

        .host-order-instruction-box {
            display: flex;
        }

        .order-card {
            margin: 20px;
            box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
            transition: 0.3s;

        }

        .order-card:hover {
            box-shadow: rgb(0 0 0 / 12%) 0px 20px 50px;
            cursor: pointer;


        }

        .order-list-container {
            width: 100%;
            border-top: 1px solid #D0D0D0;
            border-bottom: 1px solid #D0D0D0;

            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .card {
            border-radius: 15px;
            margin-right: 20px;
            cursor: pointer;
            box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
        }

        .card-img-top {
            border-top-right-radius: 15px;
            border-top-left-radius: 15px
        }

        .card-body {
            background-color: black;
            color: white;
            border-bottom-right-radius: 15px;
            border-bottom-left-radius: 15px
        }

        .host-order-head {
            display: flex;
        }

        .host-order-type {
            border-radius: 20px;
            border: 1px solid #E0E0E0;
            font-size: 14px;
            width: 100px;
            height: 40px;
            margin-left: 5px;
            margin-right: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: .2s;
        }

        .host-order-type-active {
            border: 2px solid black;
            background-color: #F0F0F0;
        }

        .host-order-scope {
            width: 100%;
            height: 200px;
            border-radius: 10px;
            border: 1px solid #E0E0E0;
            margin: 20px 5px 5px 10px;
            background-color: #F0F0F0;
            display: flex;
            overflow: hidden;
            padding: 0px 0px 0px 0px;
            align-items: center;
        }

        .leftbtn {
            position: relative;
            left: 0;
            height: 100%;
            z-index: 2;
            font-size: 50px;
            display: flex;
            align-items: center;
            cursor: pointer;
            opacity: 0;
        }

        .leftbtn:hover {
            opacity: 0.5;
        }

        .rightbtn {
            position: relative;
            left: 93%;
            height: 100%;
            z-index: 2;
            font-size: 50px;
            display: flex;
            align-items: center;
            opacity: 0;
            cursor: pointer;
        }

        .rightbtn:hover {
            opacity: 0.5;
        }

        .host-order-Allcards {
            display: flex;
            position: relative;
            left: 0;
            transition: .5s;
        }

        .host-order-card {

            width: 280px;
            height: 160px;
             transition: .5s;
        }

        .host-order-card-body {
            background-color: white;
            color: black;
            border-radius: 20px;
        }

        .host-order-card-head {
            margin: 10px 20px 0px 20px;
        }

        .host-order-card-title {
            font-size: 20px;
            font-weight: 800;
        }

        .host-order-card-subTitle {
            color: #9D9D9D;
        }

        .host-order-card-body {
            display: flex;
            justify-content: space-around;
            margin: 0px 20px 0px 20px;
            align-items: center;

        }

        .host-order-card-buttons {
            display: flex;
            justify-content: center;
        }

        .host-order-card-button {
            margin: 0px 1px 1px 1px;
            width: 40%;
            background-color: #3C3C3C;
            color: white;
            text-align: center;
            font-size: 8px;
			 cursor: pointer;

        }

          .host-order-card-button:hover{
            background-color: #7B7B7B;
        }

        .host-order-card-description {
            font-size: 15px;
        }

        .host-order-card-photo {
            width: 80px;
            height: 80px;
            border-radius: 100px;
            border: 1px solid #F0F0F0;
            object-fit: cover;

        }
    </style>


</head>
<body>
 <jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp"/>

    <div class="container host-order-container">
        <h4 class="host-order-element">歡迎！</h4>
        <div class="host-order-desciption">你即將成為一名出色的房東，來了解一下要如何著手開始。 </div>

        <div class="host-order-element  host-order-instruction-box">
            <div class="card" style="width: 12rem;">
                <img class="card-img-top" src="${uriRoot}/images/host_instruction1.jpeg" alt="Card image cap">
                <div class="card-body">
                    <h7 class="card-title">為迎接首批房客作好準備</h7>
                </div>
            </div>

            <div class="card" style="width: 12rem;">
                <img class="card-img-top" src="${uriRoot}/images/host_instruction2.jpeg" alt="Card image cap">
                <div class="card-body">
                    <h7 class="card-title">自訂你的日曆與價格</h7>
                </div>
            </div>

            <div class="card" style="width: 12rem;">
                <img class="card-img-top" src="${uriRoot}/images/host_instruction3.jpeg" alt="Card image cap">
                <div class="card-body">
                    <h7 class="card-title">確認房客可使用的預定方式</h7>
                </div>
            </div>
        </div>

        <div class="host-order-order-container host-order-element">
            <h4 class="host-order-element">你的預定</h4>
            <div class="host-order-head">
                <div class="host-order-type host-order-type-active"  id="comfirmingOrdersBtn">等待批准(<span class="comfirmingOrdersCount">${comfirmingOrdersCount }</span>)</div>
                <div class="host-order-type" id="arriveSoonOrdersBtn">即將入住(<span class="arriveSoonOrdersCount">${arriveSoonOrdersCount}</span> )</div>
                <div class="host-order-type"  id="currentStayingOrdersBtn">目前接待中(<span class="currentStayingOrdersCount">${currentStayingOrdersCount}</span>)</div>
                <div class="host-order-type"  id="waitForRateOrdersBtn">等待評價(<span class="waitForRateOrdersCount">${waitForRateOrdersCount}</span>)</div>

            </div>
            <div class="host-order-scope">
                <div class="leftbtn">«</div>
                <div class="rightbtn">»</div>
                <div class="host-order-Allcards">

                 </div>
            </div>
        </div>
        <div style="height: 5rem;"></div>


 <script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
 <script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>

<script>
		
		universalHeaderController.rentalMode();
		
		//小工具 跟今天差幾天
		let Today = new Date();
		let DateDifference = function (Date1,Date2) { // date object 日期格式
  			let milliseconds_Time = Date2.getTime() - Date1.getTime();
  			return Math.ceil(milliseconds_Time / (1000 * 3600 * 24));
		};


		//一 查看訂單列表
		//1.訂單列表 右滑動
        function rightSwift() {
            let scopewidth = parseInt($(".host-order-scope").css("width"));
            let cardswidth = parseInt($(".host-order-Allcards").css("width"));
            let originalPosition = parseInt($(".host-order-Allcards").css("left"));
            if ((cardswidth + originalPosition) >= scopewidth) {
                $(".host-order-Allcards").css("left", (originalPosition - 300) + "px");
            }
        }

		//2.訂單列表 左滑動
        function leftSwift() {
            if (parseInt($(".host-order-Allcards").css("left")) < 0) {
                let originalPosition = parseInt($(".host-order-Allcards").css("left"));
                $(".host-order-Allcards").css("left", (originalPosition + 300) + "px");
            }
        }

        $(".rightbtn").click(rightSwift);
        $(".leftbtn").click(leftSwift);

        //二 修改訂單狀態的方法 房東針對{待確認}訂單 可以接受或是婉拒，執行後重新獲得各種訂單的數量
         function comfirmOrder(orderUuid,newStatusId){
       	 var xhr = new XMLHttpRequest();
            var queryString =  "orderUuid=" + orderUuid + "&newStatusId="+newStatusId;
            var url = "<c:url value='/hosting/comfirmOrder/' />";

            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 & xhr.status === 200) {
  					var orderCounts = JSON.parse(xhr.responseText);
  					$(".comfirmingOrdersCount").text(orderCounts[0]);
  					$(".arriveSoonOrdersCount").text(orderCounts[1]);
  					$(".currentStayingOrdersCount").text(orderCounts[2]);
  					$(".waitForRateOrdersCount").text(orderCounts[3]);
                }
            }

            xhr.open("POST", url, true);
            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhr.send(queryString);


       }


       //三 選擇要查看的訂單類別 調用訂單表

       //1. 選擇要查看的訂單類別時 套用的外觀樣式
         function chooseOrderType() {
             $(this).addClass("host-order-type-active");
             $(this).siblings().removeClass("host-order-type-active");
         }
         $(".host-order-type").click(chooseOrderType);



        //2. Ajax調用訂單的方法
        //根據 尋找的訂單類型不同 產生不同的訂單表格

        //2-1取得 {等待批准}的訂單List HTML樣式
        let comfirmingOrdersList =
        	function(order){
            return " <div class='card host-order-card'>"
            + " <div class='host-order-card-head'>"
            +"<div style='display: none;' class='host-order-card-uuid'>"+order.uuid+"</div>"
            + "<div class='host-order-card-title'>將於"+DateDifference(Today,new Date(order.checkInDatetime))+"天後抵達</div>"
            + "<div class='host-order-card-subTitle'>" + order.room_Title + "</div>"
            + " </div>"
            + "<div class='host-order-card-body'>"
            + "<img src='${uriRoot}/photo/account/"+order.visitor_photo_Uuid + "' class='host-order-card-photo'>"
            + " <div class='host-order-card-description'>"
            + "<div>"+order.visitor_FirstName + "想要來訪</div>"
            + "<div>"+ order.checkInDatetime.substr(5,2) + "月" + order.checkInDatetime.substr(8,2) + "日 | " + order.checkOutDatetime.substr(5,2) + "月" + order.checkOutDatetime.substr(8,2)+ "日 </div>"
            + "<div class='host-order-card-buttons'>"
            + "<div class='host-order-card-button host-order-card-agreement'>同意</div>"
            + "<div class='host-order-card-button host-order-card-reject'>婉拒</div>"
            + " </div>"
            + " </div>"
            + " </div>"
            + " </div>"
            ;
        }

        //2-2取得 {等待批准}的訂單List HTML樣式
        let arriveSoonOrdersList =
        	function(order){
            return " <div class='card host-order-card'>"
            + " <div class='host-order-card-head'>"
            + "<div class='host-order-card-title'>將於"+DateDifference(Today,new Date(order.checkInDatetime))+"天後抵達</div>"
            + "<div class='host-order-card-subTitle'>" + order.room_Title + "</div>"
            + " </div>"
            + "<div class='host-order-card-body'>"
            + "<img src='${uriRoot}/photo/account/"+order.visitor_photo_Uuid + "' class='host-order-card-photo'>"
            + " <div class='host-order-card-description'>"
            + "<div>"+ order.visitor_FirstName + "即將來訪</div>"
            + "<div>"+ order.checkInDatetime.substr(5,2) + "月" + order.checkInDatetime.substr(8,2) + "日 | " + order.checkOutDatetime.substr(5,2) + "月" + order.checkOutDatetime.substr(8,2)+ "日 </div>"
            + "<div class='host-order-card-buttons'>"
            + " </div>"
            + " </div>"
            + " </div>"
            + " </div>"
            ;
        }

        //2-3取得{目前接待中}的訂單List HTML樣式
 		let currentStayingOrdersList =
        	function(order){
            return " <div class='card host-order-card'>"
            + " <div class='host-order-card-head'>"
            + "<div class='host-order-card-title'>將再停留"+ DateDifference(Today,new Date(order.checkOutDatetime)) +"天</div>"
            + "<div class='host-order-card-subTitle'>" + order.room_Title + "</div>"
            + " </div>"
            + "<div class='host-order-card-body'>"
            + "<img src='${uriRoot}/photo/account/"+order.visitor_photo_Uuid + "' class='host-order-card-photo'>"
            + " <div class='host-order-card-description'>"
            + "<div>"+ order.visitor_FirstName + "來訪中</div>"
            + "<div>"+ order.checkInDatetime.substr(5,2) + "月" + order.checkInDatetime.substr(8,2) + "日 | " + order.checkOutDatetime.substr(5,2) + "月" + order.checkOutDatetime.substr(8,2)+ "日 </div>"
            + "<div class='host-order-card-buttons'>"
            + " </div>"
            + " </div>"
            + " </div>"
            + " </div>"
            ;
        }

        //2-4取得{等待評價}的訂單List HTML樣式
        let waitForRateOrdersList =
        	function(order){
            return  " <div class='card host-order-card'>"
            + " <div class='host-order-card-head'>"
            + "<div class='host-order-card-title'>已於"+ DateDifference(new Date(order.checkOutDatetime),Today) +"天前離開</div>"
            + "<div class='host-order-card-subTitle'>" + order.room_Title + "</div>"
            + " </div>"
            + "<div class='host-order-card-body'>"
            + "<img src='${uriRoot}/photo/account/"+order.visitor_photo_Uuid + "' class='host-order-card-photo'>"
            + " <div class='host-order-card-description'>"
            + "<div>"+ order.visitor_FirstName + "已經離開</div>"
            + "<div>"+ order.checkInDatetime.substr(5,2) + "月" + order.checkInDatetime.substr(8,2) + "日 | " + order.checkOutDatetime.substr(5,2) + "月" + order.checkOutDatetime.substr(8,2)+ "日 </div>"
            + "<div class='host-order-card-buttons'>"
            + "<div class='host-order-card-button'>邀請評價</div>"
            + " </div>"
            + " </div>"
            + " </div>"
            + " </div>"
            ;
        }


        //Ajax從後方取得特定類型的orderList方法
        function getSelectedOrderList(orderStatus, orderFunction){
        	$(".host-order-Allcards").css("left", "0");
        	$(".host-order-Allcards").empty();

        	var queryString =  "orderStatus="+orderStatus ;
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/hosting/getAllOrderByOrderStatus' />", true);
            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send(queryString);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200 ) {
 					let content = "";
 					var orders = JSON.parse(xhr.responseText);
					 for (var i = 0; i < orders.length; i++) {
						 content += orderFunction(orders[i]);
					 }
 		            $(".host-order-Allcards").append(content);
				}
				$(".host-order-card-agreement").click(function(){
					var orderUuid = $(this).closest(".host-order-card").find(".host-order-card-uuid").text();
		          	comfirmOrder(orderUuid,2);
		          	$(this).text("已確認");
					$(this).closest(".host-order-card").find(".host-order-card-reject").off("click");
					$(this).off("click");
	 	         });

				$(".host-order-card-reject").click(function(){
					var orderUuid = $(this).closest(".host-order-card").find(".host-order-card-uuid").text();
		          	comfirmOrder(orderUuid,6);
		          	$(this).text("已婉拒");
					$(this).closest(".host-order-card").find(".host-order-card-agreement").off("click");
					$(this).off("click");
	 	         });
			}
        }


        //頁面載入後取得 {等待批准}的訂單List
        $( document ).ready(function() {
        	getSelectedOrderList(1,comfirmingOrdersList);
		})

        //點按鈕時取得 {等待批准}的訂單List
        $("#comfirmingOrdersBtn").click(function() {
        	getSelectedOrderList(1,comfirmingOrdersList);
		});

		//點按鈕時取得  {即將入住}的訂單List
        $("#arriveSoonOrdersBtn").click(function() {
        	getSelectedOrderList(2,arriveSoonOrdersList);
        });

      //點按鈕時取得  {目前接待中}的訂單List
		$("#currentStayingOrdersBtn").click(function() {
			getSelectedOrderList(3,currentStayingOrdersList);
		});

	  //點按鈕時取得  {等待評價}的訂單List
		$("#waitForRateOrdersBtn").click(function() {
			getSelectedOrderList(4,waitForRateOrdersList);
		});
    </script>

</body>
</html>