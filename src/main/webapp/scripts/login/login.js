/**
 * 
 */

var submit = document.getElementById("submit");

var username = document.getElementById("username");
var password = document.getElementById("password");

var iderr = document.getElementById('iderror');
var pwderr = document.getElementById('pwderror');
var err = document.getElementById('error');

	pwdSeen.onclick = function() {
		if (password.type === 'password') {
			this.setAttribute('class', 'fa-solid fa-eye-slash');
			password.setAttribute('type','text');
		}
		else {
			this.setAttribute('class', 'fa-solid fa-eye');
			password.setAttribute('type','password');
		}
	}

   

username.onblur = function() {
	id = username.value;
	console.log(id);
	if (username.value.length == 0) { iderr.innerHTML = '請輸入帳號'; }
	else if (username.value.length != 0) { iderr.innerHTML = ''; }
}
password.onblur = function() {
	pwd = password.value;
	console.log(pwd);
	if (password.value.length == 0) { pwderr.innerHTML = '請輸入密碼'; }
	else if (password.value.length != 0) { pwderr.innerHTML = ''; }
}

submit.onclick = function() {
	id = username.value;
	pwd = password.value;
	var xhr = new XMLHttpRequest();
	console.log(id);
	var form = {
		"username": id,
		"password": pwd,
	}
	var jsonString = JSON.stringify(form);
	xhr.open("POST", "checklogin.controller", true);
	xhr.setRequestHeader("Content-Type",
		"application/json");
	xhr.send(jsonString);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = JSON.parse(xhr.responseText);
			console.log(result);
			if (result.exception) {
				err.innerHTML = "<font color='red' size='-1'>請重新輸入帳號或密碼</font>";
			}else if (result.fail) {
				err.innerHTML = "<font color='red' size='-1'>帳號已停用，請洽詢客服</font>";
			} else if (result.success) {
				id = '';
				pwd = '';
				err.innerHTML = "登入成功";
				window.setTimeout(parent.location.replace('http://localhost:8090/bearbnb.com'), 3000);
			}

		}
	}

}
