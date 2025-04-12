<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<%@ include file="all_component/all_css.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row justify-content-center align-items-center"
			style="height: 100vh;">
			<div class="col-md-4">
				<div class="card shadow-lg">
					<div class="card-body">
						<h2 class="text-center mb-4">
							<i class="fa-solid fa-user-plus"></i><br>Login Page
						</h2>
						
						        
						<c:if test="${ not empty succMsg}">
						<h4 class="text-center text-danger">${succMsg}</h4>
						<c:remove var="succMsg" />
						</c:if>
						
						
						
						
						 			
						<form action="login" method="post">
							<div class="form-group">
								<label for="email" class="form-label">Enter Email</label> <input
									type="email" class="form-control" id="email" name="email"
									placeholder="Enter your email" required>
							</div>

							<div class="form-group">
								<label for="password" class="form-label">Enter Password</label>
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Enter your password" required>
							</div>

							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
