<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- change to match your file/naming structure -->
    <link rel="stylesheet" href="/../views/css/main.css">
	<title>Dashboard</title>
</head>
<body>
	<h1> Welcome, ${ loggedInUser.firstName }</h1>
	<div class="float float-left">
		<h3>Ideas</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Address</th>
					<th>City</th>
					<th>Rental Type</th>
					<th>Average Rating</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ allProperties }" var="properties">
				<tr>
					<td><a href="/properties/${ properties.id }">${ properties.addressLine1 }</a></td>
					<td>${ properties.city }</td>
					<td>properties.</td>
					<td>properties.</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>