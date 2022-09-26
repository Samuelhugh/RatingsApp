<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- My CSS -->
<link rel="stylesheet" href="/../views/css/main.css"/>
<title>Registration and Login</title>
</head>
<body class="body-bg">

<%-- <div class="container-fluid fill-height bg-transparent"> --%>
	<div class="card container bg-transparent my-5">
		<div class="text-center">
			<h1 class="text-dark mt-5">Rental Ratings Applicaiton</h1>
			<h3></h3>
		</div>
        <div class="row justify-content-around my-2 gy-3">
            <div class="col-12 col-md-4">
                <form:form action="/register" method="post" modelAttribute="newUser" class="p-4">
                    <h2 class="text-register">Register</h2>
                    <form:label path="displayName" class="py-2">Display Name:</form:label>
                    <form:errors path="displayName" class="text-danger"/>
                    <form:input path="displayName" type="text" class="form-control"/>
                    <form:label path="firstName" class="py-2">First Name:</form:label>
                    <form:errors path="firstName" class="text-danger"/>
                    <form:input path="firstName" type="text" class="form-control"/>
                    <form:label path="lastName" class="py-2">Last Name:</form:label>
                    <form:errors path="lastName" class="text-danger"/>
                    <form:input path="lastName" type="text" class="form-control"/>
                    <form:label path="email" class="py-2">Email:</form:label>
                    <form:errors path="email" class="text-danger"/>
                    <form:input path="email" type="email" class="form-control"/>
                    <form:label path="password" class="py-2">Password:</form:label>
                    <form:errors path="password" class="text-danger"/>
                    <form:password path="password" class="form-control"/>
                    <form:label path="confirmPassword" class="py-2">Confirm Password:</form:label>
                    <form:errors path="confirmPassword" class="text-danger"/>
                    <form:password path="confirmPassword" class="form-control"/>
                    <p class="btn-group-sm pt-3">
                        <input type="submit" value="Register" class="btn btn-outline-dark shimmer-btn shimmer-btn:hover">
                    </p>
                </form:form>
            </div>
            <div class="col-12 col-md-4">
                <form:form action="/login" method="post" modelAttribute="newLogin" class="p-4">
                    <h2 class="text-dark">Login</h2>
                    <form:label path="email" class="py-2">Email:</form:label>
                    <form:errors path="email" class="text-danger"/>
                    <form:input path="email" type="email" class="form-control"/>
                    <form:label path="password" class="py-2">Password:</form:label>
                    <form:errors path="password" class="text-danger"/>
                    <form:password path="password" class="form-control"/>
                    <p class="btn-group-sm pt-3">
                        <input type="submit" value="Login" class="btn btn-outline-dark shimmer-btn shimmer-btn:hover">
                    </p>
                </form:form>
            </div>
        </div>
    </div>
<%-- </div> --%>
</body>
</html>