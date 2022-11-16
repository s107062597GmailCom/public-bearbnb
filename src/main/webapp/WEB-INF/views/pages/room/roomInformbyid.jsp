<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<c:set var="uriRoot" value="${pageContext.request.contextPath}"/>
<c:set var="imgIndex" value="0" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${room.information.title}</title>
<link rel="icon" href="${uriRoot}/images/icons/favicon.ico">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
 
 <link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
 <link rel="stylesheet" href="${uriRoot}/styles/room/roomInformbyidInformation.css">
  
   
    <style>

        
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp"/>

	<div class="inform-page-container">
        <div class="inform-page-container-photo">
            <div class="photo-section-header">
<!--                 <h3>203【新上特價、交通便利、大浴缸、山湖景觀房】近公車站、青青草原、小瑞士花園、步道</h3>
 -->                <div class="photo-icons-container">
                    <div class="photo-icons-container-left">
                        <div><i class="fa-solid fa-star"></i>
                       
                        <span class="room-rating-score"> 5.0</span>．<u>${room.comments.size()}則評價</u></div>
                        <div><i class="fa-solid fa-medal"></i>超讚房東</div>
                        <div>${room.city.title}</div>
                    </div>
                    <div class="photo-icons-container-right">
                        <div><a href="#"><i class="fa-solid fa-share-from-square"></i><u>分享</u> </a></div>
                        <div><a href="#"><i class="fa-regular fa-heart"></i><u>儲存</u></a></div>
                    </div>
                </div>
            </div>
            <div class="photo-section-body">
                <div class="roomphoto-dispaly-main">

                    <img src="${uriRoot}/photo/room/${room.frontCoverPhoto.uuid}">
                </div>
                
                <div class="roomphoto-dispaly-sub">                
                <c:forEach var="roomImg" items="${room.photos}">
					<c:if test="${roomImg.uuid!=room.frontCoverPhoto.uuid}">
						<c:set var="imgIndex" value="${imgIndex+1}" />
                    <div><img src="${uriRoot}/photo/room/${roomImg.uuid}" class="room_img"></div>         
               		</c:if>
				</c:forEach>
                </div>
                

					

				
				
            </div>

        </div>
    </div>


	 <div class="order-making-column">
        <div class="order-making-column-price order-making-column-subs">
            <div class="order-making-column-price-per"><span>$ <span class="price-perNight">${room.price}</span> TWD</span>
                <span class="order-making-column-price-night">晚</span> </div>
            <div class="order-making-column-price-rating"><i class="fa-solid fa-star"></i><span class="room-rating-score"> 5.0</span> · <u>${room.comments.size()}則評價</u></div>
        </div>
        <form action="${pageContext.request.contextPath}/room/createNewOrder/room?r=${room.uuid}" method="post" onsubmit="return check();">
            <div class="order-making-column-form order-making-column-subs">

                <div class="order-making-column-date">
                    <div class="order-making-column-stDate">
                        <div>入住</div>
                        <input type="text" placeholder="選取日期" name="check_in_datetime" class="order-making-column-input check-in-input" readonly="readonly" aria-invalid="false">
                    </div>
                    <div class="order-making-column-edDate">
                        <div>退房</div>
                        <input type="text" placeholder="選取日期" name="check_out_datetime" class="order-making-column-input check-out-input" readonly="readonly" aria-invalid="false">
                    </div>
                </div>
                <div class="order-making-column-count">
                    <!-- <div>房客</div>
                    <div class="order-making-column-count-form">
                        <input type="number" name="adult_count" class="order-making-column-count-input" value="1">
                        <div>位</div>
                    </div> -->
					
					<div style="display: flex; justify-content: space-between; align-items: center; margin: 10px;">
						<div>
                            <div>成人</div>
                            <div>13歲以上</div>
                        </div>
                        <div class="order-making-column-count-count">
                            <div class="order-making-column-count-calcbtn adultMinus">-</div>            
 							<input type="text" value="1" name="adult_count" class="order-making-column-countInput" id="adultCount" readonly="readonly" >
 							<div  class="order-making-column-count-calcbtn adultAdd">+</div>
                        </div>

					</div>
					<div style="display: flex; justify-content: space-between; align-items: center; margin: 10px;">
						<div class="inform-page-container-count-title">
                            <div>兒童</div>
                            <div>2 - 12歲</div>
                        </div>
                        <div class="order-making-column-count-count">
                           <div class="order-making-column-count-calcbtn childMinus">-</div>
 							<input type="text" value="0" name="child_count" class="order-making-column-countInput" id="childCount" readonly="readonly">
                            <div  class="order-making-column-count-calcbtn childAdd">+</div>
                        </div>           
					</div>	
                </div>
            </div>
             <input type="text" name="finalPrice"  class="order-making-column-input hidden order-making-column-finalPrice">
            <input type="submit" value="預定" class="order-making-column-submit order-making-column-subs">
            <div class="order-making-column-subs order-making-column-calculate hidden">
                <span>${room.price} TWD x <span class="nights"></span>晚
                </span>
                <span>$<span class="price"></span> TWD</span>
            </div>
            <div class="order-making-column-subs order-making-column-final hidden">
                <span>稅前總額</span>
                <span>$<span class="finalPrice"></span> TWD</span>
            </div>
        </form>
    </div>
    
   
    
    <script>
        $("header.universalheader").css("position", "relative");
    </script>
    <div class="inform-page-container">
        <div class="inform-page-container-roomdetail">
            <div class="roomdetail-header">
                <div class="roomdetail-header-title">
                    <h4>${room.owner.information.firstName}出租的${room.information.title}</h4>
                    <p>${room.information.maxPeopleCapacity}位．${room.information.bedroomCount}間臥室．${room.information.singleSizeBedCount + room.information.doubleSizeBedCount+ room.information.floorMattressCount }張床．${room.information.bathroomCount}間衛浴
                    </p>
                </div>
                <div class="host-photo">
                   <img src="${uriRoot}/photo/account/${room.owner.photo.uuid}" class="hostPicture">
                </div>
            </div>
            <div class="roomdetail-baseinform roomdetail-blocks">
                <div class="roomdetail-baseinform-block">
                    <div class="roomdetail-baseinform-block-icon"><i class="fa-solid fa-award"></i></div>
                    <div>
                        <div>${room.owner.information.firstName}是超讚房東</div>
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
                    ${room.information.introduction}
                </div>
            </div>

            <div class="roomdetail-offer roomdetail-blocks">
                <div class="roomdetail-offer-blocks">
                    <h4>有提供的設備與服務</h4>
                    <div class="roomdetail-offer-alloffers">
                    <c:forEach var="serve" items="${room.serves}">
                        <div class="roomdetail-offer-icon"><span><i class="${serve.iconTag }"></i></span>${serve.title }</div>
                   </c:forEach>
                   
                   <c:forEach var="device" items="${room.devices}">
                        <div class="roomdetail-offer-icon"><span><i class="${device.iconTag }"></i></span>${device.title }</div>
                   </c:forEach>
                   
                   <c:forEach var="restrict" items="${room.restricts}">
                        <div class="roomdetail-offer-icon"><span><i class="${restrict.iconTag }"></i></span>${restrict.title }</div>
                   </c:forEach>
                   
                    </div>

                </div>

            </div>

            <div class="roomdetail-calendar roomdetail-blocks">
                <div class="clearSelected">清除日期</div>
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
                
                <div>               
                </div>
            </div>
        </div>
        
        <div class="inform-page-container">
        <div class="inform-page-container-map">
                  
        	<div class="inform-page-map">
        		<h4>住宿地點</h4>
        		<div class="inform-page-map-map" id="map"></div>   
        	</div>
        
        </div>
        </div>
        
        
       <div class="inform-page-container-comment">

            <div class="inform-page-comment">
                <div class="inform-page-comment-title">
                    <h4><i class="fa-solid fa-star"></i><span class="room-rating-score"> 5.0</span> · <span>${room.comments.size()}則評價</span></h4>

                    <div class="comment-btn">顯示全部評價</div>
                </div>
			
                <div class="inform-page-comment-body">
                
                <c:forEach var="comment" items="${room.comments}">
                    <div class="comment-card">
                        <div class="comment-card-title" style="display: flex;">
                            <img src="${uriRoot}/photo/account/${comment.author.photo.uuid}" class="comment-photo">
                            <div>
                                <div>${comment.author.information.firstName }</div>
                                <div>${comment.order.checkOutDatetime.getYear()+1900}年${comment.order.checkInDatetime.getMonth()+1}月</div>
                            </div>
                        </div>
                        <div class="comment-card-body">
                        	<div class="comment-card-body-context"> ${comment.contentText } </div>
                            
                        </div>
