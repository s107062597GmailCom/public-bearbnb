
		function changepic1() {
			$("#uploaddiv1").css("display", "none");
			var reads = new FileReader();
			let f = document.getElementById('file1').files[0];
			reads.readAsDataURL(f);
			reads.onload = function(e) {
				document.getElementById('img1').src = this.result;
				$("#img1").css("display", "block");
			};
		}
		function changepic2() {
			$("#uploaddiv2").css("display", "none");
			var reads = new FileReader();
			let f = document.getElementById('file2').files[0];
			reads.readAsDataURL(f);
			reads.onload = function(e) {
				document.getElementById('img2').src = this.result;
				$("#img2").css("display", "block");
			};
		}
		function changepic3() {
			$("#uploaddiv3").css("display", "none");
			var reads = new FileReader();
			let f = document.getElementById('file3').files[0];
			reads.readAsDataURL(f);
			reads.onload = function(e) {
				document.getElementById('img3').src = this.result;
				$("#img3").css("display", "block");
			};
		}
		function changepic4() {
			$("#uploaddiv4").css("display", "none");
			var reads = new FileReader();
			let f = document.getElementById('file4').files[0];
			reads.readAsDataURL(f);
			reads.onload = function(e) {
				document.getElementById('img4').src = this.result;
				$("#img4").css("display", "block");
			};
		}
		function changepic5() {
			$("#uploaddiv5").css("display", "none");
			var reads = new FileReader();
			let f = document.getElementById('file5').files[0];
			reads.readAsDataURL(f);
			reads.onload = function(e) {
				document.getElementById('img5').src = this.result;
				$("#img5").css("display", "block");
			};
		}
		let num = 0;
		let timer = null;
		function show() {
		  $(".selection li")
		    .eq(num)
		    .css("background-color", "white")
		    .siblings()
		    .css("background-color", "transparent");
		  let movelength = 0 - $(window).width()* num;
		  $(".slide").css("left", movelength);
		}
		function next() {
		  if(num<4){
			  num++;
			  show();
		  }
		}
		function prev() {
		 if(num > 0){
			num--;
			if(num == 0){
				$("#page2").hide();
			}
			if(num == 1){
				$("#page3").hide();
			}
			if(num == 2){
				$("#page4").hide();
			}
			if(num == 3){
				$("#page5").hide();
			}
		 	show();		 
		 }
		}
		function check1(){
			if($("#title").val()!= '' 
					&& $("#price").val() != ''
					&& $("#city").val() != '' 
					&& $("#address").val() != '' 
					&& $("input[name='roomType']:checked").val()
					&& $("#latitude").val()!=''
					&& $("#longitude").val()!=''){
				$("#title_error").html("");
				$("#price_error").html("");
				$("#address_error").html("");	
				$("#roomType_error").html("");
				$("#page2").show();
				return true;
			}else{
				if($("#title").val()==''){	
					$("#tltle_error").html("?????????????????????!");
				}else{
					$("#tltle_error").html("");
				}
				if($("#price").val()==''){
					$("#price_error").html("???????????????!");
				}else{
					$("#price_error").html("");
				}
				if($("#city").val() == ''||$("#address").val() == ''){	
					$("#address_error").html("?????????????????????!");
				}else{
					if($("#latitude").val()=='' || $("#longitude").val()==''){
						$("#address_error").html("??????????????????????????????????????????");
					}else{
						$("#address_error").html("");
						
					}
				}
				if(!($("input[name='roomType']:checked").val())){	
					$("#roomType_error").html("?????????????????????!");
				}else{
					$("#roomType_error").html("");
				}
				
				return false;	
			}
		}
		let upload_photo_num = 0;
		function uploaded(){
			upload_photo_num++;
			if(upload_photo_num<5){
				$(photo_comment).html("????????????"+(5-upload_photo_num)+"?????????");			
			}else{
				$(photo_comment).html("???????????????????????????");
			}
			
		}
		function check2(){
			if(upload_photo_num == 5){
				$("#page3").show();
				return true;
			}else{
				$(photo_comment).addClass("alarm");
				return false;
			};
		}
		function check3(){
			if($("#maxPersonCapacity").val()  
					&& $("#singleSizeBedCount").val() 
					&& $("#doubleSizeBedCount").val() 
					&& $("#floorMattressCount").val() 
					&& $("#bedroomCount").val() 
					&& $("#bathroomCount").val() 
					&& $("#area").val()){
				$("#maxPerson_error").html("");
				$("#singleSizeBedCount_error").html("");
				$("#doubleSizeBedCount_error").html("");
				$("#floorMattressCount_error").html("");
				$("#area_error").html("");
				$("#page4").show();
				return true;
			}else{
				if(!($("#maxPersonCapacity").val())){
					$("#maxPerson_error").html("?????????????????????");
				}else{
					$("#maxPerson_error").html("");
				}
				if(!($("#singleSizeBedCount").val())){
					$("#singleSizeBedCount_error").html("?????????????????????");
				}else{
					$("#singleSizeBedCount_error").html("");
				}
				if(!($("#doubleSizeBedCount").val())){
					$("#doubleSizeBedCount_error").html("?????????????????????");
				}else{
					$("#doubleSizeBedCount_error").html("");
				}
				if(!($("#floorMattressCount").val())){
					$("#floorMattressCount_error").html("?????????????????????");
				}else{
					$("#floorMattressCount_error").html("");
				}
				if(!($("#bedroomCount").val())){
					$("#bedroomCount_error").html("??????????????????");
				}else{
					$("#bedroomCount_error").html("");
				}
				if(!($("#bathroomCount").val())){
					$("#bathroomCount_error").html("??????????????????");
				}else{
					$("#bathroomCount_error").html("");
				}
				if(!($("#area").val())){
			
					$("#area_error").html("???????????????");
				}else{
					
					$("#area_error").html("");
				}
				return false;
			}
		}
		
			let latitude = 0;
	let longitude = 0;
	let key=GLOBAL_GOOGLE_API_KEY;
	function searchOnMap(){
		console.log("searchMap");
		var address =$("#city").find("option:selected").text()+$("#address").val();
		console.log(address);
		
		var xhr = new XMLHttpRequest();
		var url = "https://maps.googleapis.com/maps/api/geocode/json?key="+key+"&address="+address;
		xhr.open("GET", url , true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				result = JSON.parse(xhr.responseText);
				if(result.results[0].geometry.location.lat && result.results[0].geometry.location.lng){
					latitude = result.results[0].geometry.location.lat;
					longitude = result.results[0].geometry.location.lng;										
				}
			}else{
				$("#map").html("???????????????????????????,???????????????");
			}
			changeMap();
		}
	};
	function changeMap(){
		if(latitude!=0 && longitude != 0){
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
				map : map
			});
			
		}else{
			$("#map").html("???????????????????????????,???????????????");
		}

	}
	function addLocation(){
		$("#latitude").val(latitude);
		$("#longitude").val(longitude);
		$("#myModal").modal('hide');
		check1();
	}
		

	function autoInser1(){
		$("#title").val("???????????????");
		$("#price").val(81000);
		$("#city").val(2);
		$("#address").val("????????????????????????53???");
		$("#roomType1").attr("checked",true);
		check1();
	}
	function autoInser2(){
		$("#maxPersonCapacity").val(12);
		$("#singleSizeBedCount").val(4);
		$("#doubleSizeBedCount").val(3);
		$("#floorMattressCount").val(2);
		$("#bedroomCount").val(8);
		$("#bathroomCount").val(3);
		$("#area").val(54);
		
	}
	function autoInser3(){
		$("#introduction").val("????????????????????????????????????????????????");
	}
		
		
		
$(() => {
			
				$("#page2").hide();
		 		$("#page3").hide();
		 		$("#page4").hide();
		 		$("#page5").hide();
			
			$("input").change((e)=>{
				
					if(num==0){
						check1();

						return;
					}
					if(num==1){
						check2();
						return;
					}
					if(num==2){
						check3();
						return;
					}
					if(num==3){
						check4();
						return;
					}
			})
		$(window).resize(show);
		  $("#next1").click(function(){
			if(check1()){
				next();
			}
		});
		  $(":file").change(uploaded);
		  $("#next2").click(function(){
			if(check2()){
				next();
			}
		});
		  $("#next3").click(function(){
			if(check3()){
				next();
			}
		});
		  $("#next4").click(function(){
			next();
			$("#page5").show();
		  });
		  $("#prev1").click(prev);
		  $("#prev2").click(prev);
		  $("#prev3").click(prev);
		  $("#prev4").click(prev);
		  $("#search").click(searchOnMap);	
		  $("#addressChecked").click(addLocation);
		  $("#autoinsert1").click(autoInser1);
		  $("#autoinsert2").click(autoInser2);
		  $("#autoinsert3").click(autoInser3);
		  
		});
