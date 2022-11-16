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

  <h2>${room.address }</h2>
  <h2>${room.uuid }</h2>
  <h2>${room.information.title }</h2>
  <h2>${room.information.longitude }</h2>
  <h2>${room.information.latitude }</h2>
  <h2>${room.city.title }</h2>
  <h2>${room.owner.information.firstName }</h2>
  <h2>${room.comments.iterator().next().author.information.lastName }</h2>
  <h2>${room.comments.iterator().next().contentText }</h2>
  
 
  
 
  
</body>
</html>