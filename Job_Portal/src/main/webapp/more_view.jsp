<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
   <%@page import="com.dao.JobDAO"%>
    <%@page import="java.util.*" %>
     <%@page import="com.entity.Jobs"%>
     <%@page import="com.db.DBConnect"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>more View Jobs</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <%@ include file="all_component/all_css.jsp"%>
</head>
<body>
 
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>




<%@include file="all_component/navbar.jsp"%>
<h4 class="mb-3 text-center"><i class="fa-solid fa-users-gear"></i>  JOBS LIST</h4>
 <%--      <c:if test="${not  empty succMsg} }">
<h4 class="text-center text-danger"> ${succMsg}</h4>
</c:if>    --%>

		





<%

String loc = request.getParameter("location");
String cat = request.getParameter("category");



String msg = "";
JobDAO dao = new JobDAO(DBConnect.getConn());
List<Jobs> list = null;

// Check if location or category is not selected
if ("lo".equals(loc) && "ca".equals(cat)) {
    list = new ArrayList<Jobs>();
    msg = "Choose location or categeory or both";
} else if ("lo".equals(loc) || "ca".equals(cat)) {
    list = dao.getJobsORLocationAndCate(cat, loc);
   // out.println("either or ");
   // out.println(list);
    if(list.isEmpty())
    {
    	msg="there are no such jobs in database";
    }
   
} else {
    list = dao.getJobsAndLocationAndCate(cat, loc);
   // out.println("either and ");
   // out.println(list);
    if(list.isEmpty())
    {
    	msg="there are no such jobs in database";
    }
    
   }
%>

<%--
// You can store the list and msg in request scope to display later
 request.setAttribute("jobList", list);
request.setAttribute("msg", msg);
--%>
<%-- if(list.isEmpty()) 
{
	
	msg="there aare no jobs ";
	
}


--%>


<% 		if(list != null && !list.isEmpty()) {
		//	out.println(" for block is executing");
			for(Jobs j:list){
%>

<div class="container mt-5">
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
</div>
 <% 
	}
}
else if(list!=null && list.isEmpty()){
	%>
	
	<h4 class="text-center text-danger"><%=msg%></h4>
	<% 
}

else{
    %>
	
	<h4 class="text-center text-danger"><%=msg%></h4>
	<% 
}
	
%>









</body>
</html>
