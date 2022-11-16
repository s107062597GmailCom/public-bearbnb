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
<title>你的旅程 一 Bearbnb</title>
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
		


        .container .order-list-element {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .order-card {
            margin: 20px;
            width: 20rem;
            height:30rem;
            box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
            transition: .5s;

        }

        .order-card:hover {
            box-shadow:rgb(0 0 0 / 12%) 0px 20px 50px;
            cursor: pointer;
            

        }
		
		.order-list-maincontainer{
			 			margin-top: 70px;
			
		}
		
        .order-list-container {
            width: 100%;
             border-top: 1px solid #D0D0D0;
              border-bottom: 1px solid #D0D0D0;

            display: flex;
            flex-wrap: wrap;
/*             justify-content: space-around;
 */        }

        .order-list-title {
            margin-bottom: 10px;
        }

        .order-list-price {
            display: flex;
            color: gray;
            font-size: 15px;
            font-weight: 800px;
        }

        .order-list-time {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .order-list-time-line {
            border-left: 1px #D0D0D0 solid;

        }

        .order-list-time-date {
            font-size: 15px;
        }

        .order-list-time-time {
            font-size: 25px;
        }

        .order-list-status {
            text-align: center;
            margin: auto;
        }

        .order-list-btns {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .order-list-btns * {
            width: 100%;
            margin: 5px 0px 0px 5px;

        }

        .order-list-btn {
            background-color: #4F4F4F !important;
            color: white !important;
        }

        .order-list-btn:hover {
            background-color: #6C6C6C;
            color: white;
        }
        
            .order-information-container {
        border: 1px solid black;
        width: 70vw;
        height: 80vh;
        position: fixed;
        left: 15vw;
        top: 100vh;
        z-index: 10;
        opacity: 0;
        transition: .5s;
        display: flex;
    }

    .order-information-context {
        width: 60%;
        height: 100%;

    }





    .order-information-head {
        height: 15%;
        display: flex;
        justify-content: center;
        background-color: #3C3C3C;
        align-items: center;


    }

    .order-information-time {
        width: 80%;
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
        margin-bottom: 20px;
        align-items: center;
        color:#D0D0D0	;

    }

    .order-information-time-line {
        height: 2rem;
        border: 1px solid #D0D0D0	;

    }

    .order-information-time-date {
        font-size: 15px;

    }

    .order-information-time-time {
        font-size: 20px;
    }

    .order-information-room {
        display: flex;
        justify-content: center;
        font-size: 30px;
        height: 15%;
        align-items: center;
        background-color: #3C3C3C;
        color: white;

    }

    .order-information-body {
        height: 40%;
        display: flex;
        justify-content: center;
        background-color: #3C3C3C;
        color: white;

    }





    .order-information-host {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .hostPicture {
        border-radius: 100px;
        width: 150px;
        height: 150px;
        border: 2px solid white;
        object-fit: cover;
    }

    .order-information-text {
        display: flex;
        flex-direction: column;
    }

    .order-information-text div {
        margin: 10px 0px 0px 15px;
    }

    .order-information-text-title {
        font-weight: 600;
    }

    .order-information-feet {
        height: 30%;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #D0D0D0;
    }

    .order-information-note {
        width: 80%;
    }

    .order-information-map {
        width: 40%;
        height: 100%;
         border-left: 1px solid black;
         background-color:#3C3C3C;
         overflow:hidden;

    }

    .closeBtn {
    position:relative;
    color:white;
  		top:0;
    	left:80%;
        margin: 10px;
        font-size: 40px;
        cursor: pointer;
        z-index:2;
    }
    
    .card-img-top{
    	height:30% !important;
    	object-fit: cover;
    	vertical-align: bottom;
    }
    
    .order-information-map-map{
     width:100%;
     height:100%;
    }
    
    .complete-order-container {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            margin: 15px 0px 30px 0px;
        }

        .complete-order-card {
            width: 32%;
            display: flex !important;
            border: #D0D0D0 solid .5px;
            margin: 5px;
            height: 180px;
            border-radius: 15px;
            margin: 10px 9px 10px 5px;
            box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
            cursor: pointer;
            font-size: 15px;


        }

        .complete-order-card div {
            margin: 8px 0 8px 0;
        }

        .complete-order-card-img {
            width: 25%;
            object-fit: cover;
            border-radius: 15px 0px 0px 15px;
        }

        .complete-order-card-body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .complete-order-btn {
            width: 80px;
            background-color: #4F4F4F;
            color: white;
            display: flex;
            justify-content: center;
            margin: 0 5px 0px 5px !important;
            cursor: pointer;
        }

        .complete-order-btn:hover {
            background-color: #6C6C6C;
            color: white;
        }
    
    
    </style>
    
    <style>
        .rating-container {
            position: fixed;
            width: 60vw !important;
            left: 20vw;
            top: 100vh;
            background: #3C3C3C;
            padding: 20px 30px;
            border: 1px solid white;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            transition:.5s;
            opacity:0;
        }

        .container .post {
            display: none;
        }

        .container .text {
            font-size: 25px;
            color: #666;
            font-weight: 500;
        }

        .container .edit {
            position: absolute;
            right: 10px;
            top: 5px;
            font-size: 16px;
            color: #666;
            font-weight: 500;
            cursor: pointer;
        }

        .container .edit:hover {
            text-decoration: underline;
        }

        .container .star-widget input {
             display: none; 
         }

        .star-widget label {
            font-size: 40px;
            color: #D0D0D0;
            padding: 10px;
            float: right;
            transition: all 0.2s ease;
            cursor: pointer;
        }

        input:not(:checked)~label:hover,
        input:not(:checked)~label:hover~label {
            color: #fd4;
        }

        input:checked~label {
            color: #fd4;
        }

        input#rate-5:checked~label {
            color: #fe7;
            text-shadow: 0 0 20px #952;
        }

       /*  #rate-1:checked~form header:before {
            content: "非常不滿意 ";
        }

        #rate-2:checked~form header:before {
            content: "不太滿意 ";
        }

        #rate-3:checked~form header:before {
            content: "還不錯 ";
        }

        #rate-4:checked~form header:before {
            content: "很喜歡 ";
        }

        #rate-5:checked~form header:before {
            content: "非常滿意 ";
        } */

        .container form {
/*             display: none;
 */        }

        input:checked~form {
            display: block;
        }

        form header {
            width: 100%;
            font-size: 25px;
            color: #fe7;
            font-weight: 500;
            margin: 5px 0 20px 0;
            text-align: center;
            transition: all 0.2s ease;
        }

        form .textarea {
            height: 150px;
            width: 100%;
            overflow: scroll;
            backgroud-color:white;
         }

        form .textarea textarea {
            height: 20rem !important;
            width: 100%;
            outline: none;
            color: #eee;
            border: 1px solid #333;
            background: #222;
            padding: 10px;
            font-size: 17px;
            resize: none;
            backgroud-color:white;
        }

        .textarea textarea:focus {
            border-color: #444;
        }
        
        

        form .btn {
            height: 45px;
            width: 100%;
            margin: 15px 0;
        }

        form .btn button {
            height: 100%;
            width: 100%;
            border: 1px solid #444;
            outline: none;
            background: #222;
            color: #999;
            font-size: 17px;
            font-weight: 500;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        form .btn button:hover {
            background: #1b1b1b;
        }
        
        .rating-container-title{
        display:flex;
        }
        
        .rating-container-closeBtn{
        	position:relative !important;
        	top:5px;
        	left:40%;
        	color:white;
        	font-size:30px;
        	cursor:pointer;
        }
        
        .ck-content{
        	height:200px;
        	width:300px;
        	line-height: 0;
        }
        
        .ck.ck-toolbar>.ck-toolbar__items{
        	display:none !important;
        }
    </style>

</head>
<body>
 <jsp:include page="/WEB-INF/views/objects/headers/universalheader.jsp"/>
    <div class="container order-list-maincontainer">
        <h1 class="order-list-element">旅程</h1>
        <div class="order-list-container order-list-element">
		
		<c:forEach var="order" items="${allOrders}">
            <div class="card order-card" >
                <img class="card-img-top" src="${uriRoot}/photo/room/${order.room.frontCoverPhoto.uuid}" alt="Card image cap">
                <div class="card-body">
                <div style='display: none;' class='order-list-uuid'>${order.uuid}</div>
                    <div class="order-list-title">
                        <h4>${order.room.information.title}</h4>
                        <div class="order-list-price"><span>共2晚．</span>
                            <span>總額 $ ${order.price} TWD</span></div>
                        <span class="order-list-price">狀態: ${order.status.title}</span>
                    </div>

                    <div class="order-list-time">
                        <div>
                            <div>入住時間</div>
                            <div class="order-list-time-date">${order.checkInDatetime.getYear()+1900}年 </div>
                            <div class="order-list-time-time">${order.checkInDatetime.getMonth()+1}月${order.checkInDatetime.getDate()}日</div>
                        </div>
                        <div class="order-list-time-line"></div>
                        <div>
                            <div>退房時間</div>
                            <div class="order-list-time-date">${order.checkOutDatetime.getYear()+1900}年</div>
                            <div class="order-list-time-time">${order.checkOutDatetime.getMonth()+1}月${order.checkOutDatetime.getDate()}日</div>
                        </div>
                    </div>

                    <div class="order-list-btns">
                        <a  class="btn order-list-btn order-list-btn-check">訂單詳情</a>
                        <a  class="btn order-list-btn order-list-btn-cancel">取消訂單</a>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        
        <c:if test="${completeOrders.size() != 0}">
             <h1 class="order-list-element">你去過的地方</h1>
             
			
			
        	<div class="complete-order-container">
			
			<c:forEach var="order" items="${completeOrders}">
            <div class=" complete-order-card">
                <img class="complete-order-card-img" src="${uriRoot}/photo/room/${order.room.frontCoverPhoto.uuid}" alt="Card image cap">
                <div class="card-body">
                <div style='display: none;' class='order-list-uuid'>${order.uuid}</div>
                    <h5>${order.getRoom().getCity().getTitle()}
                    <c:if test="${order.getStatus().getId() == 4 }">
                        <span>(等待評價)</span>
                    </c:if>
                    
                    </h5>
                    <div>房東:${order.getRoom().getOwner().getInformation().getFirstName()}</div>
                    <div>${order.checkOutDatetime.getYear()+1900}年${order.checkInDatetime.getMonth()+1}月${order.checkInDatetime.getDate()}日-${order.checkOutDatetime.getYear()+1900}年${order.checkOutDatetime.getMonth()+1}月${order.checkOutDatetime.getDate()}日</div>
                    <div style="display: flex;">
                    	<c:if test="${order.getStatus().getId() == 4 }">
                        <div class="complete-order-btn complete-order-btn-rate">留下評價</div>
                        </c:if>
                        <div class="complete-order-btn complete-order-btn-check">查看訂單</div>
                    	</div>
                	</div>
            	</div>
            </c:forEach>
            	
        	</div>
        	
        	
        </c:if>
        
        
        
        
    </div>


    <div class="order-information-container" id="box">
        <div class="order-information-context">
            <div class="order-information-head">


                <div class="order-information-time">
                    <div>
                        <div class="order-information-time-date">入住時間</div>
                        <div class="order-information-time-time"><span id="ajaxStTime"></span></div>
                    </div>
                    <div class="order-information-time-line"></div>
                    <div>
                        <div class="order-information-time-date">退房時間</div>
                        <div class="order-information-time-time"><span id="ajaxEdTime"></span></div>
                    </div>
                </div>
            </div>
            <div class="order-information-room"> <span id="ajaxRoom"></span> </div>
            <div class="order-information-body">
                <div class="order-information-host">
                    <div><img src="#" class="hostPicture" id="ajaxPhoto"></div>
                    <div>房東：<span id="ajaxHost"></span></div>
                </div>

                <div class="order-information-text">
                    <div><span class="order-information-text-title">地址:</span> <span id="ajaxAddress"></span> </div>
                    <div><span class="order-information-text-title">需付總額:</span> $<span id="ajaxPrice"></span> TWD</div>
                    <div><span class="order-information-text-title">同行人員:</span> <span id="ajaxAdult"></span>位大人．<span id="ajaxChild"></span>位小孩</div>
                    <div><span class="order-information-text-title">訂單建立時間:</span> <span id="ajaxTimeStamp"></span></div>
                    <div><span class="order-information-text-title">聯絡電話:</span> <span id="ajaxHostPhone"></span></div>
                </div>

            </div>
            <div class="order-information-feet">
                <div class="order-information-note">
                    <div><span class="order-information-text-title">入住須知:</span></div>
                    <div>
                        深夜關燈促膝輕聊時間為晚上11點鐘,這樣一則不會吵到鄰居幫綠洲敦親睦鄰讓我們可以持續經營下去,二則是百年修得同房渡的室友得以休息。
                    </div>
                </div>
            </div>
        </div>
        <div class="order-information-map">
        <div class="closeBtn">Ｘ</div>
        	<div class="order-information-map-map" id="map"></div>
            
        </div>
    </div>
    
    <div class="container rating-container">
        <div class="post">
            <div class="text">Thanks for rating us!</div>
        </div>
        
        <div class="rating-container-closeBtn">X</div>
        <div style="color:white;font-size:25px;">留下評價</div>
                   
        <div class="star-widget">
            <input type="radio" name="rate" id="rate-5" >
            <label for="rate-5" class="fas fa-star" point=5></label>
            <input type="radio" name="rate" id="rate-4" >
            <label for="rate-4" class="fas fa-star" point=4></label>
            <input type="radio" name="rate" id="rate-3" >
            <label for="rate-3" class="fas fa-star" point=3></label>
            <input type="radio" name="rate" id="rate-2" >
            <label for="rate-2" class="fas fa-star" point=2></label>
            <input type="radio" name="rate" id="rate-1" >
            <label for="rate-1" class="fas fa-star" point=1></label>
        
        </div>
<form action="${pageContext.request.contextPath}/member/insertComment" method="post">  
<!--             <header></header> 
 -->            <input type="text" name="orderUuid" style="display:none;">
   				<input type="text" name="commentRating" style="display:none;" >
                <div class="textarea">
                    <textarea cols="30" placeholder="留下你的住宿體驗" name="commentContent" id="commentContent"></textarea>
                </div>
                <div class="btn">
                    <button type="submit">Post</button>
                </div>
            </form> 
        
    </div>
    
    <script src="${uriRoot}/scripts/jquery-3.6.1.min.js"></script>
<script src="${uriRoot}/scripts/bootstrap.bundle.min.js"></script>
<script src="${uriRoot}/scripts/ckeditor.js"></script>
 
<script>
ClassicEditor
.create(document.querySelector('#commentContent'))
.then(editor => {
    console.log(editor);
})


let latitude = 0;
let longitude = 0;

//Ajax房客取消訂單
function cancelOrder(orderUuid){
	var xhr = new XMLHttpRequest();
   var queryString =  "orderUuid=" + orderUuid + "&newStatusId="+6;
   var url = "<c:url value='/member/cancelOrder/' />";
   
   xhr.open("POST", url, true);
   xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   xhr.send(queryString);
   
   xhr.onreadystatechange = function () {

   }
} 

//Ajax 房客查訂單明細
function checkOrder(orderUuid){
	var xhr = new XMLHttpRequest();
   var queryString =  "orderUuid=" + orderUuid;
   var url = "<c:url value='/member/checkOrder/' />";
   
   xhr.open("POST", url, true);
   xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   xhr.send(queryString);
   
   xhr.onreadystatechange = function () {
	   if (xhr.readyState == 4 && xhr.status == 200 ) {
			var order = JSON.parse(xhr.responseText);
			$("#ajaxStTime").text(order.checkInDatetime.substr(0,4)+"年"+order.checkInDatetime.substr(5,2) + "月" + order.checkInDatetime.substr(8,2) + "日 ");
			$("#ajaxEdTime").text(order.checkOutDatetime.substr(0,4)+"年" +order.checkOutDatetime.substr(5,2)+ "月" + order.checkOutDatetime.substr(8,2)+ "日");
			$("#ajaxRoom").text(order.room_Title);
			$("#ajaxHost").text(order.host_FirstName);
			$("#ajaxAddress").text(order.room_Address);
			$("#ajaxPrice").text(order.price);
			$("#ajaxAdult").text(order.adultCount);
			$("#ajaxChild").text(order.childCount);
			$("#ajaxTimeStamp").text(order.createdAt);
			$("#ajaxHostPhone").text(order.host_phoneNumber);
			$("#ajaxPhoto").attr("src","${uriRoot}/photo/account/" + order.host_photo_Uuid);
			
			
			latitude = order.room_latitude;
			longitude = order.room_longitude;
			changeMap();
	   }
   }
} 

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
		console.log(marker.getShape());
		console.log(latitude);
		console.log(longitude);
}


//評分系統
const sendBtn = document.querySelector("button");
const post = document.querySelector(".post");
const widget = document.querySelector(".star-widget");
sendBtn.onclick = () => {
    widget.style.display = "none";
    post.style.display = "block";
    return false;
}

$(".fa-star").click(function(){
	$("[name = 'commentRating']").val($(this).attr("point"));
})



$(()=>{
	
	$(".order-list-btn-cancel").click(function(){   
		var orderUuid = $(this).closest(".order-card").find(".order-list-uuid").text();
		cancelOrder(orderUuid);
	  	$(this).text("已取消");
		$(this).off("click");
	  });			
	  
	$(".order-list-btn-check").click(function(){
		var orderUuid = $(this).closest(".order-card").find(".order-list-uuid").text();
		checkOrder(orderUuid);

		 $(".order-information-container").css("opacity", "1");
	     $(".order-information-container").css("top", "15vh");
	});  
	
	
	

	$(".complete-order-btn-check").click(function(){
		var orderUuid = $(this).closest(".complete-order-card").find(".order-list-uuid").text();
		checkOrder(orderUuid);

		 $(".order-information-container").css("opacity", "1");
	     $(".order-information-container").css("top", "15vh");
	});
	
	$(".closeBtn").click(function () {
	    $(".order-information-container").css("opacity", "0");
	    $(".order-information-container").css("top", "100vh");
	    
	    
	});
	
	$(".complete-order-btn-rate").click(function(){
		$("[name = 'orderUuid']").val($(this).closest(".complete-order-card").find(".order-list-uuid").text());
		 $(".rating-container").css("opacity", "1");
	     $(".rating-container").css("top", "20vh");	     
	});
	
	$(".rating-container-closeBtn").click(function () {
	    $(".rating-container").css("opacity", "0");
	    $(".rating-container").css("top", "100vh");
	    $("[name = 'orderUuid']").val("");
		 $("[name = 'commentRating']").val("");
		 $("[name = 'commentContent']").val("");
		 $(":checked").prop("checked",false);
	});
	

	
})

</script>
<script defer src="https://maps.googleapis.com/maps/api/js?key=${googleKey}"></script>


</body>
   
   






</body>
</html>