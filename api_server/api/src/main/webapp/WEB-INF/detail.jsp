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
	<title>Rental Details</title>
</head>
<body>
	<h1>${ idea.content }</h1>
	<hr>
	<h2>Rental Address: ${ properties.addressLine1 }</h2>
	<h2>Lender: ${ properties.leader.firstName properties.leader.lastName }</h2>
	<h2>Property Description: ${ properties.description }</h2>
	<h2>Average Rating: ${ properties. }</h2>
	<h2>Rental Type: ${ properties. }</h2>
	<h2>Rental Per Night: ${ properties. }</h2>
	<h2>Last Rated: ${ properties. }</h2>
	<h2>${ properties.image_url }</h2>
	<a href="/properties/${ properties.id }/review">Comment & Rating</a>
	<c:choose>
	<c:when test="${ properties.leader.id == leader.id }">
		<a href="/properties/${ properties.id }/edit">Edit</a> |
		<form class="delete-form" action="/properties/${ properties.id }/delete" method="post">
			<input type="hidden" name="_method" value="delete" />
			<button>Delete</button>
		</form>
	</c:when>
	</c:choose>
</body>
</html>