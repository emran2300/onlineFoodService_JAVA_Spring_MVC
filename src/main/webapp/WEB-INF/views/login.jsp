<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--
  Created by IntelliJ IDEA.
  User: emran
  Date: 4/19/2022
  Time: 2:20 AM
  To change this template use File | Settings | File Templates.
--%>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/login.css"/>">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <title>Sign in</title>
</head>

<body>
<div class="main">
    <p class="sign" align="center">Sign in</p>
    <form:form modelAttribute="rule" class="form1" action="loginValided" method="post">
        <form:input path="name" class="un " type="text" align="center" placeholder="Username"/>
        <form:input path="password" class="pass" type="password" align="center" placeholder="Password"/>
        <input type="submit">
    </form:form>
    <p>${Err}</p>

</div>

</body>

</html>