<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <h2>Welcome to TakeOFF, <%= request.getAttribute("email") %>!</h2>
    <a href="home.jsp">Back to Home</a>
</body>
</html>
