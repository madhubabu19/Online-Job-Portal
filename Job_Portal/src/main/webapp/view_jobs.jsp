<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.*" %>
 <%@page import="com.dao.JobDAO" %>
 <%@page import="com.entity.Jobs" %>
 <%@page import="com.db.DBConnect" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Jobs</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome (optional for icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <%@ include file="all_component/all_css.jsp"%>
    
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>


   <%@include file="all_component/navbar.jsp" %>

<div class="container mt-5">
    <h2 class="text-center mb-4">All Job Listings</h2>
       <c:if test="${not empty succMsg }">             
                <div class="alert alert-success" role="alert">
  ${ succMsg}
</div>
<c:remove var="succMsg"/>
</c:if>
            

 <%--    <%
        List<Job> jobList = (List<Job>) request.getAttribute("jobList"); // Assuming list is set in controller/servlet
        if (jobList != null && !jobList.isEmpty()) {
            for (Job job : jobList) {
    %>    --%>
        
            
            <% 
            JobDAO dao= new JobDAO(DBConnect.getConn());
            List<Jobs> list=dao.getAllJobs();
            for(Jobs j:list){
            	%>
            	<div class="card mb-3 shadow-sm">
            <div class="card-body">
            	
            	
           
            
                <h4><strong>Title:  </strong><%=j.getTitle()%> </h4>
                <p><strong>Description:  </strong> <%=j.getDescription() %></p>
                <p><strong>Location:  </strong><%=j.getLocation() %> </p>
                <p><strong>Category:   </strong> <%=j.getCategeory() %></p>
                <p><strong>Status:  </strong><%=j.getStatus() %> </p>
                <p><strong>Publish Date:  </strong> <%= j.getPdate()%></p>
                 <p><strong>Apply link:  </strong> <%= j.getApplylink()%></p>

                <div class="d-flex gap-2 mt-3">
                    <a href="edit_job.jsp?id=<%=j.getId() %>" class="btn btn-success">
                        <i class="fa fa-edit"></i> Edit
                    </a>
                    <a href="delete?id=<%=j.getId() %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this job?');">
                        <i class="fa fa-trash"></i> Delete
                    </a>
                </div>
            </div>

        </div>
                     <% }
            
            %>
            
<%-- ----  <%
            }
        } else {
    %>
        <div class="alert alert-info text-center">No jobs available.</div>
    <%
        }
    %>               --- --%> 
</div>

</body>
</html>
