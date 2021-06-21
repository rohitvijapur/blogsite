<%@page import="com.blog.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.blog.dao.*"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"crossorigin="anonymous">
<link href="css/myStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style >
	.banner-background{
	clip-path: polygon(50% 0%, 100% 0, 100% 85%, 88% 100%, 59% 86%, 46% 100%, 12% 87%, 0 100%, 0 0);
	}
	
		body{
		background:url(img/blue.jpg);
		background-size: cover ;
		background-attachment: fixed ;
		
	}
</style>


</head>
<body>

	<%@ include file="normal_navbar.jsp"%>

	<!--banner-->
	<div class="container-fluid m-0 p-0 banner-background">
		<div class="jumbotron secondary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to RV Blogs</h3>
				<p>To emerge as one of the finest technical institutions of
					higher learning, to develop engineering professionals who are
					technically competent, ethical and environment friendly for
					betterment of the society.</p>
				<p>Accomplish stimulating learning environment through high
					quality academic instruction, innovation and industry-institute
					interface.</p>

				<button class="btn btn-outline-light btn-lg  ">
					<span class="	fa fa-binoculars"></span> TAKE A TOUR
				</button>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg ">
					<span class="	fa fa-user-circle"></span> Login
				</a>


			</div>
		</div>
	</div>
	
	
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
	
	
	<!--main body of the page!--> 
	
	<main>
	<div class="container">
		<div class="row mt-4">
		<!-- first col -->
			<div class="col-md-4">
				<!-- categories -->
				
					<div class="list-group">
					
						<a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active">
							All post
						</a>
						<!-- categories from database -->
						<%
							PostDao d = new PostDao(ConnectionProvider.getConnection()) ;
							ArrayList <Category> list1 = d.getAllCategories() ;
							for(Category cc: list1){
								%>
									<a href="#" onclick="getPosts(<%= cc.getCid()%>,this)" class=" c-link list-group-item list-group-item-action">
							 			<%= cc.getName() %>
								</a>
								
								<%
							}
						%>
								  
					</div>
		
			</div>
			
			<!-- second col -->
			<div class="col-md-8">
				<!-- posts -->
				
				<div class="cointainer text-center text-dark" id="loader">
				
					<i class="fa fa-refresh fa-4x fa-spin "></i>
					<h3 class="mt-2 text-dark">Loading...</h3>
				
				</div>
				
				<div class="container-fluid" id="post-container" >
				
				</div>
		
			</div>
		</div>
		
		
	
	</div>
	</main>
	
	<!-- end of main body -->
	



		
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

<!-- loading posts using ajax -->
	<script>
	
	
	function getPosts(catId,temp){

		$("#loader").show() ;
		$("#post-container").hide()
		
		
		 $(".c-link").removeClass('active') 
		$.ajax({
			url : "load_pagesForMain.jsp" ,
			data : {cid:catId} ,
			success : function(data, textStatus, jqXHR){
				console.log(data) ;
				$("#loader").hide() ;
				$("#post-container").show() ;
				$("#post-container").html(data) 
				
				$(temp).addClass('active')
			}
		})
		
		
		
	}
		$(document).ready(function (e) {
			let allPostRef =$('.c-link')[0] 
			getPosts(0, allPostRef) 
		
		})
	
	
	</script>
	



</body>
</html>