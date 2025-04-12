
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@ include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img{
background:url("img/admin.jpg");
height: 90vh;
width:100%
background-repeat: no-repeat;
background-size: cover;
} 

</style>
</head>
<body>




<%@include file="all_component/navbar.jsp" %>

<div class="container-fluid back-img">
   <div class="text-center">
   <h1 class="text-white p-4">
   <i class="fa fa-book" aria-hiden="true"></i>Welcome Madhubabu(Admin)
   </h1>
   </div>
</div>
</body>
</html>