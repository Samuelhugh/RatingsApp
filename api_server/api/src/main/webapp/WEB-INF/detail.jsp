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
	<title>Rental Details</title>
</head>
<body class="body-bg">

	<div class="mt-3 text-center ">
		<div class="mx-4 d-flex justify-content-between align-items-center">
			<h1>Rental Ratings Applicaiton</h1>
			<p class="mx-3">Welcome, ${loggedInUser.displayName}</p>
			<!-- update w/controller mapping -->
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
						<li class="m-1 nav-item"><a class="nav-link" href="/dashboard">DASHBOARD </a></li> 		<!-- update w/controller mapping -->
						<li class="m-1 nav-item"><a class="nav-link" href="/property/new">ADD RENTAL</a></li> 	<!-- update w/controller mapping -->
						<li class="m-1 nav-item"><a class="nav-link" href="/">SIGN OUT</a></li>					<!-- update w/controller mapping -->
					</ul>
				</div>
			</nav>
		</div>
	</div>
	
	<div class="card container mt-4 mb-4 p-4 bg-transparent">
		<div class="d-flex col-12 mx-auto justify-content-between">
			<h2 class="text-dark">Property Details</h2>
		</div>
		<div class="my-3 row align-items-center">
			<div class="row g-3 mx-2 my-2">
				<div class="col-3"> <h5>Rental Address:</h5> </div>
				<div class="col-6">${ property.addressLine1 }, ${ property.city }, ${ property.state }</div>
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3"> <h5>Posted By:</h5> </div>
				<div class="col-6">${user.users.displayName}</div>	<!-- update when avg ratings logic complete -->
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3"> <h5>Property Description:</h5> </div>
				<div class="col-6">${ property.description }</div>
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3"> <h5>Average Rating:</h5> </div>
				<div class="col-6"> - placeholder - </div>			<!-- update when avg ratings logic complete -->
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3"> <h5>Property Type:</h5> </div>
				<div class="col-6">${ property.rentalType }</div>
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3"> <h5>Rental Per Night: </h5> </div>
				<div class="col-6">$ ${ property.priceDescription }</div>
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3"><h5>Last Rated on:</h5> </div>
				<div class="col-6"> <fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${property.updatedAt}"/></div>
			</div>
		<div class="p-4">
		<img src="${ property.imageUrl }" class="img-thumbnail  alt="img-thumbnail">
		</div>
			<div class="d-flex col-9 mt-3 my-2">
				<a href="/property/${ property.id}/ratings" class="btn btn-primary mx-2">Comment & Rating</a>
				<a href="/property/${ property.id }/edit" class="btn btn-primary mx-2">Edit Rental</a>
					<form:form action="/property/${property.id}/delete" method="delete">
						<input type="submit" value="Delete Rental" class="mx-2 btn btn-danger">
					</form:form>
				<c:if test="${project.projectJoiners.contains(userLoggedIn) || project.leader.id == userLoggedIn.id }">
					<c:choose>
					<c:when test="${loggedInUser.id == project.xxxx.id}">
						<a href="/property/${property.id }/review" class="btn btn-primary mx-2">Comment & Rating</a>
					</c:when>
					</c:choose>
				</c:if>
			</div>	
		</div>
	</div>
<%-- 	<hr>
	<h2>Rental Address: ${ property.addressLine1 }</h2>
	<h2>Lender: ${ property.loggedInUser.firstName property.loggedInUser.lastName }</h2>
	<h2>Property Description: ${ property.description }</h2>
	<h2>Average Rating:</h2>
	<h2>Rental Type: ${ property.rentalType }</h2>
	<h2>Rental Per Night: ${ property.priceDescription }</h2>
	<h2>Last Rated: ${ property.}</h2>
	<img src="${ property.imageUrl }"alt=""/>
	<a href="/property/${property.id }/review">Comment & Rating</a>
		<a href="/property/${ property.id }/edit">Edit</a> | --%>
<%-- 	<c:choose>
	<c:when test="${ property.loggedInUser.id == loggedInUser.id }">
		<form class="delete-form" action="/property/${ property.id }/delete" method="post">
			<input type="hidden" name="_method" value="delete" />
			<button>Delete</button>
		</form>
	</c:when>
	</c:choose> --%>
</body>
</html>