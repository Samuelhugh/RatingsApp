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

	<div class="card container bg-transparent my-5">
		<div class="text-center">
			<h1 class="text-dark font-weight-bold mt-5">Rental Ratings Application</h1>
			<!-- <h3></h3> -->
		</div>
        <div class="row justify-content-around my-2 gy-3">
            <div class="col-12 col-md-4">
                <form:form action="/register" method="post" modelAttribute="newUser" class="p-4">
                    <h2 class="text-register">Register</h2>
                    <form:errors path="displayName" class="text-danger font-italic"/>
                    <br/>
                    <!--  
                    <form:errors path="displayName" class="text-danger"/>
                    <br/> 
                    -->
                    <form:label path="displayName" class="py-2 font-weight-light">Display Name:</form:label>
                    <form:input path="displayName" type="text" class="form-control"/>
                    <!--
                     <form:label path="displayName" class="py-2">Display Name:</form:label>
                     <form:input path="displayName" type="text" class="form-control"/>
                     <form:errors path="firstName" class="text-danger"/> 
                    -->
                   	<form:errors path="firstName" class="text-danger font-italic"/>
                    <br/>
                    <form:label path="firstName" class="py-2 font-weight-light">First Name:</form:label>
                    <form:input path="firstName" type="text" class="form-control"/>
                    <form:errors path="lastName" class="text-danger font-italic"/>
                     <br/>
                    <form:label path="lastName" class="py-2 font-weight-light">Last Name:</form:label>
                    <form:input path="lastName" type="text" class="form-control"/>
                    <form:errors path="email" class="text-danger font-italic"/>
                     <br/>
                    <form:label path="email" class="py-2 font-weight-light">Email:</form:label>
                    <form:input path="email" type="email" placeholder="email@example.com" class="form-control"/>
                    <form:errors path="password" class="text-danger font-italic"/>
                     <br/>
                    <form:label path="password" class="py-2 font-weight-light">Password:</form:label>
                    <form:password path="password" class="form-control" placeholder="Password"/>
                    <form:errors path="confirmPassword" class="text-danger font-italic"/>
                     <br/>
                    <form:label path="confirmPassword" class="py-2 font-weight-light">Confirm Password:</form:label>
                    <form:password path="confirmPassword" class="form-control" placeholder="Confirm Password" />
                    <p class="pt-3">
                        <input type="submit" value="Register" class="btn btn-outline-dark">
                    </p>
                </form:form>
            </div>
            <div class="col-12 col-md-4">
                <form:form action="/login" method="post" modelAttribute="newLogin" class="p-4">
                    <h2 class="text-dark">Login</h2>
                    <form:label path="email" class="py-2 font-weight-light">Email:</form:label>
                     <br/>
                    <form:errors path="email" class="text-danger font-italic"/>
                    <form:input path="email" type="email" placeholder="email@example.com" class="form-control"/>
                    <form:label path="password" class="py-2 font-weight-light">Password:</form:label>
                     <br/>
                    <form:errors path="password" class="text-danger font-italic"/>
                    <form:password path="password" class="form-control" placeholder="Password" />
                    <p class="pt-3">
                        <input type="submit" value="Login" class="btn btn-outline-dark">
                    </p>
                </form:form>
            </div>
        </div>
    </div>

</body>
</html>