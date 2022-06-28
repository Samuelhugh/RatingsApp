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
	<title>Create Rental Listing</title>
</head>
<body>
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

	<div class="card container bg-transparent mt-4 mb-4 p-4">
		<div class="d-flex col-12 mx-auto justify-content-between">
			<div class="my-3">
				<h2>Create Rental Listing</h2>
			</div>
		</div>
		<div class="col-12 mx-auto">
			<form:form action="/property/create" method="post"
				modelAttribute="newProperty" class="p-4 bg-transparent text-dark">
				<div class="form-group">
					<form:label path="addressLine1" class="py-2">Rental Address: </form:label>
					<form:errors path="addressLine1" class="text-danger" />
					<form:input path="addressLine1" class="form-control" />
				</div>
				<div class="form-group">
					<form:label path="city" class="py-2">Rental City: </form:label>
					<form:errors path="city" class="text-danger" />
					<form:input path="city" class="form-control" />
				</div>
				<div class="form-group">
					<form:label path="state" class="py-2">Rental State: </form:label>
					<form:errors path="state" class="text-danger" />
					<form:input path="state" class="form-control" />
				</div>
				<div class="form-group">
					<form:label path="country" class="py-2">Country: </form:label>
					<form:errors path="country" class="text-danger" />
					<form:input path="country" class="form-control h-25" rows="3" />
				</div>
				<div class="form-group">
					<form:label path="description" class="py-2">Rental Description: </form:label>
					<form:errors path="description" class="text-danger" />
					<form:textarea path="description" class="form-control h-25" rows="3" />
				</div>
				<div class="form-group">
					<form:label path="rentalType" class="py-2">Rental Type: </form:label>
					<form:errors path="rentalType" class="text-danger" />
					<form:input path="rentalType" class="form-control h-25" rows="3" />
				</div>
				<div class="form-group">
					<form:label path="priceDescripiton" class="py-2">Rental Price: </form:label>
					<form:errors path="priceDescripiton" class="text-danger" />
					<form:input path="priceDescripiton" class="form-control h-25" rows="3" />
				</div>
				<div class="form-group">
					<form:label path="imageUrl" class="py-2">Image URL: </form:label>
					<form:errors path="imageUrl" class="text-danger" />
					<form:input path="imageUrl" class="form-control h-25" rows="3" />
				</div>
				<div>
					<form:input type="hidden" path="createdByUser" name="created_by_user_id" value="${loggedInUser.id}" />
				</div>
				<a href="/dashboard" class="btn btn-secondary">Cancel</a><!-- update w/controller mapping -->
				<input type="submit" value="Create" class="btn btn-primary mx-1 my-3">
			</form:form>
		</div>
	</div>
</body>
</html>