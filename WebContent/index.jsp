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
</style>


</head>
<body>

	<%@ include file="normal_navbar.jsp"%>

	<!--banner-->
	<div class="container-fluid m-0 p-0 banner-background">
		<div class="jumbotron secondary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to BMSIT Blog page</h3>
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


	<div class="container">
		<div class="row mb-2 ">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Software</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Software</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Software</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
		</div>


	<div class="row">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Software</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Software</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read more</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card" style="width: 18rem;">

					<div class="card-body">
						<h5 class="card-title">Software</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
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