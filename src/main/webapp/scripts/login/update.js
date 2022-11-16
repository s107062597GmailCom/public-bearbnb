/**
 * 
 */
 
/****************/
/*     變數區     */
/****************/

var pwdSeen = document.getElementById("pwdSeen");

var username = document.getElementById("username");
var password = document.getElementById("password");
var first_name = document.getElementById("first_name");
var last_name = document.getElementById("last_name");
var phone_number = document.getElementById("phone_number");
var email = document.getElementById("email");
var birthday = document.getElementById("birthday");

var divPwd = document.getElementById("result01");
var divFName = document.getElementById("result02");
var divLName = document.getElementById("result03");
var divPhone = document.getElementById("result04");
var divMail = document.getElementById("result05");
var divRS = document.getElementById("result");


/*************
 *    函數區   *
 *************/

/* 密碼顯示/隱藏 */
//	pwdSeen.onclick = function() {
//		if (password.type === 'password') {
//			this.setAttribute('class', 'fa-solid fa-eye-slash');
//			password.setAttribute('type','text');
//		}
//		else {
//			this.setAttribute('class', 'fa-solid fa-eye');
//			password.setAttribute('type','password');
//		}
//	}
 
password.onblur = function() {
	pwd = password.value;
	if (!pwd) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼不得為空</font>";
		return;
	}
	if (pwd.length < 4) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼不得小於4個字元</font>";
		return;
	}
	if (!(/[A-Z]/.test(pwd))) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>";
		return;
	} else if (!(/[a-z]/.test(pwd))) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>";
		return;
	} else if (!(/[0-9]/.test(pwd))) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>";
		return;
	} else if (!(/[!@#$%^&*]/.test(pwd))) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>";
		return;
	} else {
		divPwd.innerHTML = "";
	}
}
email.onblur = function() {
	var mail = email.value;
	if (!mail) {
		divMail.innerHTML = "<font color='gray' size='-1'>mail不得為空</font>";
		return;
	} else if (!(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/.test(mail))) {
		divMail.innerHTML = "<font color='gray' size='-1'>mail格式不符請重新填寫</font>";
		return;
	} else {
		divMail.innerHTML = "";
	}
}






/* 按下送出時的動作 */

submit.onclick = function(){
	var vpwd = password.value;
	var vFN = first_name.value;
	var vLN = last_name.value;
	var vPN = phone_number.value;
	var vmail = email.value;
	var vBir = birthday.value;
	var vGender = document.querySelector('input[name="gender"]:checked').value;
	
	var hasError = false;
	
	/* 各項資料驗證 */
	if(!vpwd){
		divPwd.innerHTML = "<font color='gray' size='-2'>密碼不得為空</font>";
		hasError = true;
	}else if(vpwd.length < 4){
		divPwd.innerHTML = "<font color='gray' size='-2'>密碼不得小於8個字元</font>";
		hasError = true;
	}
	if (!(/[A-Z]/.test(vpwd))) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>";
		hasError = true;
	} else if (!(/[a-z]/.test(vpwd))) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>";
		hasError = true;
	} else if (!(/[0-9]/.test(vpwd))) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>";
		hasError = true;
	} else if (!(/[!@#$%^&*]/.test(vpwd))) {
		divPwd.innerHTML = "<font color='gray' size='-1'>密碼須包含大小寫英文、數字、特殊符號(!@#$%^&*)</font>";
		hasError = true;
	}else{divPwd.innerHTML = "";}
	
	if (!vFN) {
		divFName.innerHTML = "<font color='gray' size='-2'>請輸入名字</font>";
		hasError = true;
	} else {divFName.innerHTML = "";}
	if (!vLN) {
		divLName.innerHTML = "<font color='gray' size='-2'>請輸入姓氏</font>";
		hasError = true;
	} else {divLName.innerHTML = "";}
	if (!vPN) {
		divPhone.innerHTML = "<font color='gray' size='-2'>請輸入電話</font>";
		hasError = true;
	} else {divPhone.innerHTML = "";}
	if (!vmail) {
		divMail.innerHTML = "<font color='gray' size='-2'>請輸入email</font>";
		hasError = true;
	} else {divMail.innerHTML = "";}
	if (hasError) {return false;}
	
	/* 資料送到後端 */
	var xhr = new XMLHttpRequest();
	var form = {
		"password": vpwd,
		"first_name": vFN,
		"last_name": vLN,
		"gender": vGender,
		"phone_number": vPN,
		"email": vmail,
		"birthday": vBir
	}
	var jsonString = JSON.stringify(form);
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			result = JSON.parse(xhr.responseText);
			if(result.error){
				divRS.innerHTML = "<font color='BLACK'>" + result.error + "</font>";
			}
			if(result.success){
				window.setTimeout(parent.location.replace('http://localhost:8090/bearbnb.com/setProfile'), 3000);
			}
		}
	}
	xhr.open("POST","/profileUpdate",true);
	xhr.setRequestHeader("Content-Type","application/json");
	xhr.send(jsonString);
	

}

		function changepic2() {
			$("#uploaddiv").css("display", "none");
			var reads = new FileReader();
			let f = document.getElementById('file').files[0];
			reads.readAsDataURL(f);
			reads.onload = function(e) {
				document.getElementById('img').src = this.result;
				$("#img").css("display", "block");
			};
		}
