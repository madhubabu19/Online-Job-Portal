<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Job</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
       <%@ include file="all_component/all_css.jsp"%> 
    
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<%@include file="all_component/navbar.jsp"%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow">
                <div class="card-body">
   <c:if test="${not empty succMsg }">             
                <div class="alert alert-success" role="alert">
  ${ succMsg}
</div>
<c:remove var="succMsg"/>
</c:if>
                    <h3 class="text-center mb-4"><i class="fa-solid fa-user-tie"></i>  Add Job</h3>

                    <form action="addjobpost" method="post">
                        <!-- Title -->
                        <div class="mb-3">
                            <label for="title" class="form-label">Enter Title</label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="Job Title" required>
                        </div>

                        <!-- Location -->
                        <div class="mb-3">
                            <label for="location" class="form-label">Location</label>
                            <select class="form-select" id="location" name="location" required>
                                <option value="">-- Select Location --</option>
                                <option value="Bangalore">Bangalore</option>
                                <option value="Hyderabad">Hyderabad</option>
                            </select>
                        </div>

                        <!-- Category -->
                        <div class="mb-3">
                            <label for="category" class="form-label">Category</label>
                            <select class="form-select" id="category" name="category" required>
                                <option value="">Choose</option>
                                <option value="IT">IT</option>
                                <option value="Developer">Developer</option>
                                <option value="Banking">Banking</option>
                                <option value="Engineer">Engineer</option>
                                <option value="Teacher">Teacher</option>
                            </select>
                        </div>

                        <!-- Status -->
                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="">-- Select Status --</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        
                           <!-- Apply Link -->
        <div class="mb-3">
            <label for="applyLink" class="form-label">Apply Link</label>
            <input type="url" class="form-control" id="applyLink" name="applyLink" placeholder="https://apply.example.com" required>
        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label for="description" class="form-label">Enter Description</label>
                            <textarea class="form-control" id="description" name="description" rows="5" placeholder="Enter job description here..." required></textarea>
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Publish Job</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
