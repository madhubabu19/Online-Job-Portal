 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@page import="com.dao.JobDAO"%>
    <%@page import="java.util.*" %>
     <%@page import="com.entity.Jobs"%>
     <%@page import="com.db.DBConnect"%>
<%-- <%@ page import="java.util.*, yourpackage.Job" %> --%><!-- Replace with your actual Job class package -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <%@ include file="all_component/all_css.jsp"%>
</head>
<body>
 
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="all_component/navbar.jsp"%>
<h4 class="mb-3 text-center"><i class="fa-solid fa-users-gear"></i>   JOBS LIST</h4>
     <c:if test="${not  empty succMsg} ">
     
<h4 class="text-center text-success"> ${succMsg}</h4>
<c:remove var="succMsg" />
</c:if>    


<div class="container mt-5">
 	<div class="card mb-3 shadow-sm">
            <div class="card-body">
            	


    <!-- Filter Section -->
    <form action="more_view.jsp" method="get">
        <div class="row align-items-end mb-4">
            <!-- Location Dropdown -->
            <div class="col-md-4">
                <label for="location" class="form-label">Location</label>
                <select class="form-select" id="location" name="location">
                    <option value="lo">Select Location</option>
                    <option value="Hyderabad">Hyderabad</option>
                    <option value="Bangalore">Bengaluru</option>
                </select>
            </div>

            <!-- Category Dropdown -->
            <div class="col-md-4">
                <label for="category" class="form-label">Category</label>
                <select class="form-select" id="category" name="category">
                    <option value="ca">Select Category</option>
                    <option value="IT">IT</option>
                    <option value="Developer">Developer</option>
                    <option value="Banking">Banking</option>
                    <option value="Engineer">Engineer</option>
                    <option value="Teacher">Teacher</option>
                </select>
            </div>

            <!-- Submit Button -->
            <div class="col-md-4 text-end">
                <button type="submit" class="btn btn-primary mt-3">Submit</button>
            </div>
        </div>
    </form>
    </div>
    </div>

    <!-- Job Listings -->
    <div>
        
     
        <%
         JobDAO dao=new JobDAO(DBConnect.getConn()); 
       
        List<Jobs> list=dao.getAllJobsForUser();
        for(Jobs j: list){
        %>
      
         	<div class="card mb-3 shadow-sm">
            <div class="card-body">
            	
            
                <p><strong>Title:</strong> <%= j.getTitle() %></p>
                <p><strong>Description:</strong> <%= j.getDescription() %></p>
                <p><strong>Location:</strong> <%= j.getLocation() %></p>
                <p><strong>Category:</strong><%= j.getCategeory() %></p>
                <p><strong>Publish Date:</strong> <%= j.getPdate() %></p>
                 <a href="<%= j.getApplylink() %>" class="btn btn-success">
                        <i class="fa fa-edit"></i> Apply
                    </a>
            </div>
        </div>
        <%} %>
     <%-- 
        <div class="alert alert-info">No jobs found for the selected filters.</div>
         --%>
       
    </div>
</div>

</body>
</html>
