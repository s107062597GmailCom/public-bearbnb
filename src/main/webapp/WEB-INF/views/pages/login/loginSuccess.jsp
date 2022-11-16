<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${uriRoot}/styles/bootstrap.min.css">
<meta charset="UTF-8">
<title>LoginSuccess</title>
</head>
<body>
Congratulations!!<br/>
${vericode.code}<br/>
${vericode.email}<br/>
Welcome ${myaccount.username}<br/>
Password = ${myaccount.password}<br/>
UUID = ${myaccount.uuid}<br/>
Create_at = ${myaccount.createdAt}<br/>
<br/>
First_name = ${myaccount.information.firstName}<br/>
Last_name = ${myaccount.information.lastName}<br/>
Gender = ${myaccount.information.gender}<br/>
Phone_Number = ${myaccount.information.phoneNumber}<br/>
email = ${myaccount.information.email}<br/>
Birthday = ${myaccount.information.birthday}<br/>
<br/>
Account Identity = ${myaccount.identity.title} <br/>
Account Status = ${myaccount.status.title} <br/>

<hr>
<a href="http://localhost:8090/bearbnb.com/logout">登出</a>

</body>
</html>