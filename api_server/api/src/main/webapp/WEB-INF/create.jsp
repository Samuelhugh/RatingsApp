<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<!-- My CSS -->
	<link rel="stylesheet" href="/../views/css/main.css">
	<title>Create Rental Listing</title>
</head>

<body class="body-bg">
	<div class="mt-3 text-center ">
		<div class="mx-4 d-flex justify-content-between align-items-center">
			<h1 class="font-weight-light">Rental Ratings </h1>
			<p class="mx-3 font-weight-light">Welcome, ${loggedInUser.displayName}</p>
			<!-- update w/controller mapping -->
		</div>
		<div class="mt-2 mx-4 mb-3 text-center nav">
			<nav class="navbar navbar-expand-lg navbar-light bg-transparent">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="m-1 nav-item"><a class="nav-link font-weight-normal" href="/dashboard">DASHBOARD
							</a></li>
						<li class="m-1 nav-item"><a class="nav-link font-weight-normal" href="/property/new">ADD
								RENTAL</a></li>
						<li class="m-1 nav-item"><a class="nav-link font-weight-normal" href="/">SIGN OUT</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>

	<div class="card container bg-transparent mt-4 mb-4 p-4">
		<div class="d-flex col-12 mx-auto justify-content-between">
			<div class="my-3">
				<h2 class="font-weight-light">Create Rental Listing</h2>
			</div>
		</div>
		<div class="col-12 mx-auto">
			<form:form action="/property/create" method="post" modelAttribute="newProperty"
				class="p-4 bg-transparent text-dark">
				<div class="form-group">
					<form:label path="addressLine1" class="py-2 font-weight-light">Rental Address: </form:label>
					<form:errors path="addressLine1" class="text-danger" />
					<form:input path="addressLine1" class="form-control fst-italic" />
				</div>
				<div class="form-group">
					<form:label path="city" class="py-2 font-weight-light">Rental City: </form:label>
					<form:errors path="city" class="text-danger" />
					<form:input path="city" class="form-control fst-italic" />
				</div>
				<div class="form-group">
					<form:label path="state" class="py-2 font-weight-light">Rental State:</form:label>
					<form:errors path="state" class="text-danger" />
					<form:select path="state" class="form-control fst-italic h-25" >
						<form:option class="font-weight-normal" value="">Choose State...</form:option>
						<form:option class="font-weight-normal" value="Alabama">Alabama</form:option>
						<form:option class="font-weight-normal" value="Alaska">Alaska</form:option>
						<form:option class="font-weight-normal" value="Arizona">Arizona</form:option>
						<form:option class="font-weight-normal" value="Arkansas">Arkansas</form:option>
						<form:option class="font-weight-normal" value="California">California</form:option>
						<form:option class="font-weight-normal" value="Colorado">Colorado</form:option>
						<form:option class="font-weight-normal" value="Connecticut">Connecticut</form:option>
						<form:option class="font-weight-normal" value="Delaware">Delaware</form:option>
						<form:option class="font-weight-normal" value="Florida">Florida</form:option>
						<form:option class="font-weight-normal" value="Georgia">Georgia</form:option>
						<form:option class="font-weight-normal" value="Hawaii">Hawaii</form:option>
						<form:option class="font-weight-normal" value="Illinois">Illinois</form:option>
						<form:option class="font-weight-normal" value="Indiana">Indiana</form:option>
						<form:option class="font-weight-normal" value="Iowa">Iowa</form:option>
						<form:option class="font-weight-normal" value="Kansas">Kansas</form:option>
						<form:option class="font-weight-normal" value="Kentucky">Kentucky</form:option>
						<form:option class="font-weight-normal" value="Louisiana">Louisiana</form:option>
						<form:option class="font-weight-normal" value="Maine">Maine</form:option>
						<form:option class="font-weight-normal" value="Maryland">Maryland</form:option>
						<form:option class="font-weight-normal" value="Massachusetts">Massachusetts</form:option>
						<form:option class="font-weight-normal" value="Michigan">Michigan</form:option>
						<form:option class="font-weight-normal" value="Minnesota">Minnesota</form:option>
						<form:option class="font-weight-normal" value="Mississippi">Mississippi</form:option>
						<form:option class="font-weight-normal" value="Missouri">Missouri</form:option>
						<form:option class="font-weight-normal" value="Montana">Montana</form:option>
						<form:option class="font-weight-normal" value="Nebraska">Nebraska</form:option>
						<form:option class="font-weight-normal" value="Nevada">Nevada</form:option>
						<form:option class="font-weight-normal" value="New Hampshire">New Hampshire</form:option>
						<form:option class="font-weight-normal" value="New Jersey">New Jersey</form:option>
						<form:option class="font-weight-normal" value="New Mexico">New Mexico</form:option>
						<form:option class="font-weight-normal" value="New York">New York</form:option>
						<form:option class="font-weight-normal" value="North Carolina">North Carolina</form:option>
						<form:option class="font-weight-normal" value="North Dakota">North Dakota</form:option>
						<form:option class="font-weight-normal" value="Ohio">Ohio</form:option>
						<form:option class="font-weight-normal" value="Oklahoma">Oklahoma</form:option>
						<form:option class="font-weight-normal" value="Oregon">Oregon</form:option>
						<form:option class="font-weight-normal" value="Pennsylvania">Pennsylvania</form:option>
						<form:option class="font-weight-normal" value="Rhode Island">Rhode Island</form:option>
						<form:option class="font-weight-normal" value="South Carolina">South Carolina</form:option>
						<form:option class="font-weight-normal" value="South Dakota">South Dakota</form:option>
						<form:option class="font-weight-normal" value="Tennessee">Tennessee</form:option>
						<form:option class="font-weight-normal" value="Texas">Texas</form:option>
						<form:option class="font-weight-normal" value="Utah">Utah</form:option>
						<form:option class="font-weight-normal" value="Vermont">Vermont</form:option>
						<form:option class="font-weight-normal" value="Virginia">Virginia</form:option>
						<form:option class="font-weight-normal" value="Washington">Washington</form:option>
						<form:option class="font-weight-normal" value="West Virginia">West Virginia</form:option>
						<form:option class="font-weight-normal" value="Wisconsin">Wisconsin</form:option>
						<form:option class="font-weight-normal" value="Wyoming">Wyoming</form:option>
					</form:select>
				</div>
				<div class="form-group">
					<form:label path="country" class="py-2 font-weight-light">Country: (ex. United States)</form:label>
					<form:errors path="country" class="text-danger" />
					<form:input path="country" class="form-control fst-italic h-25" rows="3" />
				</div>
				<div class="form-group">
					<form:label path="description" class="py-2 font-weight-light">Rental Description: </form:label>
					<form:errors path="description" class="text-danger" />
					<form:textarea path="description"
						class="form-control fst-italic h-25" rows="3" />
				</div>
				<div class="form-group">
					<form:label path="rentalType" class="py-2 font-weight-light">Rental Type: (ex. Airbnb)</form:label>
					<form:errors path="rentalType" class="text-danger" />
					<form:input path="rentalType" class="form-control fst-italic h-25"
						rows="3" />
				</div>
				<div class="form-group">
					<form:label path="priceDescripiton" class="py-2 font-weight-light">Rental Price: (ex. 75 per night)</form:label>
					<form:errors path="priceDescripiton" class="text-danger" />
					<form:input path="priceDescripiton" class="form-control fst-italic h-25" rows="3" />
				</div>
				<div class="form-group">
					<form:label path="imageUrl" class="py-2 font-weight-light">Image URL: </form:label>
					<form:errors path="imageUrl" class="text-danger" />
					<form:input path="imageUrl" class="form-control fst-italic h-25" rows="3" />
				</div>
				<div>
					<form:input type="hidden" path="createdByUser" name="created_by_user_id"
						value="${loggedInUser.id}" />
				</div>
				<a href="/dashboard" class="btn btn-outline-secondary">Cancel</a>
				<input type="submit" value="Create" class="btn btn-outline-dark mx-1 my-3">
			</form:form>
		</div>
	</div>
</body>

</html>