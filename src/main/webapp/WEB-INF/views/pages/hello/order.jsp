<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AccountTest</title>
</head>
<body>

  <h4>訂單編號： ${order.uuid}</h4>
  <h4>入住時間： ${order.checkInDatetime}</h4>
  <h4>入住時間： ${order.checkOutDatetime}</h4>
  <h4>訂單產生時間： ${order.createdAt}</h4>
  <h4>成人人數： ${order.adultCount}</h4>
  <h4>小孩人數： ${order.childCount}</h4>
  <h4>付費金額： ${order.checkOutDatetime}</h4>
  <h4>訂單產生時間： ${order.createdAt}</h4> 
  <h4>訂房者： ${order.account.information.firstName} ${order.account.information.lastName}</h4> 
  <h4>訂房房間： ${order.room.information.title}</h4> 
  <h4>房間類型： ${order.room.information.type.title}</h4> 
  <h4>使用留言： ${order.comment.contentText}</h4> 
  <h4>留言者： ${order.room.comments.iterator().next().author.information.lastName} 先生</h4> 
 
  
 
  
</body>
</html>