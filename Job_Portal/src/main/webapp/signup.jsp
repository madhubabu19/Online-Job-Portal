<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for icon (optional) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   <%@ include file="all_component/all_css.jsp"%> 
</head>
<body>
   <%@include file="all_component/navbar.jsp" %>
   
<div class="container-fluid">
    <div class="row justify-content-center align-items-center" style="height: 100vh;">
        <div class="col-md-5">
            <div class="card shadow-lg">
                <div class="card-body">
                    <div class="text-center mb-4">
                        <i class="fa-solid fa-user-plus fa-3x mb-2"></i>
                        <h2>Sign Up</h2>
                    </div>
                    
                    
                    
                    <c:if test="${not empty succMsg }">
                    <h4 class="text-center text-success">${succMsg }</h4>  <!-- success message -->
                    </c:if>
                    
                   
                    <form action="add_user" method="post">
                        <div class="mb-3">
                            <label for="fullname" class="form-label">Enter Full Name</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter your full name" required>
                        </div>

                        <div class="mb-3">
                            <label for="qualification" class="form-label">Enter Qualification</label>
                            <input type="text" class="form-control" id="qualification" name="qualification" placeholder="Enter your qualification" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Enter Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Enter Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
