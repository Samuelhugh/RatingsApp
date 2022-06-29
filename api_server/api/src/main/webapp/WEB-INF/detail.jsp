<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
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
						<li class="m-1 nav-item"><a class="nav-link"
							href="/dashboard">DASHBOARD</a></li>
						<li class="m-1 nav-item"><a class="nav-link"
							href="/property/new">ADD RENTAL</a></li>
						<li class="m-1 nav-item"><a class="nav-link" href="/">SIGN
								OUT</a></li>
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
				<div class="col-3">
					<h5>Rental Address:</h5>
				</div>
				<div class="col-6">${ property.addressLine1 },${ property.city },
					${ property.state
										}</div>
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3">
					<h5>Posted By:</h5>
				</div>
				<div class="col-6">${property.createdByUser.displayName}</div>
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3">
					<h5>Property Description:</h5>
				</div>
				<div class="col-6">${ property.description }</div>
			</div>
			<!-- 								<div class="row g-3 mx-2 my-2">
									<div class="col-3">
										<h5>Average Rating:</h5>
									</div>
									<div class="col-6"> - placeholder - </div>			update when avg ratings logic complete
								</div> -->
			<div class="row g-3 mx-2 my-2">
				<div class="col-3">
					<h5>Property Type:</h5>
				</div>
				<div class="col-6">${ property.rentalType }</div>
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3">
					<h5>Rental Per Night:</h5>
				</div>
				<div class="col-6">$ ${ property.priceDescription }</div>
			</div>
			<div class="row g-3 mx-2 my-2">
				<div class="col-3">
					<h5>Last Updated on:</h5>
				</div>
				<div class="col-6">
					<fmt:formatDate type="both" dateStyle="medium" timeStyle="short"
						value="${property.updatedAt}" />
				</div>
			</div>
			<div class="p-4">
				<img src="${ property.imageUrl }" class="img-thumbnail img-size"
					alt="${ property.rentalType }" />
			</div>
			<div class="d-flex col-9 mt-3 my-2">
				<a href="/property/${ property.id}/ratings"
					class="btn btn-outline-primary mx-2">Rate & Comment</a> <a
					href="/property/${ property.id }/edit"
					class="btn btn-outline-primary mx-2">Edit Rental</a>
				<form:form action="/property/${property.id}/delete" method="delete">
					<input type="submit" value="Remove Rental"
						class="mx-2 btn btn-outline-danger">
				</form:form>
			</div>
		</div>
	</div>
</html>