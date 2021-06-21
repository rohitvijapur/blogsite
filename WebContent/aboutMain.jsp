<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.entities.*" %>
<%@page errorPage="error_page.jsp" %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>

<!-- validation -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About</title>

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
		        <a class="nav-link" href="profile.jsp">Project Area</a>
		      </li>
		      
		      

		      
		    </ul>
		
		   
		   
		  </div>
		</nav>

	<!--banner-->
	<div class="container-fluid m-0 p-0 banner-background">
		<div class="jumbotron third-background">
			<div class="container">
			<h3 class="display-3">RV blogs</h3>
				<p>To emerge as one of the finest blogging sites of
					learning, to spread knowledge across the world with words.</p>
				<p>LEARNING SEES NO BOUNDARIES</p>
				<div>
					<h6>Contact : rohit.vijapur@gmail.com</h6>
					<h6>BMS Institute of Technology and Management,Yelhanka, Bengaluru.</h6>
				</div>
			

				


			</div>
		</div>
	</div>




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
	<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>