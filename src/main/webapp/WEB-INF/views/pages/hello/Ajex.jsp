<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="helloId">
    <button id="btn">送出</button>
    <div id="result"></div>

    <script>
        var btn = document.getElementById("btn");
        btn.onclick = function(){
            var xhr = new XMLHttpRequest();
            var helloId = document.getElementById("helloId").value;
            var queryString = "id=" + helloId;
            var url = "<c:url value='/hello/showHello/' />";
            
            xhr.open("POST", url, true);
            xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhr.send(queryString);
            
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 & xhr.status === 200) {
                    document.getElementById("result").innerHTML =
                        "<h1>" + xhr.responseText + "</h1>";
                }
            }
        }
    </script>
 
     

</body>
</html>