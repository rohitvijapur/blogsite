<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.entities.User" %>
<%@page import="com.blog.entities.Message" %>
<%@page errorPage="error_page.jsp" %>
<% 
User user=(User)session.getAttribute("currentUser");
if(user==null){
	response.sendRedirect("login_page.jsp") ;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User profile</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"crossorigin="anonymous">
<link href="css/myStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style >
	.banner-background{
	clip-path: polygon(50% 0%, 100% 0, 100% 85%, 88% 100%, 59% 86%, 46% 100%, 12% 87%, 0 100%, 0 0);
	}
</style>


</head>
<body>
		    
		  <nav class="navbar navbar-expand-lg navbar-light primary-background ">
		  <a class="navbar-brand" href="index.jsp"><span class="fa fa-bug fa-spin" ></span> BLOG</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item active">
		        <a class="nav-link" href="#">About<span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Project Area</a>
		      </li>
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Courses
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item" href="#">Java</a>
		          <a class="dropdown-item" href="#">MATLAB</a>
		          <div class="dropdown-divider"></div>
		          <a class="dropdown-item" href="#">Bitcoin</a>
		        </div>
		      </li>
		      
		       <li class="nav-item">
		        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class=" fa fa-asterisk"> Do post</span></a>
		      </li>
		 
		      
		  
		      
		      
		    </ul>
		   <ul class="navbar-nav mr-right">
		   	     <li class="nav-item">
		        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle mr-right"></span> <%= user.getName() %></a>
		     </li>
		   
		   		<li class="nav-item">
		        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out mr-right"></span> Log out</a>
		     </li>
	
		   				
		   </ul>
		   
		   
		  </div>
		</nav>



	<%
		Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>

	<%
		session.removeAttribute("msg");
	}
	%>


	<!-- Button trigger modal -->
		
		<!-- Modal -->
		<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content text-center">
					<div class="modal-header primary-background">
						<h5 class="modal-title " id="exampleModalLabel">Blog</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body ">
					<div class="container">
					<img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width: 100px">
					<br> 
						<h5 class="modal-title mt-3 mb-3" id="exampleModalLabel"><%= user.getName() %> </h5>
						
						<!-- details -->
						<div id="profile-details">
						<table class="table ">
							
							<tbody>
								<tr>
									<th scope="row">ID: </th>
									<td><%=user.getId() %></td>
									
								</tr>
								<tr>
									<th scope="row">Email: </th>
									<td><%=user.getEmail() %></td>
									
								</tr>
								<tr>
									<th scope="row">Gender: </th>
									<td><%=user.getGender() %></td>
									
								</tr>
								<tr>
									<th scope="row">Status: </th>
									<td><%=user.getUser_info() %></td>
									
								</tr>
								<tr>
									<th scope="row">Registered on: </th>
									<td><%=user.getDateTime().toString() %></td>
									
								</tr>
							</tbody>
						</table>
						</div>
						
						<!-- start profile edit -->
						
						<div id="profile-edit" style="display: none">
							<h3 class="mt-2">Please edit carefully</h3>
							<form action="EditServlet" method="post" enctype="multipart/form-data">
								<table class="table">
								   <tr>
								   		<td>Id: </td>
								   		<td><%=user.getId() %></td>
								   </tr>
								   
								    <tr>
								   		<td>Name: </td>
								   		<td><input type="text" class="form-control" name="user_name" value="<%=user.getName() %>" > </td>
								   </tr>
								    <tr>
								   		<td>Password: </td>
								   		<td><input type="text" class="form-control" name="user_password" value="<%=user.getPassword() %>" > </td>
								   </tr>
								   
								    <tr>
								   		<td>Email: </td>
								   		<td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail() %>" > </td>
								   </tr>
								   
								   <tr>
								   		<td>Gender: </td>
								   		<td><%=user.getGender().toUpperCase() %></td>
								   </tr>
								   
								   <tr>
								   		<td>About: </td>
								   		<td> 
								   			<textarea rows="3" class="form-control" name="user_about">
								   				<%=user.getUser_info() %>
								   			</textarea>
								   		</td>
								   </tr>
								   
								   <tr>
								   		<td>Update profile picture </td>
								   		<td>
								   			<input type="file" name="image" class="form-control" >	
								   		</td>
								   </tr>
								   
								
								</table>
								<div class="container">
									<button class="btn btn-outline-primary">Save</button>
								</div>
							</form>
						</div>

					</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
					</div>
				</div>
			</div>
		</div>
		
		<!--end profile modal-->
		
		<!--start post modal-->
		
		
			<!-- Modal -->
			<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Blog details</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      
			      
			      <div class="modal-body">
			        <form id="add-post-form"action="AddPostServlet" method="post">
			        		<div class="form-group">
			        		<select class="form-control" name="cid">
			        			<option selected disabled>---Select category---</option>
			        			
			        			<%
			        				PostDao postd=new PostDao(ConnectionProvider.getConnection());
			        				ArrayList<Category> list= postd.getAllCategories() ;
			        				for(Category c:list)
			        				{
			        			%>
			        			<option value="<%= c.getCid() %>"><%=c.getName() %></option>
			        			
			    
			        			<%
			        			  }
			        			%>
			        		</select>
			        		</div>
			        	
			        	<div class="form-group">
			        		<input name="pTitle" type="text" placeholder="Title" class="form-control">
			        	</div>
			        	
			        	<div class="form-group">
			        		<textarea name="pContent" class="form-control" style="height:200px;" placeholder="Enter your content" ></textarea>
			        	</div>
			        
			            <div class="form-group">
			        		<textarea name="pCode" class="form-control" style="height:200px;" placeholder="Enter your code(if any)" ></textarea>
			        	</div>
			        
			        	<div class="form-group">
			        		<label>Select your image</label>
			        		<br>
			        		<input type="file" name="pic">
			        	</div>
			   			
			   			<div class="container text-center">
			   				<button type="submit" class="btn btn-outline-primary">Post</button>
			   			</div>
		
			        
			        </form>
			        </div>
			        
			        </div>
			        </div>
			        </div>
			        
			        
			   
		<!--end post modal --> 
	
	
	<!-- javascript -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	<script src="js/myjs.js" type="text/javascript"></script>
	
	
	
	<script>
	
		let editStatus = false ;
		$(document).ready(function(){
			$("#edit-profile-button").click(function(){
				if(editStatus==false){
					$("#profile-details").hide()
					$("#profile-edit").show() ;
					editStatus = true ;
					$(this).text("Back");
				}
				
				else{
					$("#profile-details").show()
					$("#profile-edit").hide() ;
					editStatus = false ;
					$(this).text("Edit");
				}
			})
			
			
		});
		
		</script>	
	<!--add post js-->
	<script>
	$(document).ready(function (e) {
		$("#add-post-form").on("submit",function(event){
			//asynchronous type call
			event.preventDefault() ;
			console.log("submitted successfully") ;
			let form = new FormData(this) ;
			
			//request to server
			$.ajax({
				url: "AddPostServlet" ,
				type: 'POST' ,
				data: form,
				//success
				success:function(data,textStatus, jqXHR){
						console.log(data) ;
						if(data.trim()=="done"){
							swal("Good job!", "You clicked the button!", "success");
						}
						else{
							swal("Something went wrong", "Please try again later", "error");
						}
				},
				//error
				error: function(data,textStatus, errorThrown){
					swal("Something went wrong", "Please try again later", "error");
				},
				processData: false,
				contentType : false
			})
			
			
			
			
		})
		
		
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
	
	

</body>
</html>