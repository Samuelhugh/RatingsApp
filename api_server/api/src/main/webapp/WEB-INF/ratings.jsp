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
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- My CSS -->
<link rel="stylesheet" href="/../views/css/main.css" />
<title>Ratings & Comments</title>
</head>

<body class="body-bg">

	<div class="mt-3 text-center ">
		<div class="mx-4 d-flex justify-content-between align-items-center">
			<h1>Rental Ratings Applicaiton</h1>
			<p class="mx-3">Welcome, ${loggedInUser.firstName}</p>
		</div>
		<div class="mt-2 mx-4 mb-3 text-center nav">
			<nav class="navbar navbar-expand-lg navbar-light bg-transparent">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<li class="m-1 nav-item"><a class="nav-link" href="/dashboard">DASHBOARD</a>
					</li>
					<!-- update w/controller mapping -->
					<li class="m-1 nav-item"><a class="nav-link"
						href="/projects/new">ADD RENTAL</a></li>
					<!-- update w/controller mapping -->
					<li class="m-1 nav-item"><a class="nav-link" href="/">SIGN
							OUT</a></li>
					<!-- update w/controller mapping -->
				</div>
			</nav>
		</div>
	</div>

	<div class="card container mt-4 mb-4 p-4 bg-transparent">
		<div class="d-flex col-12 mx-auto justify-content-between">
			<div class="">
				<h2>Post a comment and rating</h2>
				<br>
				<h5>
					Rental Address:
					<c:out value="${properties.addressLine1}" />
				</h5>
				<h5>
					Posted By:
					<c:out value="${properties.leader.firstName}" />
				</h5>
			</div>
		</div>
		<div class="col-12 mx-auto">
			<form:form action="/properties/${id}/rating/create" method="post" modelAttribute="newRating" properties class="p-4 bg-transparent text-dark">	<!-- update w/controller postMapping modelAttribute -->
				<div class="form-group">
					<form:label path="ticket" class="">How was your stay? Add your comments and rating below: </form:label>
					<form:errors path="ticket" class="text-danger" />
					<form:textarea path="ticket" class="form-control bg-light" />
				</div>
				<div>
					<form:errors path="creator" class="error" />
					<form:input type="hidden" path="creator" value="${ratingsCreator.id}" class="form-control" />	<!-- update w/controller getMapping addAttribute -->
				</div>
				<div>
					<form:errors path="creator" class="error" />
					<form:input type="hidden" path="propertyRanking" value="${properties.id}" class="form-control" />
				</div>
				<p class="d-flex col-9 my-2">
					<input type="submit" value="Add Ratings" class="btn btn-primary">
				</p>
			</form:form>
		</div>
		<div class="my-5">
			<h5>Customer Comments:</h5>
			<table class="table table-hover ">
				<thead>
					<tr>
						<th>Comments</th>
						<th>Added By</th>
						<th>Date Added</th>
						<th>Rating</th>
					</tr>
				<tbody>
					<c:forEach items="${comments}" var="comment">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>

</html>