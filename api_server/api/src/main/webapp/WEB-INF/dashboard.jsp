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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<!-- My CSS -->
    <link rel="stylesheet" href="/../views/css/main.css">
	<title>Dashboard</title>
</head>
<body class="body-bg">
	<div class="mt-3 text-center ">
		<div class="mx-4 d-flex justify-content-between align-items-center">
			<h1>Rental Ratings </h1>
			<p class="mx-3">Welcome, ${loggedInUser.displayName}</p>
		</div>
		<div class="mt-2 mx-4 mb-3 text-center nav">
			<nav class="navbar navbar-expand-lg navbar-light bg-transparent">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="m-1 nav-item"><a class="nav-link" href="/dashboard">DASHBOARD </a></li>
						<li class="m-1 nav-item"><a class="nav-link" href="/property/new">ADD RENTAL</a></li>
						<li class="m-1 nav-item"><a class="nav-link" href="/">SIGN OUT</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	
 <%-- stacked small thumbnail table with card format --%>
<%-- <div class="card container d-flex col-12 mx-auto justify-content-between bg-transparent mt-4 mb-2 p-4">
		<div class="d-flex justify-content-between">
			<div class="my-2">
				<h2> All Property Listings</h2>
			</div>
		</div>
	<div class="p-4 table table-hover">
		<table class=" table table-hover">
			<thead>
				<tr>
					<th>Property</th>
					<th>Location</th>
					<th>Rental Type</th>
				 	<th>Rating</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${property}" var="properties">
				<tr>
					<td><a href="/property/${ properties.id }"> <img src="${ properties.imageUrl }" class="img-sml" alt="${ properties.rentalType }"/> </a></td>
					<td class="align-middle">${ properties.addressLine1}, ${ properties.city }, ${ properties.state }</td>
					<td class="align-middle">${ properties.rentalType }</td>
					<td> </td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div> --%>

 <%-- full wrapped card view format --%>
 <div class= "card container d-flex col-12 mx-auto justify-content-between bg-transparent mt-4 mb-4 p-4">
		<div class="my-2">
				<h2> Property Listings</h2>
			<div class= "display-card bg-transparent mx-auto p-5">
			<c:forEach items="${property}" var="properties">
					<div class="card sml-card bg-transparent col-5 mx-auto mb-4 p-4">
						<div class="row ">
							<div class="col-12">
								<div class="card-block btn-group-sm">
									<h4 class="card-title"> <strong>${properties.city}, ${properties.state}</strong></h4>
									<br>
									<p class="card-text"> <img src="${properties.imageUrl}"  class="img-sml"/></p>
									<p class="card-text"> <strong>Description:</strong> ${properties.description}</p>
									<p class="card-text"> <strong>Posted by: </strong>${properties.createdByUser.displayName}</p>
									<br> 
									<div class="sticky-btn btn-group-sm mt-4">
									<a href="/property/${properties.id}" class="btn btn-outline-primary shimmer-btn shimmer-btn:hover mx-2 ">More Details</a>
									</div>
								</div>
							</div>
						</div>
					</div>
			</c:forEach>
			</div>
		</div>
	</div>
 </body>
</html>