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
	<title>Create Rental Listing</title>
</head>
<body>
	<div class="card container bg-transparent mt-4 mb-4 p-4">
		<div class="d-flex col-12 mx-auto justify-content-between">
			<div class="my-3">
				<h2>Create Rental</h2>
			</div>
		</div>
		<div class="col-12 mx-auto">
			<form:form action="/properties/create" method="post"
				modelAttribute="createProject" class="p-4 bg-transparent text-dark">
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
					<form:label path="description" class="py-2">Rental Description: </form:label>
					<form:errors path="description" class="text-danger" />
					<form:textarea path="description" class="form-control h-25"
						rows="3" />
				</div>
				<div class="form-group">
					<form:label path="priceUSDPennies" class="py-2">Rental Price: </form:label>
					<form:errors path="priceUSDPennies" class="text-danger" />
					<form:input path="priceUSDPennies" class="form-control h-25"
						rows="3" />
				</div>
				<div class="form-group">
					<form:label path="imageUrl" class="py-2">Image URL: </form:label>
					<form:errors path="imageUrl" class="text-danger" />
					<form:input path="imageUrl" class="form-control h-25" rows="3" />
				</div>
				<div>
					<form:errors path="leader" class="error" />
					<form:input type="hidden" path="leader" value="${loggedInUser.id}"
						class="form-control" />
				</div>
				<a href="/dashboard" class="btn btn-secondary">Cancel</a><!-- update w/controller mapping -->
				<input type="submit" value="Create" class="btn btn-primary mx-1 my-3">
			</form:form>
		</div>
	</div>
</body>
</html>