<!--                         <div><a href="#"><u>顯示更多內容</u> ></a></div> -->                   
				 </div>
                 </c:forEach>
                </div>
                
            </div>

        </div>


       
         <script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
         <script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
         
         <script defer
		src="https://maps.googleapis.com/maps/api/js?key=${googleKey}">
		</script> 
		
		 <script>
    
    function checkDate(that){    
    	console.log($(that));
      	 if ($(that).val() == "") {
           	$(that).attr("aria-invalid","false");
           }else{
           	$(that).attr("aria-invalid","true");
           }
      	}
    
    function check(){
    	checkDate(".check-in-input");
    	checkDate(".check-out-input");
       
   	 if($(".check-in-input").attr("aria-invalid")== "true" && $(".check-out-input").attr("aria-invalid")== "true" 
   			){
   		 return true;
   	 }else{
   		 window.alert("資料不符合格式 請再次確認");
   		 return false;
   	 }           	 
    }
    
    
    </script>
		
		
		<script>
		
		let roomTotalRate = 0;
		
 		<c:if test="${room.comments.size() !=0 }">
 		<c:forEach var="roomcomment" items="${room.comments}">
			console.log("hi");
		roomTotalRate += ${roomcomment.point};      
	</c:forEach>
	
	let roomAvgRate =roomTotalRate / ${room.comments.size()};
	roomAvgRate = roomAvgRate.toFixed(2);
	
	$(".room-rating-score").each(function (index, element) {
    	$(this).text(roomAvgRate);
	})
		 </c:if> 
		
		</script>
		
         <script>
         let latitude = ${room.getInformation().getLatitude()};
         let longitude = ${room.getInformation().getLongitude()};
         
         function changeMap(){
        		
        		var locate = {
        				lat : latitude,
        				lng : longitude
        			};

        			var map = new google.maps.Map(document.getElementById('map'), {
        				zoom : 18,
        				center : locate
        			});
        			var marker = new google.maps.Marker({
        				position : locate,
        				map : map,
        				clickable : true
        			});
        	}
		
         $(()=>{
        	 changeMap();
         })
         
         
         </script>
         
         <script>
        let detailPositionTop = $(".inform-page-container-roomdetail").offset().top / 1.5;
        let detailHeight = $(".inform-page-container-roomdetail").height()/1;

        $(window).scroll(function () {
            let scrollTop = $(this).scrollTop();
            if (scrollTop > detailPositionTop && scrollTop < detailPositionTop + detailHeight) {
                $(".order-making-column").css("opacity", "1");
                $(".order-making-column").css("visibility", "visible");

            } else {
                $(".order-making-column").css("opacity", "0");
                $(".order-making-column").css("visibility", "hidden");

            }
        });

    </script>
          

	<script>
		
	       //{工具}：專門為小時補上0的工具
        function timeFixer(time) {
            if (time.toString().length < 2) {
                return "0" + time;
            } else {
                return time;
            }
        }
	    
	    //算出本筆訂單總共需要多少錢
        function getFinalPrice() {
            if ($(".order-making-column-input").eq(0).val() != "" &&
                $(".order-making-column-input").eq(1).val() != ""
            )
            var nights = parseInt(Math.abs(chosenEdTime - chosenStTime) / 1000 / 60 / 60 / 24);
            $(".nights").text(nights);
            let price = nights * parseInt($(".price-perNight").text());
            $(".price").text(price);
            $(".finalPrice").text(price);
			$(".order-making-column-finalPrice").val(price);
            $(".order-making-column-calculate").removeClass("hidden");
            $(".order-making-column-final").removeClass("hidden");
        }
	    
      //初始功能
        let chosenStTime = null;
        let chosenEdTime = null;
        let today = new Date();
        //closestBookedTime之後要用Ajax取 取得最近的被租借時間
        /* let closestBookedTime = new Date("2023-01-20"); */
        let closestBookedTime = null;
        
        function getInvalidTime(){
        	$(".curr-date").each(function (index, element) {
            	let tempDate = new Date($(this).attr("class").substr(10, 10));

        		if (tempDate <= today) {
                    $(this).addClass("invalidTime");
        	}
        })}
        
        
        function getAvailableEdTime() {
                $(".curr-date").each(function (index, element) {

                    let tempDate = new Date($(this).attr("class").substr(10, 10));

                    if (closestBookedTime == null ) {
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
                $(".order-making-column-finalPrice").val("");

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
        	 var chosenStTimeStr = chosenStTime.getFullYear() + "-" + timeFixer(chosenStTime.getMonth() + 1) + "-" + timeFixer(chosenStTime.getDate())+ " 09:00:00";
             var queryString =  "chosenStTime=" + chosenStTimeStr + "&roomId=" + ${room.id} ;
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
        	
   	 getInvalidTime();

       	
            // 選擇 起始還有結束時間
            $(".curr-date").click(function () {
                if (chosenStTime == null) {
                    if (!$(this).hasClass("booked") && !$(this).hasClass("bookedSt") && !$(this).hasClass("invalidTime")) {
                        $(this).addClass("chosenStTime");

                        chosenStTime = new Date($(this).attr("class").substr(10, 10));
                        
                        
                        $(".order-making-column-input").eq(0).val($(this).attr("class").substr(10, 10));
                        
                        getClosestBookedTime();                       

                    }
                }
            })          
           

            if (chosenStTime != null) {
                $("." + chosenStTime.getFullYear() + "-" + timeFixer(chosenStTime.getMonth() + 1) + "-" + timeFixer(chosenStTime.getDate())).addClass("chosenStTime");             	
                
                if(chosenEdTime == null){
                	 getAvailableEdTime();
                     chooseEndTime();
                }
               
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
            const date = new Date(currentDate.getFullYear(), currentDate.getMonth() + No - 1, 1);
            
            console.log(date);

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
        
        function showAlertMsg(){
        	let alertMsg =  "${alertMsg}" + "";
        	if( alertMsg != ""){
        		alert("訂單新增失敗!\n可能與其他訂單衝突，請重新選擇");
        	}
        }
        
        renderCalendar(0);
        renderCalendar(1);
        renderCalendar(2);
        renderCalendar(3);
        init();
        showAlertMsg();

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

	<script>
	//選擇人數
       const maxCount = parseInt(${room.information.maxPeopleCapacity});
		$(".adultMinus").click(function(){							
		let adultCount = parseInt( $("#adultCount").val());
		if( adultCount > 1){
									$("#adultCount").val(adultCount-1);
								}	
							})  
                        
							$(".adultAdd").click(function(){		
								let adultCount = parseInt( $("#adultCount").val());
								let childCount = parseInt( $("#childCount").val());
								console.log(adultCount+childCount );	
								if((adultCount+childCount) < maxCount){
									 $("#adultCount").val(adultCount+1);	
								}
							})
								
								$(".childMinus").click(function(){							
									let childCount = parseInt( $("#childCount").val());
									if( childCount > 0){
										$("#childCount").val(childCount-1);
									}	
									
								})  
	                        
								$(".childAdd").click(function(){		
									let adultCount = parseInt( $("#adultCount").val());
									let childCount = parseInt( $("#childCount").val());
									if((adultCount+childCount) < maxCount){
										 $("#childCount").val(childCount+1);	
									}
							   													
								}) 
                        
       </script>
       
       

</body>
</html>