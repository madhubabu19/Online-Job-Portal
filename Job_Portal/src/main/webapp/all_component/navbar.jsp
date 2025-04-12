
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
<c:if test="${ empty userobj.role }">
	<a class="navbar-brand" href="index.jsp">Hustler-Meta-Space</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent">
		<span class="navbar-toggler-icon"></span>
	</button>
	</c:if>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		
		
		<li class="nav-item active"><a class="nav-link" href="logouthome"><%-- ADD HOME BAR HERE  --%>
					<span class="sr-only">(current)</span>
			</a></li>
			
			
<li class="nav-item"><a class="nav-link" href="https://www.instagram.com/hustler_meta_space/">
						<i class="fa-brands fa-instagram"></i>InstaProfile</a></li>
						
						
						<%-- for getting to know about object
    Object obj = session.getAttribute("userobj");
    out.println("Type of userobj: " + (obj != null ? obj.getClass().getName() : "null"));
--%>
						

			<c:if test="${  userobj.role eq 'admin' }">       
		<%-- 	<c:if test="${not empty userobj and userobj.role eq 'admin'}">      --%>
			    
				<li class="nav-item"><a class="nav-link" href="add_job.jsp"><i
						class="fa-solid fa-circle-plus"></i>Post JOb</a></li>

				<li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i
						class="fa-solid fa-eye"></i>View Job</a></li>

			</c:if>









		</ul>
		<form class="form-inline my-2 my-lg-0">

			<c:if test="${userobj.role eq 'admin' }">
				<a href="#" class="btn btn-light mr-2"><i
					class="fa-solid fa-user"></i> Admin</a>

				<a href="logout" class="btn btn-light"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>


			</c:if>



			<c:if test="${userobj.role eq 'User' }">
			
			
				<a href="" class="btn btn-light mr-2" data-toggle="modal" data-target="#exampleModal"><i class="fa-solid fa-user"></i>
					${userobj.name} </a>

				<a href="logout" class="btn btn-light"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>


			</c:if>





			<c:if test="${ empty userobj }">
				<a href="login.jsp" class="btn btn-light mr-2"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="signup.jsp" class="btn btn-light"><i
					class="fa-solid fa-user"></i> Signup</a>

			</c:if>


		</form>
	</div>
</nav>



















<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<div class="card">
			<div class="card-body">
			<div class="text-center text-primary">
			<i class="fas fa-user-circle fa-3x"></i> 
			
			</div>
			<table class="table">
			<tbody>
			<tr>
			<th scope="row">Name</th>
			<th>${userobj.name }</th>
			</tr>
			
			<tr>
			<th scope="row">Qualification</th>
			<th>${userobj.qualification }</th>
			</tr>
			
			<tr>
			<th scope="row">Email</th>
			<th>${userobj.email }</th>
			</tr>
			
			</tbody>
			</table>
			
			</div>
			</div>
			...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		<%-- <a href="edit_profile.jsp" class="btn btn-light"><i
					class="fa-solid fa-user"></i> Edit</a>
					
					--%>

			</div>
		</div>
	</div>
</div>